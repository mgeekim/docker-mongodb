VERSION=3.8
SERVICE=mongodb
YML=docker-compose.yml
ENV=./.env

rm -f $YML

cat << EOF > $YML
version: "$VERSION"
services:
    $SERVICE:
        image: \$IMAGE
        restart: always
        ports:
            - \$PORTS:\$PORTS
        env_file: $ENV
        volumes:
            - \$DB_PATH:/data/db
        environment:
            - MONGO_INITDB_ROOT_USERNAME=\$ROOT_NAME
            - MONGO_INITDB_ROOT_PASSWORD=\$ROOT_PASSWD
            - MONGO_INITDB_DATABASE=\$DB_NAME
EOF
