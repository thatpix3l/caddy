#!/bin/bash
TAG="$1"
NUM='([0-9]+)'
SEMVER_REGEX="v$NUM\.$NUM\.$NUM"

tag_to_versions() {
  sed -E "s/$SEMVER_REGEX/MAJOR=\1\nMINOR=\2\nPATCH=\3\n/"
}

printf '%s' "$TAG" | tag_to_versions | while read -r CHUNK; do
  echo "${CHUNK}" >> "$GITHUB_ENV"
done