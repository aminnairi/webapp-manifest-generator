#!/usr/bin/env bash

elm='./node_modules/.bin/elm'
uglify='./node_modules/.bin/uglifyjs'
input='./src/Main.elm'
output='./docs/main.js'
htmlmin='./node_modules/.bin/html-minifier'
uglifycss='./node_modules/.bin/uglifycss'

rm -rf ./docs
mkdir ./docs
$elm make --optimize --output=$output $input
$uglify $output --compress "pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" | $uglify --mangle --output=$output
$htmlmin --case-sensitive --collapse-boolean-attributes --collapse-inline-tag-whitespace --collapse-whitespace --conservative-collapse --decode-entities --quoteCharacter="'" --remove-attribute-quotes --remove-comments --remove-empty-attributes --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-style-link-type-attributes --remove-tag-whitespace ./src/static/index.html > ./docs/index.html
$uglify --output ./docs/index.js ./src/static/index.js
$uglifycss ./src/static/index.css > ./docs/index.css