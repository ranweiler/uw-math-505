#!/usr/bin/env bash
set -eu -o pipefail

url='http://sites.math.washington.edu/~mcgovern/505wi17'
files=$(curl "${url}/" 2>/dev/null | pcregrep -o1 '<a.*>(.*tex)</a>')

mkdir -p raw
pushd raw >/dev/null
for f in $files
do
  curl -O "${url}/${f}"
done
popd >/dev/null
