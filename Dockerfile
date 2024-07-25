FROM python:3.12.0 AS base

RUN apt update && \
    pip install --upgrade pip

WORKDIR /home/app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

FROM base AS dev

EXPOSE 5000

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]