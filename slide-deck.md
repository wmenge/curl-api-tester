# What you should not do ;)

A short talk on: 
* developing an alternative to Postman and Insomnia and 
* What I've learned from doing that

(Yes, this presentation runs in my terminal)

---

# Shitification

https://en.wiktionary.org/wiki/shittification

## Etymology
From shit + -ification.

## Noun
shittification (uncountable)

1. (vulgar, nonstandard) The process of shittifying or becoming shitty. 

Antonym: (nonstandard) goodification

# All the web is affected
Postman and Insomnia move to a cloud model, where you no longer
own your own data. 
## Larger issue: you are at the mercy of ever changing decisions and policies.

---

# Postman/Insomnia features to replace

I use Postman/Insomnia as API exploration and test tooling

Features I like:
* Nice UI
* Nested collection of API calls per project
* Variable capture and substitution in urls, header, bodies
* Testing harness to do integration/e2e testing

## Unix philosophpy
* Write programs that do one thing and do it well.
* Write programs to work together.
* Write programs to handle text streams, because that is a universal interface.

# Surely most of these things you can do in terminal?

> Isn't Postman just a wrapper around curl?

--Benjamin Franklin

---

# Mapping features
* Executing http calls: `$ curl "https://google.com"`
* formatting json and extracting values json: `$ curl "https://localhost:9002/occ/v2/some-site/users/current/carts" | jq .`
* Nested collection: files and directories
```
├── README.md
├── bundle
│   ├── ottb-start-bundle.sh
│   └── remove-bundle.sh
├── cart
│   ├── remove-cart-entry.sh
│   └── validate-cart.sh
```
(use `$ tree -C` to get a nice overview of your collection)

---
# Mapping features (continued)

* Variable capture:

```zsh
VARIABLE=wilco
echo $VARIABLE # outputs: wilco
```

* Manage per directory variables with `direnv`

* 2 ways of injecting values into curl

    * Using bash/zsh substitution: `$ curl "https://localhost:9002/occ/v2/some-site/users/$USER/carts"`
    * Using new curl (>= 8.3.0) feature: `$ curl --expand-url "https://localhost:9002/occ/v2/some-site/users/{{USER}}/carts"`

* Reusing curl configuration (such as authentication headers): Create a config file and use that in the request: 
`curl -K curl-config-one-id.txt "https://localhost:9002/occ/v2/some-site"`

---
# Mapping features (continued)

* Testing harness -> Not such a strong alternative, as terminal is primarily about passing text 
around

Current kludgy workaround:
```zsh
source "$PROJECT_DIR/util/assert.sh"

# Fixture: create new cart
$PROJECT_DIR/cart/create-cart.sh

# Test: Add Product SKU to cart
RESPONSE_BODY=$($PROJECT_DIR/cart/add-to-cart.sh gizmop_Bk)

# Extract status code from ressponse body
STATUS=$(echo $RESPONSE_BODY | jq -r .statusCode)

assert "Product was added to cart" "'$STATUS' == 'success'" 
```
---
# Demo time

Let me see it in action

# What I've learned

## The good stuff:
* You can actually create something working in a few hours
* You can actually create something usefull in a day or 2
* There are currently no features actually missing, only testing should be easier

## Bad stuff:
* Eats some of your evening time
* Not very shareable with non-technical/windows users
* Need some thinking on scaling up to larger project
* Doesn't force you to write well structured project (but neither do Postman/Insomnia)

# What should you do instead

Use an existing open source alternative to Postman and Insomnia. 

The open source nature makes that there probably:
* Is no business model and hence
* Less chance of shitification

There are lots:
* https://github.com/firecamp-dev/firecamp
* https://github.com/EsperoTech/yaade
* https://github.com/ArchGPT/insomnium
* https://github.com/RecipeUI/RecipeUI
* https://hoppscotch.io/

This is a mix of hosted, self-hosted or local apps

---
# Thanks for bearing with me!

Bye bye

Tools used:
* [Slides](https://github.com/maaslalani/slides)
* [Curl](https://curl.se/), [very nice talk on curl](https://www.youtube.com/watch?v=V5vZWHP-RqU)
* [Direnv](https://direnv.net/)
* [Jq](https://jqlang.github.io/jq/)
* bash/zsh