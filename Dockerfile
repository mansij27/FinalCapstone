FROM python:3.8 as build

WORKDIR /app

ADD . /app

COPY ./requirements.txt /app/requirements.txt

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver","0.0.0.0:8000"]
