from flask import Flask, request, jsonify,url_for,send_file
from pymongo import MongoClient
from flask_restful import Api,Resource,reqparse
import pickle 
import numpy as np
import warnings
import time
import os
import json
from pytrie import StringTrie
from collections import Counter
from bson import Binary
import gridfs
from werkzeug.datastructures import FileStorage
from werkzeug.utils import secure_filename


data_path="data"
warnings.filterwarnings("ignore")
with open(os.path.join(data_path,"data.json"), "r") as json_file:
    loaded_data = json.load(json_file)

precaution=loaded_data["precaution"]
description=loaded_data["description"]
all_symp=loaded_data["all_symp"]
relsymp=loaded_data["relsymp"]
disease_dict=loaded_data["disease_dict"]
severity=loaded_data["severity"]

forest=pickle.load(open(os.path.join(data_path,"randomforest.pkl"),"rb"))



ALLOWED_EXTENSIONS = {'pdf', 'doc',"txt"}
MAX_CONTENT_LENGTH = 5 * 1024 * 1024  # 5MB

# api.config['UPLOAD_FOLDER'] = 'uploads'
# os.makedirs(api.config['UPLOAD_FOLDER'], exist_ok=True)


#DB and API initialization
app = Flask((__name__))
api=Api(app)

client = MongoClient("mongodb://localhost:27017")  
db = client["Whizz"]  
user = db["user_data"] 
hospital = db["healthcare_center"]
doctor= db["doctor"]

#Argument parsing
create_arg=reqparse.RequestParser()
create_arg.add_argument("creation",type=str,help="none")
predict_Arg=reqparse.RequestParser()
predict_Arg.add_argument("symptoms",type=str,help="Send symptoms seperated by '-'")
ask_arg=reqparse.RequestParser()
ask_arg.add_argument("selection",type=str,help="none")
complete_arg=reqparse.RequestParser()
complete_arg.add_argument("user_input",type=str,help="none")

doctor_status_update_arg=reqparse.RequestParser()
doctor_status_update_arg.add_argument("id",type=str,help="none")
doctor_status_update_arg.add_argument("status",type=bool,help="none")

# report_upload_arg=reqparse.RequestParser()
# report_upload_arg.add_argument("userid",type=str,help="none",required=True)
# report_upload_arg.add_argument("time",type=str,help="none",required=True)
# report_upload_arg.add_argument("location",type=str,help="none",required=True)
# report_upload_arg.add_argument("type",type=str,help="none",required=True)
# report_upload_arg.add_argument('file', type=FileStorage, location='files', required=True)


def related_symptoms(symp):
    top_n=5
    all_symptoms = [symptom for sublist in relsymp for symptom in sublist]
    relevant_combinations = [combo for combo in relsymp if all(symptom in combo for symptom in symp)]
    co_occurrence_counter = Counter(symptom for combo in relevant_combinations for symptom in combo if symptom not in symp)
    top_co_occurrence = sorted([symptom for symptom, _ in co_occurrence_counter.most_common(top_n)])
    return top_co_occurrence

def classify(sample):
    testx=np.zeros(len(all_symp),dtype=int)
    for i in sample:
        if type(i)==str:
            if i in all_symp:
                testx[all_symp.index(i)]=1

    cls=forest.predict([testx])   
    print(cls[0])
    return disease_dict[str(cls[0])]

def remove_id(data):
    del data[0]["_id"]
    return data

def build_trie(word_list):
    trie = StringTrie()
    for word in word_list:
        trie[word] = True
    return trie

def complete_words(trie, user_input):
    completions = trie.keys(prefix=user_input)
    return completions

def remove_id_mult(data):
    cleaned_data = []
    for h in data:
        h_without_id = {key: value for key, value in h.items() if key != "_id"}
        cleaned_data.append(h_without_id)
    return cleaned_data

