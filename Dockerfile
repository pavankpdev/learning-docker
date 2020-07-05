FROM node:13.12.0-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install 

COPY . ./

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

#blah
