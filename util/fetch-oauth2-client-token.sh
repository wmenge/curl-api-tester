TOKEN_JSON=$(curl -K $PROJECT_DIR/curl-config.txt \
  --expand-url https://{{HOST}}/authorizationserver/oauth/token \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --expand-data "grant_type=client_credentials&scope={{SCOPE}}&client_id={{CLIENT_ID}}&client_secret={{CLIENT_SECRET}}"
  )

echo "${TOKEN_JSON}" | jq .

export ACCESS_TOKEN=$(echo "${TOKEN_JSON}" | jq .access_token -r)