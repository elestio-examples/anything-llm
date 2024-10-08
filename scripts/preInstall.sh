#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./storage
chown -R 1000:1000 ./storage

mkdir -p ./collector/hotdir
chown -R 1000:1000 ./collector/hotdir

cat << EOT >> ./docker.env

STORAGE_DIR='/app/server/storage'
SERVER_PORT='3001'
VECTOR_DB='lancedb'
LLM_PROVIDER='openai'
AUTH_TOKEN="${ADMIN_PASSWORD}"
JWT_SECRET="${ADMIN_PASSWORD}-${ADMIN_PASSWORD}=${ADMIN_PASSWORD}"
EOT

chown -R 1000:1000 ./docker.env
