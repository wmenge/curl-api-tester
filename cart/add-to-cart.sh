curl -K "$PROJECT_DIR/curl-config.txt" \
  --variable PRODUCT_CODE=$1 \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/{{USER}}/carts/{{CART}}/entries" \
  -X POST \
  -H 'Content-Type: application/json' \
  --expand-data '{"quantity":1,"product":{"code":"{{PRODUCT_CODE}}"}}' | jq
