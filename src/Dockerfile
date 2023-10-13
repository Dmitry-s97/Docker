FROM nginx
RUN useradd -ms /bin/bash guest
COPY /04/fastcgi.cpp /home/
COPY /04/entrypoint.sh /home/
COPY /04/nginx.conf /etc/nginx/
USER root
RUN apt-get update && apt-get install -y g++ libfcgi-dev spawn-fcgi && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
WORKDIR /home
RUN chown -R guest:guest /home; \
  chmod 755 /home
USER guest
HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl -f http://localhost:80 || exit 1
CMD ["sh", "entrypoint.sh"]