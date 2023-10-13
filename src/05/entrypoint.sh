#!/bin/bash

g++ -o fastcgi fastcgi.cpp -lfcgi
spawn-fcgi -p 8080 fastcgi
nginx -g "daemon off;"