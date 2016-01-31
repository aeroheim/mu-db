from flask import jsonify
from flask_restful import Resource
from sqlalchemy import distinct
from api.common.utils import map_keys

import db.models as db

class TracksResource(Resource):
    def get(self):
        """
        return JSON of all tracks
        """
        session = db.loadSession()
        rowCount = session.query(db.Track).count()
        session.close()

        return jsonify(tracks = [getTrackData(track_id) for track_id in range(rowCount)])

class TrackResource(Resource):
    def get(self, track_id):
        """
        return JSON of track with track_id
        """
        return jsonify(getTrackData(track_id))

def getTrackData(track_id):
    
    session = db.loadSession()
    
    track = session.query(db.Track.id,
                          db.Track.name,
                          db.Track.duration,
                          db.Track.album_id,
                          db.Album.album_name,
                          db.Artist.id,
                          db.Artist.artist_name)\
             .select_from(db.Track)\
             .join(db.Album)\
             .join(db.Artist)\
             .filter(db.Track.id == track_id)\
             .first()

    session.close()

    keys = ('id', 'track_name', 'duration', 'album_id', 'album_name', 'artist_id', 'artist_name')
    result_dict = map_keys(keys, track)

    return result_dict
