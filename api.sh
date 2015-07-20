#!/bin/sh

HOST=https://api.github.com

create() {
  curl $HOST/repos/$USER/$REPO/labels \
    -X POST \
    -d "{ \"name\": \"$1\", \"color\": \"$2\" }"
    -u "$USER:$PASS"
}

delete() {
  curl $HOST/repos/$USER/$REPO/labels/$1 \
    -X DELETE \
    -u "$USER:$PASS"
}

get() {
  curl $HOST/repos/$USER/$REPO/labels/$1 \
    -X GET
}

list() {
  curl $HOST/repos/$USER/$REPO/labels \
    -X GET
}

update() {
  curl $HOST/repos/$USER/$REPO/labels/$1 \
    -X PATCH \
    -d "{ \"name\": \"$1\", \"color\": \"$2\" }"
    -u "$USER:$PASS"
}
