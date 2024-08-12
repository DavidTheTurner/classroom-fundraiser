# syntax=docker/dockerfile:1

FROM python:3.9.13
COPY ./requirements.txt requirements.txt
RUN pip install --no-cache --upgrade -r requirements.txt
COPY ./main.py main.py
EXPOSE 8080
CMD ["fastapi", "run", "./main.py", "--port", "8080"]