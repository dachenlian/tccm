FROM httpd:2.4

RUN /bin/bash -c 'apt-get update; apt-get install perl build-essential gcc-multilib g++-multilib -y'

COPY ./unix-clan /var/www/html/unix-clan
RUN /bin/bash -c 'cd /var/www/html/unix-clan/src; pwd; make -f makefile'
RUN /bin/bash -c 'mkdir /var/www/html/bin; \
mv /var/www/html/unix-clan/unix/bin /var/www/html/bin/'
COPY ./www /var/www/html/

