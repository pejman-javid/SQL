import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="*******",
)
mycursor = mydb.cursor()

sql = "CREATE DATABASE SHOP"
mycursor.execute(sql)

mydb = mysql.connemctor.connect(
    host="localhost",
    user="root",
    passwd="*******",
    database="SHOP"
)
mycursor = mydb.cursor()

sql = """
        CREATE TABLE Products(
            p_id INT auto_incerement,
            p_name VARCHAR(250),
            price INT,
            quantity INT,
            c_id INT,
            PRIMARY KEY(p_id),
            FOREIGN KEY(c_id) REFERENCES Category(c_id)
        );
    """
mycursor.execute(sql)

sql = """
        CREATE TABLE Category(
            c_id INT auto_incerement,
            c_name VARCHAR(250),
            PRIMARY KEY(c_id)
        );
    """
mycursor.execute(sql)

sql = "INSRET INTO Category(c_id,c_name)"
sql = "VALUES (1,'food'),(2,'clothes'),(3,'books')"
mycursor.execute(sql)
mydb.commit()

sql = "INSERT INTO Products(p_id,p_name,c_id,p,quantity)"  
sql = " VALUES (1,'pizza',1,3000,100),(2,'shoes',2,2000,100),(3,'comic book',3,1500,100)"
mycursor.execute(sql)
mydb.commit()

sql = "DELETE FROM Product WHERE p_id =3 "
mycursor.execute(sql)

sql = "DELETE FROM Category WHERE c_id = 1"
mycursor.execute(sql)

sql = "SELECT * FROM Products"
mycursor.execute(sql)
mycursor.fetchall()
sql = "UPDAIE Products SET price = price + price * 0.2 "
mycursor.execute(sql)

sql = "SELECT * FROM Products WHERE name = shoes"
mycursor.execute(sql)
mycursor.fetchall()

sql = "SELECT p_name FROM Products"
mycursor.execute(sql)
mycursor.fetchall()

sql = "SELECT c_name FROM Category"
mycursor.execute(sql)
mycursor.fetchall()