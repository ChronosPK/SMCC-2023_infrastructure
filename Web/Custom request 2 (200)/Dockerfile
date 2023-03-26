FROM python:3.7-alpine

RUN mkdir /app
COPY app/* /app

WORKDIR /app

ENTRYPOINT ["python"]
CMD ["/app/app.py"]
