FROM python:3.8-slim-bullseye

RUN apt update && apt install -y gcc libmariadb-dev-compat

RUN pip install gunicorn

WORKDIR /app

COPY django_app/requirements.txt .

RUN pip install -r /app/requirements.txt

COPY django_app/ /app/

CMD sleep 5
CMD python manage.py migrate

EXPOSE 80/tcp

ENTRYPOINT gunicorn -w 4 k8s.wsgi -b 0.0.0.0:80

