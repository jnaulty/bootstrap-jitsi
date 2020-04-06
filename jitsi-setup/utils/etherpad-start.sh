source ../secrets/secrets.env

docker run -d \
        --name etherpad \
        -p 9001:9001 \
        --net=host \
        -e 'ADMIN_PASSWORD=${ETHERPAD_ADMIN_PASSWORD}'  \
        -e 'NODE_ENV=production' \
        -e 'DB_TYPE=postgres'   \
        -e 'DB_HOST=localhost'   \
        -e 'DB_PORT=5432'       \
        -e 'DB_NAME=postgres'   \
        -e 'DB_USER=postgres' \
        -e 'DB_CHARSET=utf8mb4' \
        -e 'DB_PASS=${ETHERPAD_POSTGRES_PASSWORD}' \
        etherpad/etherpad
docker run \
        --name etherpad-postgres \
        -e POSTGRES_PASSWORD=${ETHERPAD_POSTGRES_PASSWORD} \
        --net=host \
        -p 5432:5432 \
        -d postgres

