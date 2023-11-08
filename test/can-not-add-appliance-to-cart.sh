source "$PROJECT_DIR/util/assert.sh"

# Fixture: create new cart
$PROJECT_DIR/cart/create-cart.sh

# Test Add Appliance SKU to cart
RESPONSE_BODY=$($PROJECT_DIR/cart/add-to-cart.sh gizmo_B_Bk)

echo $RESPONSE_BODY | jq

# Assert
MESSAGE=$(echo $RESPONSE_BODY | jq -r .errors[0].type)
assert "Appliance was not added to cart" "'$MESSAGE' == 'CommerceCartModificationError'"