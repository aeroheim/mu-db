from flask import Flask, render_template, jsonify, request
from db import models
from api.api import app
from api.resources.album import getAllAlbums

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/search')
def search():
    query = request.args.get('query')
    
    # empty query, return all albums
    if not query:
        result = getAllAlbums()
        print(result)
        return result;

    return "TESTING"

if __name__ == '__main__':
    app.run(debug=True)
