FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# does nothing - just tells us this is exposed - 
# elastic beanstalk will look at this and map it
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html