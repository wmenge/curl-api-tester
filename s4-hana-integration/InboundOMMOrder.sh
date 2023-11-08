curl -K "$PROJECT_DIR/curl-config.txt" \
  --variable PERSISTENCE_HOOK=$1 \
  --expand-url "https://{{HOST}}/odata2webservices/InboundOMMOrder/Orders" \
  -u "admin:nimda" \
  -X POST \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  --expand-header 'Pre-Persist-Hook: {{PERSISTENCE_HOOK}}' \
  --expand-data '{ "code": "0000002000", "sapPlantCode": "PL30", "sapGoodsIssueDate": "2019-07-03T12:34:56", "sapRejectionReason": "Other" }' | jq
