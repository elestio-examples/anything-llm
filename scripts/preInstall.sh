#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./storage
chown -R 1000:1000 ./storage

cat << EOT >> ./docker.env
STORAGE_DIR='/app/server/storage'
SERVER_PORT='3001'
EOT