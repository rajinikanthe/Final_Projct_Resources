FROM node:alpine

WORKDIR /home/ubuntu/Project/Final_Projct_Resources

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY . .

CMD [ "node", "server.js" ]
