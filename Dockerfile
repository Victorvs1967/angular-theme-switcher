FROM node:18 as node

RUN mkdir /home/app
WORKDIR /home/app

RUN npm install -g @angular/cli
COPY package*.json ./
RUN npm install --legacy-peer-deps --omit=optional && npm cache clean --force
ENV PATH="/home/app/node_modules/.bin:$PATH"

COPY . .
RUN npm run build --prod

FROM nginx:latest
COPY default.conf /etc/nginx/conf.d
COPY --from=node /home/app/dist /usr/share/nginx/html
