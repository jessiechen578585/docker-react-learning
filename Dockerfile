# temporary container
FROM node:16-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production container by copying from builder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


# start nginx
# docker run -p 8080:8080 [image id]
