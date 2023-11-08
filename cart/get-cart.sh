curl -K "$PROJECT_DIR/curl-config.txt" \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/{{USER}}/carts/{{CART}}" | jq
