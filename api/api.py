from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_restful import Api,Resource,reqparse


app = Flask((__name__))
api=Api(app)


client = MongoClient("mongodb://localhost:27017")  
db = client["user"]  
collection = db["user"] 

create_arg=reqparse.RequestParser()
create_arg.add_argument("creation",type=str,help="none")

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

if __name__ == '__main__':
    app.run(host = '192.168.29.218',port = 5000, debug=True)