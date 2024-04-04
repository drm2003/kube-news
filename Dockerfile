FROM node:20.10.0-alpine3.18

ENV DB_DATABASE=kubenews
ENV DB_USERNAME=kubenews
ENV DB_PASSWORD=Pg123
ENV DB_HOST=devops-postgres-volume

WORKDIR /app
COPY ./src/package*.json .

RUN npm install

COPY ./src .

EXPOSE 8080

CMD [ "node", "server.js" ]

#ENTRYPOINT [ "node", "server.js" ]

# docker build -f Dockerfile -t danielucb/devops-node-volume:v1.0 .
# docker run -dti --name devops-node-volume --network devops-rede -p 8080:8080 danielucb/devops-node-volume:v1.0