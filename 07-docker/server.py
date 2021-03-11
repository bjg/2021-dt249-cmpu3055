from flask import Flask
import json

app = Flask(__name__)

customers = [
    {
        'id': 1,
        'name': 'Acme Ltd'
    },
    {
        'id': 2,
        'name': 'Garland Foods'
    }
]


@app.route("/customers/<int:id>")
def show(id: int):
    return json.dumps(customers[int(id)])


@app.route("/customers")
def index():
    return json.dumps(customers)
