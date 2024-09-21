FROM node:20.11.1 AS builder
WORKDIR /app
COPY . .
RUN npm install -g @angular/cli@17
RUN yarn install
RUN ng build

FROM nginx:latest
RUN rm -r /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/dist/angular-conduit/browser .