def calculate_disease_severity(symptoms):
    relevant_scores = [severity.get(symptom, 0) for symptom in symptoms]
    severity_sum = sum(relevant_scores)

    min_severity = min(relevant_scores, default=1) 
    max_severity = max(relevant_scores, default=1)
    
    if min_severity == max_severity:
        normalized_severity = min_severity
    else:
        normalized_severity = (severity_sum - min_severity) / (max_severity - min_severity) * (5 - 1) + 1
    
    severity_rounded = round(normalized_severity)
    
    return max(1, min(severity_rounded, 5))


trie = build_trie(all_symp)

#User data methods
class check(Resource):
    def get(self):
        return {"message":"API active","status":True}
api.add_resource(check, "/")

class by_id(Resource):
    def get(self, id):
        data = list(user.find({"id":id}))
        if data:
            data=remove_id(data)
            return jsonify({
                "status": True,
                "data": data[0]
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            })
api.add_resource(by_id, "/user/<string:id>")

class by_email(Resource):
    def get(self, email):
        data = list(user.find({"email":email}))
        if data:
            data=remove_id(data)
            return jsonify({
                "status": True,
                "data": data[0]
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            })       
api.add_resource(by_email, "/user/email/<string:email>")

class by_phone(Resource):
    def get(self, mobile):
        data = list(user.find({"mobile":mobile}))
        if data:
            data=remove_id(data)
            return jsonify({
                "status": True,
                "data": data[0]
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            })
api.add_resource(by_phone, "/user/phone/<string:mobile>")
    
class create(Resource):
    def post(self):
        new_data = request.get_json(silent=True)

        if isinstance(new_data, dict):
            mobile = new_data["mobile"]
            mobile_data = list(user.find({"mobile":mobile}))
            if not mobile_data:
                user.insert_one(new_data) 
                return jsonify({
                "status":True,
                "message": "user created successfully"
            })
            else:
                return jsonify({
                "status": False,
                "message": "user already exists"
            })
        else:
            return jsonify({
            "status": False,
            "message": "user not created"
        })
api.add_resource(create, "/user/create")

# Disease prediction
class predict(Resource):
    def get(self):
        return {"message":"API active"}
        
    def post(self):
        args=predict_Arg.parse_args()
        symptoms=args["symptoms"].split("-")
        pred=classify(symptoms)
        return {"disease":pred,"symptoms":symptoms,"description":description[pred],"precaution":precaution[pred],"severity":calculate_disease_severity(symptoms)}

api.add_resource(predict,"/predict/")

# Related symptoms
class recommend(Resource):

    def post(self):
        args=ask_arg.parse_args()
        symp=args["selection"]
        if "-" in symp:
            symp=symp.split("-")
        else:
            symp=[symp]
        send=related_symptoms(symp)
 
        return {"symptoms":send}

api.add_resource(recommend,"/ask/")

#Search Healthcare centers
class nearbyhealthcare(Resource):
    def get(self):
        country = request.args['country']
        state = request.args.get('state',None)
        city = request.args.get('city',None)
        if  city and  state:
            data = list(hospital.find({"address.country":country,"address.state":state,"address.city":city}))
        elif not city and  state:
            data = list(hospital.find({"address.country":country,"address.state":state}))
        elif not city and not state:
            data = list(hospital.find({"address.country":country}))
        else:
            return jsonify({
                "status": False,
                "message": "Invalid request"
            })

        if data:
            cleaned_data = remove_id_mult(data)
            return jsonify({
                "status": True,
                "data": cleaned_data
            })
        else:
            return jsonify({
                "status": False,
                "message": "Healthcare not found"
            }) 

api.add_resource(nearbyhealthcare,"/nearbyHealthcare")


#Get HealthcareCenter by Id
class getHealthcareCenterById(Resource):
    def get(self, id):
        data = list(hospital.find({"id":id}))
        if data:
            data=remove_id(data)
            return jsonify({
                "status": True,
                "data": data[0]
            })
        else:
            return jsonify({
                "status": False,
                "message": "Hospital not found"
            })

api.add_resource(getHealthcareCenterById,"/getHealthcareCenterById/<string:id>")


