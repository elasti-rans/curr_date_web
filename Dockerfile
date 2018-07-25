FROM python:3.6-alpine

RUN adduser -D web_app

WORKDIR /home/web_app

RUN python3.6 -m venv venv
COPY requirements.txt requirements.txt
RUN venv/bin/pip install -r requirements.txt

COPY curr_date curr_date
COPY _run.sh ./
RUN chmod +x _run.sh

RUN chown -R web_app:web_app ./
USER web_app

EXPOSE 5000
ENTRYPOINT ["./_run.sh"]
