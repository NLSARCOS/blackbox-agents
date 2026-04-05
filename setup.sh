#!/usr/bin/env bash
#
# Blackbox Agents — One-command installer
#
# Usage:
#   bash <(curl -sL https://raw.githubusercontent.com/NLSARCOS/blackbox-agents/main/setup.sh)
#
# Or clone and run:
#   git clone https://github.com/NLSARCOS/blackbox-agents.git /tmp/blackbox && bash /tmp/blackbox/setup.sh
#
set -euo pipefail

REPO="NLSARCOS/blackbox-agents"
BRANCH="main"
TEMP_DIR=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()  { echo -e "${CYAN}[blackbox]${NC} $1"; }
ok()    { echo -e "${GREEN}[blackbox]${NC} $1"; }
warn()  { echo -e "${YELLOW}[blackbox]${NC} $1"; }
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

# Download repo as zip
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

# Extract
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

# ─── 2. Copy .agent/ to current project ────────────────────────────

if [ "$REMOVE_EXISTING" = true ]; then
  # Preserve project-skills and MEMORY.md (user data)
  if [ -d ".agent/project-skills" ]; then
    cp -r ".agent/project-skills" "${TEMP_DIR}/project-skills-backup"
  fi
  if [ -f ".agent/MEMORY.md" ]; then
    cp ".agent/MEMORY.md" "${TEMP_DIR}/MEMORY-backup.md"
  fi
  rm -rf .agent
fi

cp -r "$EXTRACTED/.agent" .agent

# Restore user data if it existed
if [ -d "${TEMP_DIR}/project-skills-backup" ]; then
  cp -r "${TEMP_DIR}/project-skills-backup/"* .agent/project-skills/ 2>/dev/null || true
fi
if [ -f "${TEMP_DIR}/MEMORY-backup.md" ]; then
  cp "${TEMP_DIR}/MEMORY-backup.md" .agent/MEMORY.md
fi

ok ".agent/ installed successfully."

# ─── 3. Create directories for generated artifacts ─────────────────

mkdir -p docs/superpowers/specs
mkdir -p docs/superpowers/plans
touch docs/superpowers/specs/.gitkeep
touch docs/superpowers/plans/.gitkeep

ok "Directories created."

# ─── 4. Add AGENTS.md to .gitignore (it's generated per project) ───

if [ -f ".gitignore" ]; then
  if ! grep -q "^AGENTS.md" .gitignore 2>/dev/null; then
    echo "" >> .gitignore
    echo "# Blackbox generated files" >> .gitignore
    echo "AGENTS.md" >> .gitignore
    echo "docs/" >> .gitignore
    ok ".gitignore updated."
  fi
else
  echo "AGENTS.md" > .gitignore
  echo "docs/" >> .gitignore
  ok ".gitignore created."
fi

# ─── 5. Report ─────────────────────────────────────────────────────

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
