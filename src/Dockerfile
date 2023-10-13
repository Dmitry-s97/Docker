FROM nginx

COPY /04/fastcgi.cpp /home/
COPY /04/entrypoint.sh /home/
COPY /04/nginx.conf /etc/nginx/

RUN apt-get update && apt-get install -y g++ libfcgi-dev spawn-fcgi && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
WORKDIR /home

CMD ["sh", "entrypoint.sh"]