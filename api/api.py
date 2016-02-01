from flask import Flask
from flask_restful import Resource, Api
from flask_jsglue import JSGlue
from api.resources.album import *
from api.resources.artist import *
from api.resources.track import *
from api.resources.genre import *

app = Flask(__name__, template_folder='../templates', static_folder='../static')
api = Api(app)
jsglue = JSGlue(app)

api.add_resource(AlbumsResource, '/album')
api.add_resource(AlbumResource, '/album/<int:album_id>')
api.add_resource(ArtistsResource, '/artist')
api.add_resource(ArtistResource, '/artist/<int:artist_id>')
api.add_resource(TracksResource, '/track')
api.add_resource(TrackResource, '/track/<int:track_id>')
api.add_resource(GenresResource, '/genre')
api.add_resource(GenreResource, '/genre/<int:genre_id>')
