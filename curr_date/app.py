"""THe web app with its view functions."""
import datetime

import flask


app = flask.Flask(__name__)  # pylint: disable=invalid-name


@app.route('/')
def curr_date_time():
    """A view function that return an html of the current date and time."""
    now = datetime.datetime.utcnow()
    return flask.render_template('curr_date_time.html', now=now)
