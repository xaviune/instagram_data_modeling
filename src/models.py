import os
import sys
from sqlalchemy import Column, ForeignKey, Integer, String, Enum
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from eralchemy2 import render_er

Base = declarative_base()

class User(Base):
    __tablename__ = 'User'
    id = Column(Integer, primary_key=True)
    username = Column(String(20), nullable=False)
    name = Column(String(30), nullable=False)
    surname = Column(String(40), nullable=False)
    password = Column(String(60), nullable=False)
    email = Column(String(30), nullable=False)

class Followers(Base):
    __tablename__ = 'Followers'
    id = Column(Integer, primary_key=True)
    User_From_ID = Column(Integer, ForeignKey('User.id'))
    User_To_ID = Column(Integer, ForeignKey('User.id'))
   
class Post(Base):
    __tablename__ = 'Post'
    id = Column(Integer, primary_key=True)
    user_ID = Column(Integer, ForeignKey('User.id'))

class Media(Base):
    __tablename__ = 'Media'
    id = Column(Integer, primary_key=True)
    Column('type', Enum("IGTV", "Reels", "Photo"), nullable=False)
    url = Column(String(100), nullable=False)
    post_id = Column(Integer, ForeignKey('Post.id'))
class Comment(Base):
    __tablename__ = 'Comment'
    id = Column(Integer, primary_key=True)
    comment_text = Column(String(1000), nullable=False)
    author_ID = Column(Integer, ForeignKey('User.id'))
    post_ID = Column(Integer, ForeignKey('Post.id'))


    def to_dict(self):
        return {}

## Draw from SQLAlchemy base
try:
    result = render_er(Base, 'diagram.png')
    print("Success! Check the diagram.png file")
except Exception as e:
    print("There was a problem genering the diagram")
    raise e
