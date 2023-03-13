FROM node:lts-alpine as build

WORKDIR src

COPY . .

RUN npm install \
    && npm run build

FROM moeryomenko/ngxjs:v0.0.2

COPY --from=build /src/dist /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]