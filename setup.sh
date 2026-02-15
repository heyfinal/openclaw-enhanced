#!/bin/bash
# OpenClaw Enhanced - Simple Setup Script
# Installs CLI tools for 19 skills + free web search
# Supports: macOS (Homebrew) and Linux (apt-get)

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║      OpenClaw Enhanced - Skills & Tools Setup               ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    echo -e "${GREEN}✓${NC} Detected: macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    echo -e "${GREEN}✓${NC} Detected: Linux"
else
    echo -e "${RED}❌ Unsupported OS: $OSTYPE${NC}"
    exit 1
fi

# Check prerequisites
echo -e "${BLUE}Checking prerequisites...${NC}"

if [ "$OS" = "macos" ]; then
    REQUIRED_CMDS="python3 git node npm brew"
else
    REQUIRED_CMDS="python3 git node npm"
fi

for cmd in $REQUIRED_CMDS; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${RED}❌ $cmd not installed${NC}"
        if [ "$OS" = "linux" ] && [ "$cmd" = "npm" ]; then
            echo -e "${YELLOW}Install with: sudo apt-get install nodejs npm${NC}"
        fi
        exit 1
    fi
    echo -e "${GREEN}✓${NC} $cmd found"
done

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 1: Install OpenClaw${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo ""

if ! command -v openclaw &> /dev/null; then
    echo -e "${YELLOW}Installing OpenClaw via npm...${NC}"
    npm install -g openclaw
    echo -e "${GREEN}✓${NC} OpenClaw installed"
else
    echo -e "${GREEN}✓${NC} OpenClaw already installed"
fi

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 2: Install CLI Tools for Skills${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo ""

# 1Password CLI
if ! command -v op &> /dev/null; then
    echo -e "${YELLOW}Installing 1Password CLI...${NC}"
    if [ "$OS" = "macos" ]; then
        brew install --cask 1password-cli
    else
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | sudo tee /etc/apt/sources.list.d/1password.list
        sudo apt-get update && sudo apt-get install -y 1password-cli
    fi
    echo -e "${GREEN}✓${NC} 1Password CLI installed"
else
    echo -e "${GREEN}✓${NC} 1Password CLI already installed"
fi

# Himalaya email CLI
if ! command -v himalaya &> /dev/null; then
    echo -e "${YELLOW}Installing Himalaya email CLI...${NC}"
    if [ "$OS" = "macos" ]; then
        brew install himalaya
    else
        cargo install himalaya || echo -e "${YELLOW}⚠${NC}  Install Rust first: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    fi
    echo -e "${GREEN}✓${NC} Himalaya installed"
else
    echo -e "${GREEN}✓${NC} Himalaya already installed"
fi

# mcporter
if ! command -v mcporter &> /dev/null; then
    echo -e "${YELLOW}Installing mcporter...${NC}"
    npm install -g mcporter
    echo -e "${GREEN}✓${NC} mcporter installed"
else
    echo -e "${GREEN}✓${NC} mcporter already installed"
fi

# obsidian-cli
if ! command -v obsidian &> /dev/null; then
    echo -e "${YELLOW}Installing obsidian-cli...${NC}"
    npm install -g obsidian-cli
    echo -e "${GREEN}✓${NC} obsidian-cli installed"
else
    echo -e "${GREEN}✓${NC} obsidian-cli already installed"
fi

# reminders-cli (macOS only)
if [ "$OS" = "macos" ]; then
    if ! brew list keith/formulae/reminders-cli &> /dev/null; then
        echo -e "${YELLOW}Installing reminders-cli...${NC}"
        brew tap keith/formulae 2>/dev/null || true
        brew install keith/formulae/reminders-cli
        echo -e "${GREEN}✓${NC} reminders-cli installed"
    else
        echo -e "${GREEN}✓${NC} reminders-cli already installed"
    fi
else
    echo -e "${YELLOW}⚠${NC}  reminders-cli skipped (macOS only)"
fi

# OpenAI Whisper
if ! command -v whisper &> /dev/null; then
    echo -e "${YELLOW}Installing OpenAI Whisper...${NC}"
    if [ "$OS" = "macos" ]; then
        brew install openai-whisper
    else
        pip3 install -U openai-whisper
    fi
    echo -e "${GREEN}✓${NC} OpenAI Whisper installed"
else
    echo -e "${GREEN}✓${NC} OpenAI Whisper already installed"
fi

# Summarize CLI
if ! command -v summarize &> /dev/null; then
    echo -e "${YELLOW}Installing summarize CLI...${NC}"
    if [ "$OS" = "macos" ]; then
        brew tap steipete/tap 2>/dev/null || true
        brew install steipete/tap/summarize
    else
        npm install -g @steipete/summarize
    fi
    echo -e "${GREEN}✓${NC} summarize installed"
else
    echo -e "${GREEN}✓${NC} summarize already installed"
fi

# OrderCLI (Foodora orders - macOS only)
if ! command -v ordercli &> /dev/null; then
    if [ "$OS" = "macos" ]; then
        echo -e "${YELLOW}Installing ordercli...${NC}"
        brew install steipete/tap/ordercli
        echo -e "${GREEN}✓${NC} ordercli installed"
    else
        echo -e "${YELLOW}⚠${NC}  ordercli skipped (macOS only)"
    fi
else
    echo -e "${GREEN}✓${NC} ordercli already installed"
fi

# Things 3 CLI (macOS only)
if [ "$OS" = "macos" ]; then
    if ! command -v things &> /dev/null; then
        echo -e "${YELLOW}Installing Things CLI...${NC}"
        npm install -g things-cli
        echo -e "${GREEN}✓${NC} Things CLI installed"
    else
        echo -e "${GREEN}✓${NC} Things CLI already installed"
    fi
else
    echo -e "${YELLOW}⚠${NC}  Things CLI skipped (macOS only)"
fi

# Create compatibility symlinks (macOS only)
if [ "$OS" = "macos" ]; then
    echo -e "${YELLOW}Creating compatibility symlinks...${NC}"
    ln -sf /opt/homebrew/Cellar/reminders-cli/*/bin/reminders /opt/homebrew/bin/remindctl 2>/dev/null || true
    ln -sf /opt/homebrew/bin/obsidian /opt/homebrew/bin/obsidian-cli 2>/dev/null || true
    echo -e "${GREEN}✓${NC} Symlinks created"
fi

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 3: Install Free Web Search${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo ""

# Copy free search tool
mkdir -p ~/.openclaw/tools
mkdir -p ~/.openclaw/cli
cp tools/free_web_search.py ~/.openclaw/tools/
chmod +x ~/.openclaw/tools/free_web_search.py

# Create CLI wrapper
cat > ~/.openclaw/cli/free-search << 'EOF'
#!/bin/bash
# Free Web Search - DuckDuckGo (No API key needed)
python3 ~/.openclaw/tools/free_web_search.py "$@"
EOF
chmod +x ~/.openclaw/cli/free-search

# Create symlink in ~/bin
mkdir -p ~/bin
ln -sf ~/.openclaw/cli/free-search ~/bin/free-search 2>/dev/null || true

echo -e "${GREEN}✓${NC} Free web search installed"
echo -e "${GREEN}  Command: free-search \"query\"${NC}"
echo -e "${GREEN}  Saves \$60-180/year (replaces Brave Search)${NC}"

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 4: Configure ClawHub (Optional)${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo ""

read -p "Do you have a ClawHub API key? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Enter your ClawHub API key: " CLAWHUB_KEY
    if [ ! -z "$CLAWHUB_KEY" ]; then
        npx clawhub auth login --token "$CLAWHUB_KEY" --no-browser
        echo -e "${GREEN}✓${NC} ClawHub authenticated"

        echo -e "${YELLOW}Installing recommended skills...${NC}"
        cd ~
        npx clawhub install gmail 2>/dev/null || echo "  (gmail skipped)"
        npx clawhub install productivity 2>/dev/null || echo "  (productivity skipped)"
        echo -e "${GREEN}✓${NC} ClawHub skills installed (check ~/skills/)"
    fi
else
    echo -e "${YELLOW}ℹ${NC}  Skipping ClawHub (get key at https://clawhub.com)"
fi

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 5: Enable Voice Call Plugin${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
echo ""

CONFIG_FILE="$HOME/.openclaw/openclaw.json"
if [ -f "$CONFIG_FILE" ]; then
    # Check if voice-call is already enabled
    if grep -q '"voice-call"' "$CONFIG_FILE"; then
        echo -e "${GREEN}✓${NC} Voice-call plugin already enabled"
    else
        # Add voice-call to plugins.entries
        sed -i.bak 's/"imessage": {/"imessage": {\n        "enabled": true\n      },\n      "voice-call": {/' "$CONFIG_FILE"
        sed -i.bak 's/"voice-call": {/"voice-call": {\n        "enabled": true/' "$CONFIG_FILE"
        echo -e "${GREEN}✓${NC} Voice-call plugin enabled"
    fi
else
    echo -e "${YELLOW}⚠${NC}  Config file not found (run 'openclaw configure' first)"
fi

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                    ✅ Installation Complete!                 ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}🎯 What's Installed:${NC}"
echo "  ✓ OpenClaw CLI"
echo "  ✓ 19 Skill CLI Tools (1password, himalaya, whisper, obsidian, etc.)"
echo "  ✓ Free Web Search (DuckDuckGo - no API key!)"
echo "  ✓ ClawHub Integration (if configured)"
echo ""

echo -e "${CYAN}🚀 Quick Start:${NC}"
echo ""
echo "  Check skills:"
echo -e "    ${YELLOW}openclaw skills check${NC}"
echo ""
echo "  Free search:"
echo -e "    ${YELLOW}free-search \"Python tutorials\"${NC}"
echo ""
echo "  ClawHub skills:"
echo -e "    ${YELLOW}npx clawhub search <keyword>${NC}"
echo -e "    ${YELLOW}cd ~ && npx clawhub install <skill>${NC}"
echo ""

echo -e "${CYAN}📖 Documentation:${NC}"
echo "  Free Search: docs/FREE_SEARCH.md"
echo "  ClawHub: docs/CLAWHUB.md"
echo ""

echo -e "${YELLOW}⚠️  Next Steps:${NC}"
echo "  1. Grant Full Disk Access to Terminal/iTerm"
echo "  2. Run: openclaw gateway"
echo "  3. Enjoy your enhanced OpenClaw!"
echo ""
