FROM python:3.9-alpine

WORKDIR /code

ENV FLASK_APP=./code/application.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache python3-dev mariadb-dev build-base gcc musl-dev linux-headers

COPY ./code/requirements.txt requirements.txt


RUN pip install --upgrade pip\
    pip install --no-cache-dir -r requirements.txt 


EXPOSE 5000

COPY . .

CMD ["flask", "run"]