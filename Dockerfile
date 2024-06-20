FROM mariadb:11

VOLUME ["./init_db.sql:/docker-entrypoint-initdb.d/init_db.sql"]

VOLUME ["mysql_data:/var/lib/mysql"]

EXPOSE 3306

ENV MARIADB_ROOT_PASSWORD=rootpass

ENV MARIADB_USER=guestuser
ENV MARIADB_PASSWORD=guestpassword
ENV MARIABD_DATABASE=guestbook

RUN mysql -u root -p rootpass --execute "GRANT ALL PRIVILEGES ON *.* TO 'guestuser'@'%';"