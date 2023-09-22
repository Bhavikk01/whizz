from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_restful import Api,Resource,reqparse
import pickle 
import numpy as np
import warnings
import time
import os
import json

data_path="api\data"
warnings.filterwarnings("ignore")

with open(os.path.join(data_path,"data.json"), "r") as json_file:
    loaded_data = json.load(json_file)
precaution=loaded_data["precaution"]
description=loaded_data["description"]
all_symp=loaded_data["all_symp"]
relsymp=loaded_data["relsymp"]
disease_dict=loaded_data["disease_dict"]

forest=pickle.load(open(os.path.join(data_path,"randomforest.pkl"),"rb"))


#DB and API initialization
app = Flask((__name__))
api=Api(app)

client = MongoClient("mongodb://localhost:27017")  
db = client["Whizz"]  
user = db["user_data"] 
hospital = db["healthcare_center"]


#Argument parsing
create_arg=reqparse.RequestParser()
create_arg.add_argument("creation",type=str,help="none")
predict_Arg=reqparse.RequestParser()
predict_Arg.add_argument("symptoms",type=str,help="Send symptoms seperated by '-'")
ask_arg=reqparse.RequestParser()
ask_arg.add_argument("selection",type=str,help="none")


def related_symptoms(symp):
    result = []
    for sublist in relsymp:
        if any(items in sublist for items in symp):
            result.append(sublist)
    
    unique_elements = set()
    for sublist in result:
        if isinstance(sublist, list):
            for element in sublist:
                unique_elements.add(element)
        else:
            unique_elements.add(sublist)

    return list(unique_elements)

def classify(sample):
    testx=np.zeros(len(all_symp),dtype=int)
    for i in sample:
        if type(i)==str:
            if i in all_symp:
                testx[all_symp.index(i)]=1

    cls=forest.predict([testx])   
    return disease_dict[cls[0]]


#User data methods
class check(Resource):
    def get(self):
        return {"message":"API active","status":True}
api.add_resource(check, "/")

class by_id(Resource):
    def get(self, id):
        data = list(user.find({"id":id}))
        if data:
            del data[0]["_id"]
            return jsonify({
                "status": True,
                "data": data[0]
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            })
api.add_resource(by_id, "/user/id/<string:id>")

class by_email(Resource):
    def get(self, email):
        data = list(user.find({"email":email}))
        if data:
            del data[0]["_id"]
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
            del data[0]["_id"]
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
        return {"disease":pred,"symptoms":symptoms,"description":description[pred],"precaution":precaution[pred]}

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
 
        if len(send)!=0:
            for i in symp:
                send.remove(i)
        
        return {"symptoms":send}

api.add_resource(recommend,"/ask/")


class nearbyhealthcare(Resource):
    def get(self):
        country = request.args['country']
        state = request.args['state']
        city = request.args['city']
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
            cleaned_data = []
            for h in data:
                h_without_id = {key: value for key, value in h.items() if key != "_id"}
                cleaned_data.append(h_without_id)
            return jsonify({
                "status": True,
                "data": cleaned_data
            })
        else:
            return jsonify({
                "status": False,
                "message": "user not found"
            }) 

api.add_resource(nearbyhealthcare,"/nearbyhealthcare")



if __name__ == '__main__':
    #uncomment this when using with flutter
    # app.run(host = '192.168.118.27',port = 5000, debug=True)
    app.run(debug=True)