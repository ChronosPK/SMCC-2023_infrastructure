FROM python:3.7-alpine

RUN mkdir /app && pip3 install --no-cache-dir flask
COPY app/app.py /app
COPY app/flag.txt /tmp

WORKDIR /app

ENTRYPOINT ["python"]
CMD ["/app/app.py"]

