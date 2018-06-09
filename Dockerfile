# Temporary builder image
FROM node:9-alpine as theme-builder

RUN npm install -g gulp
COPY themes /home/builder/themes
WORKDIR /home/builder/themes/custom/monoset

RUN npm install && \
    gulp sass && \
    gulp js


# Final drupal image
FROM gregoireweber/drupal8:latest

COPY --from=theme-builder /home/builder/themes themes