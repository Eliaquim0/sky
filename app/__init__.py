from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from flask import flash


app = Flask(__name__)
app.config ['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:123456@localhost/SITE'
app.config['SECRET_KEY'] = '123456'
UPLOAD_FOLDER = 'app/static/upload'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16* 1024 * 1024

login_manager = LoginManager(app)
db = SQLAlchemy(app)
