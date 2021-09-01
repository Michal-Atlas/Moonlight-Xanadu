#!/usr/bin/env bash
set -euox pipefail

git worktree add /tmp/gh-pages gh-pages
printf "PDF version for download [[file:Moonlight-Xanadu.pdf][here]].\n\n%s" "$(cat Moonlight-Xanadu.org)" | pandoc -f org --toc -so index.html
pandoc Moonlight-Xanadu.org --toc -so Moonlight-Xanadu.pdf
mv index.html Moonlight-Xanadu.pdf /tmp/gh-pages/
cd /tmp/gh-pages
git add .
git commit -m "$(date -Ins)"
git push
cd -
git worktree remove /tmp/gh-pages
