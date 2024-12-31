# temporary container
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# start nginx
# docker run -p 8080:8080 [image id]
