from flask import Flask, render_template, jsonify, request
from db import models as db
from sqlalchemy import or_, distinct
from api.api import app
from api.resources.album import getAllAlbums, getAlbumData

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/search')
def search():
    query = request.args.get('query')
    
    # Empty query, return all albums.
    if not query:
        return getAllAlbums()

    session = db.loadSession()
    
    album_ids = session.query(distinct(db.Album.id))\
                 .select_from(db.Artist)\
                 .join(db.Album)\
                 .join(db.AlbumGenres)\
                 .join(db.Genre)\
                 .filter(or_(db.Album.album_name.contains(query), db.Artist.artist_name.contains(query), db.Genre.genre_name.contains(query)))\
                 .all()

    session.close()

    album_ids = map(lambda x: x[0], album_ids)

    # Return all albums whose artist's name, genres, or album name contains the query.
    return jsonify(albums = [getAlbumData(album_id) for album_id in album_ids])

if __name__ == '__main__':
    app.run(debug=True)
