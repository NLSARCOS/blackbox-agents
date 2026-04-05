#!/usr/bin/env bash
#
# Blackbox Agents — One-command installer
#
# Usage:
#   bash <(curl -sL https://raw.githubusercontent.com/NLSARCOS/blackbox-agents/main/setup.sh)
#
set -euo pipefail

REPO="NLSARCOS/blackbox-agents"
BRANCH="main"
TEMP_DIR=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

info()  { echo -e "${CYAN}[blackbox]${NC} $1"; }
ok()    { echo -e "${GREEN}[blackbox]${NC} $1"; }
warn()  { echo -e "${RED}[blackbox]${NC} $1"; }
error() { echo -e "${RED}[blackbox]${NC} $1"; exit 1; }

cleanup() {
  if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

# ─── 1. Download .agent/ ───────────────────────────────────────────

info "Downloading Blackbox Agents..."

if [ -d ".agent" ]; then
  warn ".agent/ already exists. Updating..."
  REMOVE_EXISTING=true
else
  REMOVE_EXISTING=false
fi

TEMP_DIR=$(mktemp -d)
ZIP_URL="https://github.com/${REPO}/archive/refs/heads/${BRANCH}.zip"
ZIP_FILE="${TEMP_DIR}/blackbox.zip"

if command -v curl &>/dev/null; then
  curl -sL "$ZIP_URL" -o "$ZIP_FILE"
elif command -v wget &>/dev/null; then
  wget -q "$ZIP_URL" -O "$ZIP_FILE"
else
  error "Need curl or wget to download."
fi

if command -v unzip &>/dev/null; then
  unzip -q "$ZIP_FILE" -d "$TEMP_DIR"
elif command -v python3 &>/dev/null; then
  python3 -c "import zipfile; zipfile.ZipFile('${ZIP_FILE}').extractall('${TEMP_DIR}')"
else
  error "Need unzip or python3 to extract."
fi

EXTRACTED=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "blackbox-agents*" | head -1)

if [ -z "$EXTRACTED" ] || [ ! -d "$EXTRACTED/.agent" ]; then
  error "Download failed or .agent/ not found in repo."
fi

# ─── 2. Copy .agent/ to current project ────────────────────────────────

if [ "$REMOVE_EXISTING" = true ]; then
  if [ -d ".agent/project-skills" ]; then
    cp -r ".agent/project-skills" "${TEMP_DIR}/project-skills-backup"
  fi
  if [ -f ".agent/MEMORY.md" ]; then
    cp ".agent/MEMORY.md" "${TEMP_DIR}/MEMORY-backup.md"
  fi
  rm -rf .agent
fi

cp -r "$EXTRACTED/.agent" .agent

if [ -d "${TEMP_DIR}/project-skills-backup" ]; then
  cp -r "${TEMP_DIR}/project-skills-backup/"* .agent/project-skills/ 2>/dev/null || true
fi
if [ -f "${TEMP_DIR}/MEMORY-backup.md" ]; then
  cp "${TEMP_DIR}/MEMORY-backup.md" .agent/MEMORY.md
fi

ok ".agent/ installed."

# ─── 3. Create IDE bridge files ──────────────────────────────────────
# These 3-line files tell each IDE to read AGENTS.md (the universal entry point)

BRIDGE='# Blackbox Agents
Read `AGENTS.md` first. It contains the complete system guide.
If AGENTS.md does not exist, run: /init'

for file in CLAUDE.md .cursorrules .windsurfrules; do
  if [ ! -f "$file" ]; then
    printf '%s\n' "$BRIDGE" > "$file"
    ok "$file created (bridge to AGENTS.md)."
  else
    if ! grep -q "AGENTS.md" "$file" 2>/dev/null; then
      printf '%s\n' "$BRIDGE" > "$file"
      ok "$file updated (bridge to AGENTS.md)."
    else
      ok "$file already configured."
    fi
  fi
done

# ─── 4. Create directories for generated artifacts ─────────────────

mkdir -p docs/superpowers/specs
mkdir -p docs/superpowers/plans
touch docs/superpowers/specs/.gitkeep
touch docs/superpowers/plans/.gitkeep
ok "Directories created."

# ─── 5. Add generated files to .gitignore ──────────────────────────────

if [ -f ".gitignore" ]; then
  if ! grep -q "^AGENTS.md" .gitignore 2>/dev/null; then
    echo "" >> .gitignore
    echo "# Blackbox generated files (created by /init)" >> .gitignore
    echo "AGENTS.md" >> .gitignore
    echo "docs/" >> .gitignore
    ok ".gitignore updated."
  fi
else
  echo "# Blackbox generated files (created by /init)" > .gitignore
  echo "AGENTS.md" >> .gitignore
  echo "docs/" >> .gitignore
  ok ".gitignore created."
fi

# ─── 6. Report ─────────────────────────────────────────────────────────

AGENTS=$(find .agent/agents -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
SKILLS=$(find .agent/skills -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
WORKFLOWS=$(find .agent/workflows -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
SCRIPTS=$(find .agent/scripts -name "*.py" 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN} BLACKBOX AGENTS INSTALLED${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "  Agents:    $AGENTS"
echo "  Skills:    $SKILLS"
echo "  Workflows: $WORKFLOWS"
echo "  Scripts:   $SCRIPTS"
echo ""
echo -e "${CYAN} Next step:${NC}"
echo ""
echo "  Tell your AI:  run /init"
echo "  This will scan your project and generate AGENTS.md"
echo ""
echo -e "${CYAN} Quick start:${NC}"
echo ""
echo "  Any AI → /init          (setup)"
echo "  Any AI → /plan          (plan project)"
echo "  Any AI → /create        (build from scratch)"
echo "  Any AI → /superpowers   (TDD-driven development)"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
