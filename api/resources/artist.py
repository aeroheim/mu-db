from flask import jsonify
from flask_restful import Resource
from sqlalchemy import distinct
from api.common.utils import map_keys

import db.models as db

class ArtistsResource(Resource):
    def get(self):
        """
        return JSON of all artists
        """
        session = db.loadSession()
        rowCount = session.query(db.Artist).count()
        session.close()

        return jsonify(artists = [getArtistData(artist_id) for artist_id in range(rowCount)])

class ArtistResource(Resource):
    def get(self, artist_id):
        """
        return JSON of artist with artist_id
        """
        return jsonify(getArtistData(artist_id))

def getArtistData(artist_id):
    
    session = db.loadSession()

    artist = session.query(db.Artist.id,
                           db.Artist.artist_name)\
              .select_from(db.Artist)\
              .filter(db.Artist.id == artist_id)\
              .first()

    album_list = session.query(db.Album.id,
                               db.Album.album_name,
                               db.Album.album_art,
                               db.Album.year)\
                  .select_from(db.Artist)\
                  .join(db.Album)\
                  .filter(db.Album.artist_id == artist_id)\
                  .all()

    genre_list = session.query(distinct(db.Genre.id),
                               db.Genre.genre_name)\
                  .select_from(db.Artist)\
                  .join(db.Album)\
                  .join(db.AlbumGenres)\
                  .join(db.Genre)\
                  .filter(db.Album.artist_id == artist_id)\
                  .all()

    session.close()
    
    keys = ('id', 'artist_name', ('albums', ('album_id', 'album_name', 'album_art', 'year')), ('genres', ('genre_id', 'genre_name')))
    result_tuple = artist + (album_list, genre_list)
    results_dict = map_keys(keys, result_tuple)

    return results_dict
 
