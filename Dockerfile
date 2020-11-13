FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn start

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
