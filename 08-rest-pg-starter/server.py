import psycopg2
import yaml
from sys import stderr, argv
from flask import Flask, request
import json
import product
import os

#
# Begin REST API Endpoints
#
app = Flask(__name__)
conn = None

@app.route("/products")
def index():
    return json.dumps(product.getAll(conn))

#
# End REST API Endpoints
#

def getConfig(section):
    try:
        with open('config.yaml') as f:
            return yaml.load(f)[section]
    except Exception as e:
        stderr.write(f"Can't open config file: {e}")
        exit()

def dbConnect(dbname, dbhost, user, password):
    try:
        return psycopg2.connect(
            dbname="postgres",
            user=f"{user}@{dbname}",
            host=dbhost,
            password=password,
            port='5432',
            sslmode="require"
        )
    except Exception as e:
        stderr.write(f"Can't open database: {e}")
        exit()

dbname = os.environ['DB_NAME']
cfg = getConfig('databases')
db = cfg[dbname]
conn = dbConnect(dbname, db['host'], db['user'], db['password'])
