#!/usr/bin/env sh
set -e
yarn run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:s3rrot/ultimate-decision-maker.git master:gh-pages
cd -
