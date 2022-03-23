import json

import flask
from flask import Flask, jsonify, request, abort
import ml

app = Flask(__name__)


@app.route('/')
def hello():
    return "Hello World"


@app.route("/trainingModel", methods=['POST'])
def predictions():
    if flask.request.method == "POST":
        # retrieve the POSTed json data
        dataset = request.get_json()
        # dump dataset as it was converted to a python dictionary in get_json()
        formatDataset = json.dumps(dataset)
        # send the json dataset to the machine learning file that will return the 24 hour prediction
        prediction = ml.machineLearning(formatDataset)
        prediction_json = {}
        count = 0
        time = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        for hour in time:
            prediction_json[hour] = [int(prediction[count][0]), int(prediction[count][1]), int(prediction[count][2])]
            count = count + 1

        # convert python dictionary to json data and return it back the the application
        return jsonify(prediction_json)


if __name__ == "__main__":
    app.run(debug=True)
