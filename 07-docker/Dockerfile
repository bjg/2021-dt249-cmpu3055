FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip build-essential
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENV FLASK_APP=server.py
ENTRYPOINT ["flask"]
CMD ["run", "--host", "0.0.0.0", "--port", "5000"]
