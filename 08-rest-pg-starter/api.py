from flask import Flask, request
import json
import product

conn = None
app = Flask(__name__)

@app.route("/products")
def index():
    return json.dumps(product.getAll(conn))
