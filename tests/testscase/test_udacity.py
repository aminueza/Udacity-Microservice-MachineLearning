import requests
import json


def call_web_service(url="http://localhost:8000"):
    res = requests.get(url)
    return res


def predict():
    return {
        "CHAS": {
            "0": 0
        },
        "RM": {
            "0": 6.575
        },
        "TAX": {
            "0": 296.0
        },
        "PTRATIO": {
            "0": 15.3
        },
        "B": {
            "0": 396.9
        },
        "LSTAT": {
            "0": 4.98
        }
    }


def post_music(url="http://localhost:8000/predict"):
    res = requests.post(
        url, headers={'content-type': 'application/json'}, data=json.dumps(predict()),)
    return res
