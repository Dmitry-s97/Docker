FROM nginx
COPY /04/Files/fastcgi.cpp /home/
COPY /04/Files/entrypoint.sh /home/
COPY /04/Files/nginx.conf /etc/nginx/
WORKDIR /home
RUN apt-get update && apt-get install -y g++ libfcgi-dev spawn-fcgi
CMD ["sh", "entrypoint.sh"]