import datetime

import pytest

from curr_date import app


@pytest.fixture
def client():
    app.app.config['TESTING'] = True
    client = app.app.test_client()
    yield client


def test_curr_date_time(client):
    response = client.get('/')
    today = datetime.date.today()
    assert str(today.year) in response.data
