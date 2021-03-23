
# Return all items in the products collection
def getAll(conn):
    products = []
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM products")
    for row in cursor.fetchall():
        products.append({
            'id': row[0],
            'category': row[1],
            'name': row[2],
            'quantity': row[3]
        })
    return products

# Return the item from the products collection with the specified id
def getOne(conn, id):
    pass

# Create a new item in the products collection
def create(conn, product):
    pass

# Change one or more attributes of the item in the products collection with the specified id
def update(conn, id, product):
    pass

# Delete the item from the products collection with the specified id
def delete(conn, id):
    pass
