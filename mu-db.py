from flask import Flask, render_template, jsonify
import models as db

"""
init app
"""
app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return "Hello World!"

if __name__ == '__main__':
    app.run(debug=True)
