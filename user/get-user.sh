curl -K $PROJECT_DIR/curl-config.txt \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/current" \
  -H 'Accept: application/json' | jq
