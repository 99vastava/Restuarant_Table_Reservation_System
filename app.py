from flask import Flask,render_template, request, redirect, session
import mysql.connector
import os
from datetime import datetime

app = Flask(__name__)
app.secret_key = os.urandom(24)

conn = mysql.connector.connect(host = "localhost", user = "root", database = "Resturant_Reservation" )
cursor = conn.cursor()

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/home')
def home():
    if 'user_id' in session:
        return render_template('home.html', username = session['name'], useremail = session['email'])
    else:
        return redirect('/')


@app.route('/validation_page', methods=['post'])
def loginValidation():
    email = request.form.get('email') 
    password = request.form.get('password')
    cursor.execute("""select * from customers where cust_email = '{}' and cust_password = '{}'""".format(email, password))
    customers = cursor.fetchall()
    if customers:
        session['loggedin'] = True
        session['id'] = customers[0][0]
        session['name'] = customers[0][1]
        session['email'] = customers[0][2]
    if len(customers) > 0:
        session['user_id']=customers[0][0]
        return redirect('/home')
    else :
        return redirect('/')

@app.route('/register_customer', methods=['post'])
def registerCust():
    name = request.form.get('c_name')
    email = request.form.get('c_email')
    password = request.form.get('c_password')
    confirm_pass = request.form.get('c_confirmPass')

    if password == confirm_pass:
        cursor.execute("""insert into customers (cust_id, cust_name, cust_email, cust_password, date) 
        values(NULL, '{}','{}','{}',now())""".format(name, email, password))
        conn.commit()
        return redirect('/')
    else:
        return redirect('/register')
    
@app.route('/logout')
def logout():
    session.pop('user_id')
    return redirect('/')

@app.route('/reservation', methods=['post'])
def tableReservation():
    date_time = request.form.get('reserve_date')
    date_str = date_time[0:16]
    period = date_time[-2:]
    seats = request.form.get('seats')
    #date_obj = datetime.strptime(date_str, "%m/%d/%Y %H:%M")

    cursor.execute("""insert into reservation(res_id, cust_id, res_date, period, seats, date) values(NULL, '{}', '{}', '{}', '{}', now())""".format(session['id'],date_str, period, seats))
    conn.commit()
    return redirect('/home')

@app.route('/show_reservations')
def showReservation():
    cursor.execute("""select res_id, concat(res_date, period) as dateTime, seats from reservation where cust_id = '{}'""".format(session['id']))
    reservation = cursor.fetchall()
    return render_template('reservations.html', reserve = reservation )  

@app.route('/delete/<string:ref_id>', methods=['post', 'get'])
def delete(ref_id):
    if 'user_id' in session:
        cursor.execute("""delete from reservation where res_id = '{}'""".format(ref_id))
        conn.commit()
        return redirect('/show_reservations')
    else:
        return redirect('/')
    

@app.route('/editProfile')
def editProfile():
    if 'user_id' in session:
        cursor.execute("""select cust_name, cust_email from customers where cust_id = '{}' """.format(session['id']))
        details = cursor.fetchall()
        return render_template('edit_profile.html', detail = details)
    else:
        return redirect('/')

@app.route('/updateProfile', methods=['post'])
def update():
    if 'user_id' in session:
         updated_name = request.form.get('updateName')
         updated_email = request.form.get('updateEmail')
         cursor.execute("""update customers set cust_name = '{}', cust_email = '{}' where cust_id = '{}' """.format(updated_name, updated_email, session['id']))
         conn.commit()
         return redirect('/editProfile')
    else:
        return redirect('/')


if __name__ == "__main__":
    app.run(debug=True)
