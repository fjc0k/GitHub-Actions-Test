#!/usr/bin/env bash

gh_actor_profile="$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/users/${GITHUB_ACTOR}")"
git config --global user.name "$(printf '%s' "$gh_actor_profile" | jq -r .name)"
git config --global user.email "$(printf '%s' "$gh_actor_profile" | jq -r .email)"
gh_auth="$GITHUB_ACTOR:$GITHUB_TOKEN"
gh_url="$(git ls-remote --get-url)"
git remote set-url origin ${gh_url/:\/\//:\/\/$gh_auth@}
