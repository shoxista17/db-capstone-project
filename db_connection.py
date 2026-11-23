import mysql.connector

connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="YOUR_PASSWORD",
    database="LittleLemonDB"
)

cursor = connection.cursor()

# 1. GetMaxQuantity()
cursor.callproc("GetMaxQuantity")
for result in cursor.stored_results():
    print("Max Quantity:", result.fetchall())

# 2. ManageBooking()
cursor.callproc("ManageBooking", ["2022-10-10", 5])
for result in cursor.stored_results():
    print("ManageBooking:", result.fetchall())

# 3. AddBooking()
cursor.callproc("AddBooking", [9, 1, "2022-12-10", 4])
connection.commit()
for result in cursor.stored_results():
    print("AddBooking:", result.fetchall())

# 4. UpdateBooking()
cursor.callproc("UpdateBooking", [9, "2022-12-15"])
connection.commit()
for result in cursor.stored_results():
    print("UpdateBooking:", result.fetchall())

# 5. CancelBooking()
cursor.callproc("CancelBooking", [9])
connection.commit()
for result in cursor.stored_results():
    print("CancelBooking:", result.fetchall())

cursor.close()
connection.close()
