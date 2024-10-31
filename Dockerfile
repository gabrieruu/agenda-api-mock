FROM node:alpine3.19

WORKDIR /app

RUN npm install -g json-server

COPY db.json /app/db.json

EXPOSE 3000

CMD ["json-server", "--watch", "db.json", "--host", "localhost", "--port", "3000"]
