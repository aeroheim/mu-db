from flask import Flask, render_template, jsonify
from db import models
from api.api import app

@app.route('/')
@app.route('/index')
def index():
    return "Hello World!"

if __name__ == '__main__':
    app.run(debug=True)
