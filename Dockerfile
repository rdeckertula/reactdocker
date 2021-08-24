FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# the second FROM statement ends the first block and begins the second
FROM nginx
# copying over from the builder phase specified earlier
# the /app/build item here is a little bit of magic we need to know about 
#   the output of `npm run build`
# the /usr/share/nginx/html item here is a little bit of magic we need to know about
#   the configuration for the nginx image
COPY --from=builder /app/build /usr/share/nginx/html
