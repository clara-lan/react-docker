# multi steps build(two blocks using FROM statement)
# no dependencies for this image. for product version and travisCI test
# base image -  node:alpine
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second block with FROM statement, will start when the first is done
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
