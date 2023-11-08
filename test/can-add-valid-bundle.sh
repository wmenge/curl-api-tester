source "$PROJECT_DIR/util/assert.sh"

# Fixture: create new cart
$PROJECT_DIR/cart/create-cart.sh

# Test: Add portafilter SKU to cart
RESPONSE_BODY=$($PROJECT_DIR/bundle/add-bundle.sh)

echo $RESPONSE_BODY | jq

# Assert
STATUS1=$(echo $RESPONSE_BODY | jq -r .[0].statusCode)
STATUS2=$(echo $RESPONSE_BODY | jq -r .[0].statusCode)
assert "Bundle was added to cart" "'$STATUS1$STATUS2' == 'successsuccess'"

# Assert that portafilter has non zero price
