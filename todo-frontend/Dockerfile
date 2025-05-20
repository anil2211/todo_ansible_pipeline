# Stage 1: Build React app
FROM node:22-alpine AS build

WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . . 
RUN npm run build


# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


# # Stage 1: Build React app
# FROM node:22-alpine as build

# WORKDIR /app
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# # Stage 2: Serve with Nginx
# FROM nginx:alpine-slim
# WORKDIR /usr/share/nginx/html
# COPY --from=build /app/build . 
# # COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY nginx.conf /etc/nginx/nginx.conf

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# todo-app
# todo-frontend 
#   - build
#   - node modules
#   - public 
#   - src 
#      __test__
#      components
#      config
#      App.css
#      App.js
#      Dockerfile
#      index.css
#      index.html
#      index.js
#      logo.svg
#      package-lock.json
#      package.json
#      reportWebVitals.js
#      setupTests.js
#      style.css
#   .dockerignore
#   Dockerfile
#   nginx.conf
#   package-lock.json
#   package.json

     