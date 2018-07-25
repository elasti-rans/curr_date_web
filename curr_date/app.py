"""THe web app with its view functions."""
import datetime

import flask
import flask_moment
import flask_bootstrap


app = flask.Flask(__name__)  # pylint: disable=invalid-name
bootstrap = flask_bootstrap.Bootstrap(app)  # pylint: disable=invalid-name
moment = flask_moment.Moment(app)  # pylint: disable=invalid-name


@app.route('/')
def curr_date_time():
    """A view function that return an html of the current date and time."""
    now = datetime.datetime.utcnow()
    return flask.render_template('curr_date_time.html', now=now)
