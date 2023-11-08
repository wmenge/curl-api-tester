curl -K $PROJECT_DIR/curl-config.txt \
  --expand-url "https://{{HOST}}/occ/v2/{{BASE_SITE}}/users" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'X-Anonymous-Consents: %5B%7B%22templateCode%22%3A%22MARKETING_NEWSLETTER%22%2C%22templateVersion%22%3A0%2C%22consentState%22%3A%22GIVEN%22%7D%5D' \
  --data '
{
    "firstName": "W",
    "lastName": "Menge",
    "phone": "06123456789",
    "streetName": "Street",
    "streetNumber": "31",
    "building": "",
    "town": "Zwolle",
    "postalCode": "1234 GS",
    "country": {
    "isocode": "NL"
    },
    "uid": "my.email@acorel.nl",
    "password": "mystrongpassword!",
    "titleCode": "mr"
}' | jq