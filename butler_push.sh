#!/bin/bash

# ─────────────────────────────────────────
#  Deploy to itch.io via Butler
# ─────────────────────────────────────────

set -e

# ── Config ── Edit these variables ────────
ITCH_USER="fabianovich"
ITCH_GAME="moooh-bird"

# ──────────────────────────────────────────

# Prompt for version number
echo ""
echo "┌─────────────────────────────────┐"
echo "│     itch.io Butler Deployer     │"
echo "└─────────────────────────────────┘"
echo ""
read -rp "  Enter version number (e.g. 1.0.0): " VERSION

if [[ -z "$VERSION" ]]; then
  echo "  ✗ Version number cannot be empty."
  exit 1
fi

LINUX_DIR="./export/$VERSION/linux"
WINDOWS_DIR="./export/$VERSION/windows"
WEB_DIR="./export/$VERSION/web"

echo ""
echo "  Deploying v$VERSION to $ITCH_USER/$ITCH_GAME ..."
echo ""

# ── Linux ──────────────────────────────────
echo "  [1/3] Uploading Linux build..."
butler push "$LINUX_DIR" \
  "$ITCH_USER/$ITCH_GAME:linux" \
  --userversion "$VERSION"
echo "  ✓ Linux uploaded."
echo ""

# ── Windows ────────────────────────────────
echo "  [2/3] Uploading Windows build..."
butler push "$WINDOWS_DIR" \
  "$ITCH_USER/$ITCH_GAME:windows" \
  --userversion "$VERSION"
echo "  ✓ Windows uploaded."
echo ""

# ── Web ────────────────────────────────────
echo "  [3/3] Uploading Web build..."
butler push "$WEB_DIR" \
  "$ITCH_USER/$ITCH_GAME:web" \
  --userversion "$VERSION"
echo "  ✓ Web uploaded."
echo ""

echo "  ✓ All builds deployed — v$VERSION is live on itch.io!"
echo ""
