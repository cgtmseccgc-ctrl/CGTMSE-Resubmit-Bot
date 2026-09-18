CGTMSE Resubmit Desk
====================
Windows Python bot for returned first-instalment claims on
https://inter.cgtmse.in

FIRST RUN
  1. Install Python 3.10+ from python.org. Tick "Add python.exe to PATH".
  2. Double-click run.bat
  3. Launcher → Open desk

If you already ran an older zip: delete this folder’s .venv, then run.bat again.

FOUR SCREENS  (+ Environment from the header)
  1 Files    Credential master + claims workbook
  2 Queue    Matched Maker / Checker. Show / hide passwords
  3 Run      Rehearsal / Inspect / Resubmit, then Start
  4 Report   RESULT.csv and the output pack
  Header     Environment (self-check)  ·  Output folder

CLAIMS FILE
  Required: MLI ID, CLAIM REF NO
  Optional: URN, State, Legal Waiver, Comment

CREDENTIAL MASTER
  MLI / Member ID, Maker User ID, Maker Password,
  Checker User ID, Checker Password
  One password per cell — this is tried first.

FALLBACK PASSWORDS
  Entered on the Files screen, not in Excel.
  Tried only if the Excel password is rejected by the portal.
  Maker and Checker each have their own box (hide / show).
  Several values: comma-separated.

CAPTCHA
  Not required. The desk does not wait for a captcha window.
  If the portal shows one, type it in the Chrome window.


OUTPUT (every Start)
  output\RESUBCL-dd-mm-yyyy-HH-MM\     (colon cannot be used in a Windows folder name)
    result\RESULT.csv    claim-wise result
    result\SUMMARY.txt   counts
    reports\             log, events, environment, queue
    evidence\screenshots viewport PNGs (full page on errors)
    evidence\video       live Chrome recording (.webm)
    evidence\dom         HTML on errors
    evidence\trace.zip   Playwright trace
    README.txt

ENVIRONMENT
  Header → Environment. Checks this desk, this machine, Chromium,
  and whether inter.cgtmse.in answers. Copied into every evidence pack.

LIVE PORTAL
  On the Run screen, tick Live portal. Leave it off until a rehearsal
  looks right. Tick “Capture full HTML on every step” for a heavy pack.

  Browser         Installed Google Chrome (then Edge, then Chromium).
                  Captcha images often 404 in bundled Chromium.

  Scheme notice   Wait for #exampleInfo1, then closePopup() / Close.
                  The terms checkbox is never clicked while the popup
                  is still on top.

  Captcha         Optional. The desk does not wait for it.
                  If the portal shows one, type it in Chrome.

  Passwords       Excel first. Files-screen fallbacks only if rejected.

  Failures        Login failure marks that MLI’s claims and does not
                  retry Sign In 1,000 times. Browser close stops the run.


BUILD EXE
  Double-click build_exe.bat
  Result: dist\CGTMSE_Resubmit_Desk.exe
