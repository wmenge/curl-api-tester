# curl-api-tester

## Prerequisites:
curl >= 8.3.0 (because of variable substition)
jq (for json pretty printing and variable extraction)
direnv (for loading environment variables)
tree

## Usage:


### Step 1: Get token

```
. ./util/fetch-oauth-client-token.sh
```

or 
```
. ./util/fetch-oauth-user-token.sh
```
(. or source is needed to let the command set the variable in the current terminal session)

### Step 2: Execute request...
```
cart/create-cart.sh
cart/add-to-cart.sh ProductID
```

### ... or run test case:
```
test/can-add-product-to-cart.sh
```

Now you are ready to add additional requests...
