curl -K "$PROJECT_DIR/curl-config.txt" \
  --variable ENTRY_NUMBER=$1 \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/{{USER}}/carts/{{CART}}/entries/{{ENTRY_NUMBER}}" \
  -X DELETE | jq

