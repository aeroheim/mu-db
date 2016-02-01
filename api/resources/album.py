from flask import jsonify
from flask_restful import Resource
from api.common.utils import map_keys

import db.models as db

class AlbumsResource(Resource):
    def get(self):
        """
        return JSON of all albums
        """ 
        return getAllAlbums()

class AlbumResource(Resource):
    def get(self, album_id):
        """
        return JSON of album with album_id
        """
        return jsonify(getAlbumData(album_id))

def getAllAlbums():
        session = db.loadSession()
        rowCount = session.query(db.Album).count()
        session.close()        

        return jsonify(albums = [getAlbumData(album_id) for album_id in range(rowCount)])

def getAlbumData(album_id):
    
        session = db.loadSession()

        album = session.query(db.Album.id, 
                              db.Album.artist_id,
                              db.Album.album_name,
                              db.Artist.artist_name,
                              db.Album.album_art,
                              db.Album.type,
                              db.Album.year,
                              db.Album.bc_link)\
                 .select_from(db.Album)\
                 .join(db.Artist)\
                 .filter(db.Album.id == album_id)\
                 .first()

        track_list = session.query(db.Track.id,
                                   db.Track.name)\
                      .select_from(db.Track)\
                      .filter(db.Track.album_id == album_id)\
                      .all()
        
        genre_list = session.query(db.Genre.genre_name)\
                      .select_from(db.Album)\
                      .join(db.AlbumGenres)\
                      .join(db.Genre)\
                      .filter(db.Album.id == album_id)\
                      .all()

        session.close()
        
        keys = ('id', 'artist_id', 'album_name', 'artist_name', 'album_art', 'type', 'year', 'bc_link', ('genres', ('genre_name',)), ('tracks', ('track_id', 'track_name')))
        result_tuple = album + (genre_list, track_list)
        results_dict = map_keys(keys, result_tuple)

        return results_dict
