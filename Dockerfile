FROM jenkins/jenkins/jenkins:lts
USER root
EXPOSE 8080:8080
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip install pytest request
RUN pip install --no-cache-dir --upgrade -r /home/requirements.txt
COPY ./app /home/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]