curl -K "$PROJECT_DIR/curl-config.txt" \
  --variable ENTRY_GROUP_NUMBER=$1 \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/{{USER}}/carts/{{CART}}/entrygroups/{{ENTRY_GROUP_NUMBER}}" \
  -X DELETE | jq
