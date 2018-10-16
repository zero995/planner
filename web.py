#!/usr/bin/env python
# coding=utf-8
from flask import Flask, render_template, request, redirect, url_for, abort, session, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = b'slknjfcoin23io0cmn0djhcimcm!"#%Riugh'
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:root@localhost/tasks"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(app)


class user(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    password = db.Column(db.String(255))


@app.route('/')
def index():
    if 'id_user' in session and 'name' in session:
        return redirect(url_for("home"))
    else:
        return render_template("Login.html")


@app.route('/home')
def home():
    return render_template("index.html")


@app.route('/logout')
def logout():
    try:
        del session['id_user']
        del session['name']
    except:
        pass
    return redirect(url_for("index"))


@app.route('/login', methods=['POST'])
def login():
    try:
        name = request.form['name']
        password = request.form['password']

        res = user.query.filter(user.name == name, user.password == password).all()

        if len(res) != 1:
            return jsonify(status="warning")
        else:
            session['id_user'] = res[0].id
            session['name'] = res[0].name
            return jsonify(status="ok")
    except:
        abort(400)


if __name__ == '__main__':
    app.run(debug=1, host="0.0.0.0")
