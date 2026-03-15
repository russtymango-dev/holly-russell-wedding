"""
clean-letters.py
Utility to clean up WEDDING-LETTERS.html:
  - Removes the "TO / Name / From:" header block from each letter
  - Replaces all em dashes (—) and en dashes (–) with commas

Run from anywhere:
  python "F:\Documents\Wedding 2026\Letters\clean-letters.py"
"""

import re

FILE = 'F:/Documents/Wedding 2026/Letters/WEDDING-LETTERS.html'

with open(FILE, encoding='utf-8') as f:
    content = f.read()

original = content

# ── Remove header divs ────────────────────────────────────────────────
content = re.sub(r'\s*<div class="letter-to">To</div>\s*\n', '\n', content)
content = re.sub(r'\s*<div class="letter-name">[^<]+</div>\s*\n', '\n', content)
content = re.sub(r'\s*<div class="letter-from">From:[^<]+</div>\s*\n', '\n', content)

# ── Remove associated CSS rules (if still present) ────────────────────
content = re.sub(r'\s*\.letter-to\s*\{[^}]+\}\s*\n', '\n', content)
content = re.sub(r'\s*\.letter-name\s*\{[^}]+\}\s*\n', '\n', content)
content = re.sub(r'\s*\.letter-from\s*\{[^}]+\}\s*\n', '\n', content)

# ── Replace em/en dashes ─────────────────────────────────────────────
for dash in ['—', '&#8212;', '&mdash;', '–', '&#8211;', '&ndash;']:
    content = content.replace(dash, ',')

# ── Tidy up any resulting double commas or ", ." ─────────────────────
content = re.sub(r',\s*,', ',', content)
content = re.sub(r',\s*\.', '.', content)

# ── Write back ────────────────────────────────────────────────────────
with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

changes = content != original
print(f"Done! {'Changes were made.' if changes else 'No changes needed (already clean).'}")
