source "$PROJECT_DIR/util/assert.sh"

# Fixture: create new cart
$PROJECT_DIR/cart/create-cart.sh > /dev/null

# Fixture: Add Complete to cart
$PROJECT_DIR/bundle/add-bundle.sh > /dev/null

# Test: Bundle should be valid
RESPONSE_BODY=$($PROJECT_DIR/cart/validate-cart.sh)
ERROR_COUNT=$(echo $RESPONSE_BODY | jq '.cartModifications | length')
assert "Bundle is valid before removing component" "'$ERROR_COUNT' == '0'"

# Fixture: Remove an entry that is part of the bundle
$PROJECT_DIR/cart/remove-cart-entry.sh 0

# Test: bundle should be invalid
RESPONSE_BODY=$($PROJECT_DIR/cart/validate-cart.sh)
ERROR_COUNT=$(echo $RESPONSE_BODY | jq '.cartModifications | length')
assert "Bundle is not valid after removing component" "'$ERROR_COUNT' == '1'"
