from flask import Flask
from dotenv import load_dotenv
import os
import logging
from logging.handlers import RotatingFileHandler

from backend.db_connection import db
from backend.rushlens.location_store_routes import location_store
from backend.rushlens.analytics_routes import analytics
from backend.rushlens.traffic_input_routes import traffic_input
from backend.rushlens.user_customer_routes import user_customer

def create_app():
    app = Flask(__name__)

    app.logger.setLevel(logging.DEBUG)
    app.logger.info('API startup')

    # Configure file logging if needed
    #   Uncomment the code in the setup_logging function
    # setup_logging(app) 

    load_dotenv()


    # secret key that will be used for securely signing the session
    # cookie and can be used for any other security related needs by
    # extensions or your application
    # app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'
    app.config["SECRET_KEY"] = os.getenv("SECRET_KEY")

    # # these are for the DB object to be able to connect to MySQL.
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config["MYSQL_DATABASE_USER"] = os.getenv("DB_USER").strip()
    app.config["MYSQL_DATABASE_PASSWORD"] = os.getenv("MYSQL_ROOT_PASSWORD").strip()
    app.config["MYSQL_DATABASE_HOST"] = os.getenv("DB_HOST").strip()
    app.config["MYSQL_DATABASE_PORT"] = int(os.getenv("DB_PORT").strip())
    app.config["MYSQL_DATABASE_DB"] = os.getenv("DB_NAME").strip()  # Change this to your DB name

    # Initialize the database object with the settings above.
    app.logger.info("current_app(): starting the database connection")
    db.init_app(app)

    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.logger.info("create_app(): registering blueprints with Flask app object.")
    app.register_blueprint(location_store, url_prefix='/rushlens')
    app.register_blueprint(analytics, url_prefix='/rushlens')
    app.register_blueprint(traffic_input, url_prefix='/rushlens')
    app.register_blueprint(user_customer, url_prefix='/rushlens')
    # Don't forget to return the app object
    return app

    




def setup_logging(app):
    """
    Configure logging for the Flask application in both files and console (Docker Desktop for this project)
    
    Args:
        app: Flask application instance to configure logging for
    """
    # if not os.path.exists('logs'):
    #     os.mkdir('logs')

    ## Set up FILE HANDLER for all levels
    # file_handler = RotatingFileHandler(
    #     'logs/api.log',
    #     maxBytes=10240,
    #     backupCount=10
    # )
    # file_handler.setFormatter(logging.Formatter(
    #     '%(asctime)s %(levelname)s: %(message)s [in %(pathname)s:%(lineno)d]'
    # ))
    
    # Make sure we are capturing all levels of logging into the log files. 
    # file_handler.setLevel(logging.DEBUG)  # Capture all levels in file
    # app.logger.addHandler(file_handler)

    # ## Set up CONSOLE HANDLER for all levels
    # console_handler = logging.StreamHandler()
    # console_handler.setFormatter(logging.Formatter(
    #     '%(asctime)s %(levelname)s: %(message)s'
    # ))
    # Debug level capture makes sure that all log levels are captured
    # console_handler.setLevel(logging.DEBUG)
    # app.logger.addHandler(console_handler)
    pass
    
if __name__ == "__main__":
    app = create_app()
    app.run(debug=True, host='0.0.0.0', port=4000) 