class sympcomplete(Resource):
    def post(self):
        args=complete_arg.parse_args()
        user_input=args["user_input"]
        completions = complete_words(trie, user_input)
        return {"completions":completions}


api.add_resource(sympcomplete,"/sympcomplete")

#Doctor methods
class get_doctor_by_hid(Resource):
    def get(self,id):
        data = list(doctor.find({"health_care_id":id}))
        if data:
            cleaned_data = remove_id_mult(data)
            return jsonify({
                "status": True,
                "data": cleaned_data
            })
        else:
            return jsonify({
                "status": False,
                "message": "No doctors found"
            })

api.add_resource(get_doctor_by_hid,"/get_doctors_by_hid/<string:id>")

class doctor_status_update(Resource):
    def put(self):
        args=doctor_status_update_arg.parse_args()
        try:
            if list(doctor.find({"id":id})):
                doctor.update_one({"id":args["id"]},{"$set":{"available":args["status"]}})
                return jsonify({
                    "status": True,
                    "message": "status updated"
                })
            else:
                return jsonify({
                    "status": False,
                    "message": "doctor not found"
                })
        except:
            return jsonify({
                "status": False,
                "message": "status update failed"
            })

api.add_resource(doctor_status_update,"/doctor/status/")

class doctor_status_check(Resource):
    def get(self):
        id = request.args['id']
        data = list(doctor.find({"id":id}))
        if data:
            cleaned_data = remove_id(data)
            return jsonify({
                "status": True,
                "data": cleaned_data[0]["available"]
            })
        else:
            return jsonify({
                "status": False,
                "message": "doctor not found"
            })

api.add_resource(doctor_status_check,"/doctor/status/check")


#User report methods

class report_upload(Resource):
    def post(self):
        try:
            userid = request.form['userid']
            time = request.form['time']
            location = request.form['location']
            file_type = request.form['type']
            uploaded_file = request.files['file']
            if uploaded_file and allowed_file(uploaded_file.filename):
                if len(uploaded_file.read()) > MAX_CONTENT_LENGTH:
                    return jsonify({
                        "status": False,
                        "message": "File size exceeds the maximum allowed size (5MB)"
                    })
                # if fs.find_one({"filename": filename}):
                #     return jsonify({
                #         "status": False,
                #         "message": "File already exists"
                #     })
                filename = secure_filename(uploaded_file.filename)
                content_type = uploaded_file.content_type

                file_id = fs.put(uploaded_file.stream, filename=filename, content_type=content_type)
                file_id=str(file_id)
                file_url=url_for("report_upload",file_id=file_id,_external=True)

                reportdata={"userid": userid,
                            "time": time,
                            "location": location,
                            "filename": filename,
                            "content_type": content_type,
                            "type": file_type,
                            "file_id": file_id,
                            "file_url":file_url
                            }
                report_data.insert_one(reportdata)
                
                return jsonify({
                    "status": True,
                    "message": "File uploaded",
                    "file_id": str(file_id)
                })
            else:
                return jsonify({
                    "status": False,
                    "message": f"Invalid file format. Allowed formats:{' '.join(ALLOWED_EXTENSIONS)}"
                })
        except Exception as e:
            return jsonify({
                "status": False,
                "message": str(e)
            })
api.add_resource(report_upload,"/report/upload")

class get_user_reports(Resource):
    def get(self,userid):
        projection={"file_id":1,"file_url":1}
        data = list(report_data.find({"userid":userid},projection))
        print(data)
        if data:
            cleaned_data = remove_id_mult(data)
            return jsonify({
                "status": True,
                "data": cleaned_data
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            })
api.add_resource(get_user_reports,"/report/user/<string:userid>")

class report_url(Resource):
    def get(self):
        pass


if __name__ == '__main__':
    #uncomment this when using with flutter
    app.run(host = '192.168.1.15',port = 5000, debug=True)
#     app.run(debug=True)
"""
 todo
 Change the current ip address
 192.168.29.255

 """