from node:alpine as base
WORKDIR /app
copy package.json .
run npm install
COPY . .
run npm run build


from nginx
copy --from=base /app/build /usr/share/nginx/html
