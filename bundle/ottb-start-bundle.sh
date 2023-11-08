curl -K "$PROJECT_DIR/curl-config.txt" \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users/{{USER}}/carts/{{CART}}/bundles" \
  -X POST \
  -H 'Content-Type: application/json' \
  --data '{
		"templateId": "GizmoApplianceComponent",
		"productCode": "gizmo_B_Bk",
		"quantity": 1
	}'  | jq
