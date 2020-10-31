from flask import Flask, jsonify, request
from deploy1 import *
import csv

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def index():
  _json = request.json
  symptoms = _json["symptoms"]
  pred = prd(symptoms)
  return jsonify(pred)

@app.route('/description/<name>', methods=['GET'])
def description(name):
  with open('./data/Description.csv') as file:
    reader = csv.reader(file, delimiter=',')
    for row in reader:
      if row[0] == name:
        return jsonify(row[1])
  return "No such Disease in the Database"

@app.route('/precaution/<name>', methods=['GET'])
def precaution(name):
  with open('./data/Precaution.csv') as file:
    reader = csv.reader(file, delimiter=',')
    for row in reader:
      if row[0] == name:
        return jsonify(row[1:])
  return "No such Disease in the Database"


if __name__ == '__main__':
  # app.run(debug = True)
  app.run()
