#!/usr/bin/env bash
set -euox pipefail

git worktree add /tmp/gh-pages gh-pages
rm -r /tmp/gh-pages/*
cp Moonlight-Xanadu.pdf /tmp/gh-pages/
cp Moonlight-Xanadu.html /tmp/gh-pages/index.html
pushd /tmp/gh-pages
git add .
git commit -m "$(date -Ins)"
git push
popd
git worktree remove /tmp/gh-pages
