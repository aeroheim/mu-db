from flask import jsonify
from flask_restful import Resource
from sqlalchemy import distinct
from api.common.utils import map_keys

import db.models as db

class GenresResource(Resource):
    def get(self):
        """
        return JSON of all genres
        """
        session = db.loadSession()
        rowCount = session.query(db.Genre).count()
        session.close()

        return jsonify(genres = [getGenreData(genre_id) for genre_id in range(rowCount)])

class GenreResource(Resource):
    def get(self, genre_id):
        """
        return JSON of genre with genre_id
        """
        return jsonify(getAlbumData(genre_id))

def getGenreData(genre_id):
    
    session = db.loadSession()

    genre = session.query(db.Genre.id,
                          db.Genre.genre_name)\
             .select_from(db.Genre)\
             .filter(db.Genre.id == genre_id)\
             .first()

    artist_list = session.query(distinct(db.Artist.id),
                                db.Artist.artist_name)\
                   .select_from(db.Genre)\
                   .join(db.AlbumGenres)\
                   .join(db.Album)\
                   .join(db.Artist)\
                   .filter(db.Genre.id == genre_id)\
                   .all()

    album_list = session.query(db.Album.id,
                               db.Album.album_name,
                               db.Album.album_art)\
                  .select_from(db.Genre)\
                  .join(db.AlbumGenres)\
                  .join(db.Album)\
                  .filter(db.Genre.id == genre_id)\
                  .all()

    session.close()

    keys = ('id', 'genre_name', ('artists', ('artist_id', 'artist_name')), ('albums', ('album_id', 'album_name', 'album_art')))
    result_tuple = genre + (artist_list, album_list)
    result_dict = map_keys(keys, result_tuple)

    return result_dict
