#!/usr/bin/env bash
# Warn (never fail) when a docs page changes without its language twin.
# Every page is a pair: page.md (English) + page.pl.md (Polish). Editing one
# side without the other silently serves stale/fallback content to the other
# language, so this surfaces the drift as a GitHub warning annotation.
set -u

# Work out the diff range for this event.
if [ "${GITHUB_EVENT_NAME:-}" = "pull_request" ] && [ -n "${GITHUB_BASE_REF:-}" ]; then
    git fetch -q origin "$GITHUB_BASE_REF" || true
    base=$(git merge-base "origin/$GITHUB_BASE_REF" HEAD 2>/dev/null || echo "HEAD~1")
    range="$base..HEAD"
elif [ -n "${GITHUB_EVENT_BEFORE:-}" ] \
        && [ "$GITHUB_EVENT_BEFORE" != "0000000000000000000000000000000000000000" ] \
        && git cat-file -e "$GITHUB_EVENT_BEFORE" 2>/dev/null; then
    range="$GITHUB_EVENT_BEFORE..HEAD"
else
    range="HEAD~1..HEAD"
fi

changed=$(git diff --name-only "$range" -- 'docs/*.md' 2>/dev/null || true)
[ -z "$changed" ] && { echo "No docs pages changed in $range — nothing to check."; exit 0; }

echo "Docs pages changed in $range:"
echo "$changed"

drift=0
for f in $changed; do
    case "$f" in
        *.pl.md) twin="${f%.pl.md}.md" ;;
        *.md)    twin="${f%.md}.pl.md" ;;
        *)       continue ;;
    esac
    # Only warn when the twin exists (new pages may add one side first) and
    # was not touched in the same range.
    if [ -f "$twin" ] && ! echo "$changed" | grep -qx "$twin"; then
        echo "::warning file=$f::$f changed but its language twin $twin did not — EN/PL may be out of sync. Update the twin or the other language silently falls back."
        drift=1
    fi
done

if [ "$drift" -eq 0 ]; then
    echo "All changed pages updated both languages. ✔"
else
    echo "Language drift detected — see warnings above (build continues)."
fi
exit 0
