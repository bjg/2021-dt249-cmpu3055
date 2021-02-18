import psycopg2
import yaml
from sys import stderr, argv

def getConfig():
    try:
        with open('config.yaml') as f:
            return yaml.load(f)
    except Exception as e:
        stderr.write(f"Can't open config file: {e}")
        exit()

def dbConnect(dbname, dbhost, user, password):
    try:
        return psycopg2.connect(
            dbname='cmpu3055_lab03',
            user=user,
            host=dbhost,
            password=password,
            port='5432',
            sslmode="require"
        )
    except Exception as e:
        stderr.write(f"Can't open database: {e}")
        exit()

def usersIndex(conn):
    users = []
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users")
    for row in cursor.fetchall():
        users.append({
            'id': row[0],
            'name': row[1],
            'email': row[2],
            'enabled': row[3]
        })
    return users

def main():
    dbname = argv[1]
    cfg = getConfig()
    db = cfg['databases'][dbname]
    conn = dbConnect(dbname, db['host'], db['user'], db['password'])
    print(usersIndex(conn))

if __name__ == '__main__':
    main()
