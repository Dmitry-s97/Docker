FROM nginx

RUN useradd -ms /bin/bash guest
COPY ./fastcgi.cpp /home/
COPY ./entrypoint.sh /home/
COPY ./nginx.conf /etc/nginx/

USER root
RUN apt-get update && apt-get install -y g++ libfcgi-dev spawn-fcgi && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
WORKDIR /home

RUN chown -R guest:guest /home; \
  chmod 755 /home; \
  chown -R guest:guest /etc/nginx; \
  chmod 755 /etc/nginx; \
  chown -R guest:guest /var/cache/nginx; \
  chmod 755 /var/cache/nginx; \
  chown -R guest:guest /var/run/; \
  chmod 755 /var/run; \
  chmod u-s /usr/bin/chage; \
  chmod g-s /usr/bin/chage; \
  chmod g-s /usr/bin/wall; \
  chmod g-s /usr/bin/expiry; \
  chmod u-s /usr/bin/gpasswd; \
  chmod g-s /usr/sbin/unix_chkpwd; \
  chmod u-s /usr/bin/chfn; \
  chmod u-s /usr/bin/umount; \
  chmod u-s /usr/bin/newgrp; \
  chmod u-s /usr/bin/su; \
  chmod u-s /usr/bin/mount; \
  chmod u-s /usr/bin/chsh; \
  chmod u-s /usr/bin/passwd
USER guest

HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl -f http://localhost:80 || exit 1
CMD ["sh", "entrypoint.sh"]