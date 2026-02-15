# ClawHub Configuration Guide

**Purpose:** External skill marketplace integration
**Skills Available:** 3,286+

---

## 🔑 Getting Started

### 1. Get API Key

Visit https://clawhub.com and create an account to get your API key.

### 2. Authenticate

```bash
# Login with your API key
npx clawhub auth login --token YOUR_API_KEY_HERE --no-browser

# Verify authentication
npx clawhub auth whoami
```

---

## 📦 Installing Skills

### Search for Skills
```bash
# Search by keyword
npx clawhub search gmail
npx clawhub search docker
npx clawhub search productivity
```

### Install Skills
```bash
# IMPORTANT: Always install from home directory
cd ~
npx clawhub install <skill-name>

# List installed skills
npx clawhub list
```

---

## ⚠️ Security Guidelines

### Before Installing ANY Skill

1. ✅ Check the skill's score (prefer 3.0+)
2. ✅ Review source code on GitHub
3. ✅ Check VirusTotal report on ClawHub
4. ✅ Verify recent updates (within 6 months)
5. ❌ NEVER use `--force` for flagged skills

### Known Issues

**February 2026:** 2,419 malicious skills removed from ClawHub

Many high-rated skills are flagged as suspicious by VirusTotal:
- Skills with crypto keys, external APIs, eval patterns
- Even top-rated skills may be flagged
- Exercise extreme caution

### Recommended Approach

**Prioritize bundled skills (19 available):**
```bash
openclaw skills check
```

These are vetted, safe, and fully integrated with OpenClaw.

---

## 📊 Safe Skills (Tested)

### Successfully Installed (No Warnings)

1. **gmail** v1.0.6 (score: 3.553)
   - Gmail integration
   - No VirusTotal warnings

2. **productivity** v1.0.1 (score: 3.341)
   - Productivity tools
   - No VirusTotal warnings

### Flagged Skills (Avoid)

The following are flagged by VirusTotal despite high scores:
- openclaw-github-assistant (3.487)
- docker-essentials (3.604)
- logseq (3.395)
- todoist (0.666)
- receiving-code-review (3.527)

---

## 🎯 Integration with OpenClaw

### Where Skills Install

**ClawHub skills:** `~/skills/`
**Bundled skills:** Built into OpenClaw

### Checking Status

```bash
# Bundled skills (19 ready)
openclaw skills check

# ClawHub external skills
npx clawhub list
```

**Note:** ClawHub skills may not appear in `openclaw skills list` as they're external to the bundled skills system.

---

## 🔄 Updates & Maintenance

### Keep Skills Updated
```bash
# Update all installed skills
npx clawhub update

# Update specific skill
npx clawhub update <skill-name>
```

### Remove Skills
```bash
# Delete skill directory
rm -rf ~/skills/<skill-name>
```

---

## 📚 Skill Categories

### Development
- test-runner (3.539)
- context-driven-development (3.244)
- code-review (3.494)

### Productivity
- productivity (3.341) ✅ Safe
- pndr (0.544)
- focus-deep-work (0.868)

### Communication
- gmail (3.553) ✅ Safe
- slack (needs configuration)
- discord (needs configuration)

### AI & Agents
- agent-directory (3.466)
- agent-autonomy-kit (3.463)
- agent-team-orchestration (3.333)

---

## 💡 Best Practices

1. **Test in isolation** before integrating with production
2. **Review code** for any suspicious patterns
3. **Start with high-score, clean skills**
4. **Focus on bundled skills** for core functionality
5. **Use ClawHub** for specialized add-ons only

---

## 🆘 Troubleshooting

### Rate Limiting
```
Error: Rate limit exceeded
```
**Solution:** Wait 5-10 minutes between install operations

### Authentication Issues
```
Error: Unauthorized
```
**Solution:** Re-authenticate with valid API key

### Suspicious Skill Warnings
```
Warning: flagged as suspicious by VirusTotal
```
**Solution:** Do NOT use --force. Find alternative skill or skip.

---

## 📖 Resources

- **ClawHub:** https://clawhub.com
- **Documentation:** https://docs.clawhub.com
- **Skill Count:** 3,286+ available
- **Security:** VirusTotal integration built-in

---

**Recommendation:** The 19 bundled OpenClaw skills provide excellent functionality. Only use ClawHub for specialized needs, and always prioritize security.
