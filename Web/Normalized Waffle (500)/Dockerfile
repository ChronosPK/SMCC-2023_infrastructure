FROM python:3.7-alpine

# Set environment variables
ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1

# Install system dependencies, Install Python packages 
RUN apk add --no-cache build-base libffi-dev openssl-dev && pip3 install --no-cache-dir flask 

WORKDIR /app
COPY app/app.py app/hint.txt app/backdoor /app/
COPY app/flag.txt /tmp/

ENTRYPOINT ["python3", "app.py"]
