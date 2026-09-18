# CGTMSE Resubmit Desk v1.6.1

Windows Python bot for returned first-instalment claims on https://inter.cgtmse.in

## Download

On GitHub: **Code → Download ZIP**

Direct link: https://github.com/cgtmseccgc-ctrl/CGTMSE-Resubmit-Bot/archive/refs/heads/main.zip

Unzip, then double-click `run.bat`.

Do not reuse an older folder. Delete .venv if you reuse the same folder.

## First run

1. Install Python 3.10+ from python.org. Tick **Add python.exe to PATH**.
2. Double-click `run.bat`
3. Launcher → Open desk
4. Files: credential master + claims workbook
5. Optional fallback passwords (comma-separated), then Build queue → Start live run

## Checker (v1.6.1)

- If maker already sent the claim, checker still looks for it
- Opens the D/U list once, ticks ACCEPT on every Excel claim on that page, Save once
- Clicks the Save picture (not a Save button)
- Accepts the validation alert
- Keeps maker-forwarded status if checker cannot save
