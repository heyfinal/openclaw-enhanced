# OpenClaw Enhanced - Skills & Tools

**Simple, focused enhancements for OpenClaw**

---

## 🎯 What This Provides

### 19 Ready-to-Use Skills
All CLI dependencies installed and configured:

- 🔐 1password - Secure credential management
- ⏰ apple-reminders - Apple Reminders integration
- 🧩 coding-agent - Run Codex/Claude/OpenCode
- ♊️ gemini - Gemini CLI for Q&A
- 🐙 github - GitHub CLI integration
- 📦 healthcheck - Security hardening
- 📧 himalaya - Email IMAP/SMTP
- 📨 imsg - iMessage/SMS CLI
- 📦 mcporter - MCP server tool
- 🍌 nano-banana-pro - Image generation
- 💎 obsidian - Obsidian vault management
- 🖼️ openai-image-gen - Batch image generation
- 🎙️ openai-whisper - Local speech-to-text
- ☁️ openai-whisper-api - Cloud transcription
- 📜 session-logs - Search session logs
- 📦 skill-creator - Create AgentSkills
- 🧵 tmux - Remote tmux control
- 🎞️ video-frames - Extract video frames
- 🌤️ weather - Weather forecasts

### Free Web Search
**100% FREE** - No API key needed!
- Engine: DuckDuckGo
- Cost: $0 (saves $60-180/year vs Brave Search)
- Privacy-focused, unlimited searches
- Full documentation: `docs/FREE_SEARCH.md`

### ClawHub Integration
- 3,286+ external skills available
- Easy authentication and installation
- Vetted skill recommendations

---

## 📦 Installation

### Quick Install (One-Liner)
```bash
curl -fsSL https://raw.githubusercontent.com/heyfinal/openclaw-enhanced/main/install.sh | bash
```

### Manual Installation
```bash
git clone https://github.com/heyfinal/openclaw-enhanced.git
cd openclaw-enhanced
chmod +x setup.sh
./setup.sh
```

**The script will:**
- Auto-detect your OS (macOS or Linux)
- Install OpenClaw (if not present)
- Install all CLI tools for 19 skills (platform-appropriate)
- Set up free web search
- Configure ClawHub (optional)

**Platform Notes:**
- macOS: Uses Homebrew for all packages
- Linux: Uses apt-get, pip, npm, and cargo
- Some tools are macOS-only (Things 3, Apple Reminders, ordercli)

---

## 🚀 Usage

### Check Skills Status
```bash
openclaw skills check
```

### Free Web Search
```bash
~/.openclaw/cli/free-search "Python tutorials"
free-search "AI news" | jq '.results[0].title'

# From Python
python3 ~/.openclaw/tools/free_web_search.py "search query"
```

**Returns JSON:**
```json
{
  "success": true,
  "query": "...",
  "results": [
    {"title": "...", "url": "...", "snippet": "..."}
  ]
}
```

### ClawHub External Skills
```bash
# Authenticate (get API key from https://clawhub.com)
npx clawhub auth login --token YOUR_API_KEY --no-browser

# Search for skills
npx clawhub search docker
npx clawhub search productivity

# Install skills (from home directory!)
cd ~ && npx clawhub install gmail
cd ~ && npx clawhub install productivity

# List installed
npx clawhub list
```

**Security Note:** Many ClawHub skills are flagged by VirusTotal. The 19 bundled skills are vetted and safe.

---

## 🛠️ What Gets Installed

### CLI Tools
- 1Password CLI (`op`)
- Himalaya email (`himalaya`)
- mcporter MCP tool
- Obsidian CLI (`obsidian`, `obsidian-cli`)
- Apple Reminders (`reminders`, `remindctl`)
- OpenAI Whisper (`whisper`)
- Summarize CLI (`summarize`)
- OrderCLI (`ordercli`) - Foodora order tracking

### Free Tools
- DuckDuckGo web search (no API key!)
- CLI wrapper: `free-search`
- Python script: `~/.openclaw/tools/free_web_search.py`

### ClawHub Access
- Authentication configured
- 2 recommended skills installed (gmail, productivity)
- Full marketplace access (3,286+ skills)

---

## 📚 Documentation

- **Free Search:** `docs/FREE_SEARCH.md` - Complete search documentation
- **ClawHub:** `docs/CLAWHUB.md` - Skill installation guide
- **OpenClaw:** https://docs.openclaw.ai - Official documentation

---

## 🔒 Security

- API keys stored in `~/.openclaw/openclaw.json` (600 permissions)
- iMessage requires Full Disk Access for imsg binary
- ClawHub skills: Review before installing (VirusTotal integration)
- No sensitive data in public repo

---

## 🛠️ Requirements

### macOS
- macOS 12.0+
- Python 3.8+
- Node.js 18+
- Homebrew
- Git

### Linux
- Ubuntu 20.04+ / Debian 11+ (or equivalent)
- Python 3.8+
- Node.js 18+
- apt-get / dpkg
- Git

---

## 💰 Cost Savings

| Service | Before | After | Savings |
|---------|--------|-------|---------|
| Brave Search | $5-15/month | $0 | **100%** |
| Skills Available | 13 | **19** | **+46%** |

**Annual savings:** $60-180/year

---

## 🎉 Benefits

✅ **19 bundled skills** ready to use
✅ **Free web search** (DuckDuckGo)
✅ **No paid APIs** required
✅ **ClawHub access** (3,286+ skills)
✅ **Automated setup** (one command)
✅ **Privacy-focused** tools

---

## 🆘 Support

**Issues:**
1. Check `~/.openclaw/logs/gateway.err.log`
2. Run `openclaw doctor`
3. Review documentation

**GitHub:**
- Public: https://github.com/heyfinal/openclaw-enhanced
- Issues: https://github.com/heyfinal/openclaw-enhanced/issues

---

## 🙏 Credits

Created by Daniel with Claude Sonnet 4.5

**License:** Private - All Rights Reserved

---

**Simple. Focused. Powerful.** 🦞✨
