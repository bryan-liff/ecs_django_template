ARG TARGET_TAG

FROM spony_app:${TARGET_TAG} as build
RUN python manage.py collectstatic --noinput

FROM nginx
ARG TARGET_TAG
COPY --from=build /app/static /app/static

RUN rm /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx.conf.$TARGET_TAG /etc/nginx/conf.d/nginx.conf