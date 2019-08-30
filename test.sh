#!/bin/sh

GIT_URL=${$(git ls-remote --get-url)/:\/\//:\/\/$GITHUB_TOKEN@}
git remote set-url origin $GIT_URL
