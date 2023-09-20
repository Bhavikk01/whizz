from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_restful import Api,Resource,reqparse
import pickle 
import numpy as np
import warnings
import time
import os

model_path="api\data"
warnings.filterwarnings("ignore")
precaution=pickle.load(open(os.path.join(model_path,"precaution_dict.pkl"),"rb"))
description=pickle.load(open(os.path.join(model_path,"description_dict.pkl"),"rb"))
forest=pickle.load(open(os.path.join(model_path,"randomforest.pkl"),"rb"))
all_symp=list(pickle.load(open(os.path.join(model_path,"symptoms.pkl"),"rb")))
relsymp=list(pickle.load(open(os.path.join(model_path,"rel-symp.pkl"),"rb")))
disease_dict=pickle.load(open(os.path.join(model_path,"disease_dict.pkl"),"rb"))


#DB and API initialization
app = Flask((__name__))
api=Api(app)
client = MongoClient("mongodb://localhost:27017")  
db = client["user"]  
collection = db["user"] 

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
        data = list(collection.find({"id":id}))
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
api.add_resource(by_id, "/user/<string:id>")

class by_email(Resource):
    def get(self, email):
        data = list(collection.find({"email":email}))
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
        data = list(collection.find({"mobile":mobile}))
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
            mobile_data = list(collection.find({"mobile":mobile}))
            if not mobile_data:
                collection.insert_one(new_data) 
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

if __name__ == '__main__':
    #uncomment this when using with flutter
    # app.run(host = '192.168.118.27',port = 5000, debug=True)
    app.run(debug=True)