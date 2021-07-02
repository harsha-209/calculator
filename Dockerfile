FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install

COPY . .

#EXPOSE 3000

RUN npm run build 

#from nginx

#COPY --build from build-step /app/build  /usr/share/nginx/html/

FROM nginx:1.17.1-alpine
COPY --from=build-step /app/build /usr/share/nginx/html
