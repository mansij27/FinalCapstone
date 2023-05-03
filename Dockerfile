FROM python:3.8 as build

ENV PYTHONUNBUFFERED=1

WORKDIR /app

ADD . /app

COPY ./requirements.txt /app/requirements.txt

# FROM build as stage

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver"]