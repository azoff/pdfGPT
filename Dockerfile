FROM python:3.8-slim-buster as langchain-serve-img

WORKDIR /app

ADD api.py requirements.txt /app/
RUN pip3 install -r requirements.txt

CMD [ "lc-serve", "deploy", "local", "api" ]

FROM langchain-serve-img as pdf-gpt-img

WORKDIR /app

ADD app.py /app/

CMD [ "python3", "app.py" ]
