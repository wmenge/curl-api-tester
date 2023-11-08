source "$PROJECT_DIR/util/assert.sh"

# Fixture: create new cart
$PROJECT_DIR/cart/create-cart.sh

# Test: Add portafilter SKU to cart
RESPONSE_BODY=$($PROJECT_DIR/cart/add-to-cart.sh gizmop_Bk)

# echo $RESPONSE_BODY | jq

# Assert
STATUS=$(echo $RESPONSE_BODY | jq -r .statusCode)
assert "Portafilter was added to cart" "'$STATUS' == 'success'"

# Assert that portafilter has non zero price
