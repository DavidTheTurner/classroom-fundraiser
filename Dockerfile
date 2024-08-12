# syntax=docker/dockerfile:1

FROM python:3.9.13

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

COPY ./requirements.txt requirements.txt
RUN pip install --no-cache --upgrade -r requirements.txt

COPY ./main.py main.py

EXPOSE 8080

USER appuser

CMD ["fastapi", "run", "./main.py", "--port", "8080"]