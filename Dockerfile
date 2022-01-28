FROM python:3.9-slim as production

WORKDIR /app/

#environment variables
ENV PYTHONWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1

#install system dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    postgresql \



COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirments.txt

#copy project

COPY manage.py ./manage.py
COPY setup.cfg ./setup.cfg
COPY template_website ./template_website

EXPOSE 8000