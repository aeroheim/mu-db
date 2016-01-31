from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from config import SQLALCHEMY_DATABASE_URI

"""
init SQLAlchemy
"""
engine = create_engine(SQLALCHEMY_DATABASE_URI, echo=False)
Base = declarative_base(engine)

def loadSession():
    metadata = Base.metadata
    Session = sessionmaker(bind=engine)
    session = Session()
    return session

"""
models
"""

class Artist(Base):
    __tablename__ = 'artist'
    __table_args__ = {'autoload':True}

class Album(Base):
    __tablename__ = 'album'
    __table_args__ = {'autoload':True}

class AlbumGenres(Base):
    __tablename__ = 'albumgenres'
    __table_args__ = {'autoload':True}

class Track(Base):
    __tablename__ = 'track'
    __table_args__ = {'autoload':True}

class Genre(Base):
    __tablename__ = 'genre'
    __table_args__ = {'autoload':True}
