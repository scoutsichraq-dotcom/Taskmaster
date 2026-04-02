<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# Run and deploy your AI Studio app

This contains everything you need to run your app locally.

View your app in AI Studio: https://ai.studio/apps/158709cf-138d-4f57-8bb7-56b7eeab4cb5

## Run Locally

**Prerequisites:**  Node.js


1. Install dependencies:
   `npm install`
2. Set the `GEMINI_API_KEY` in [.env.local](.env.local) to your Gemini API key
3. Run the app:
   `npm run dev`

## Downloads / Releases

Binaries and installers are published to GitHub Releases. After CI completes for tag `v1.0.0` you can download the latest Windows installer from:

https://github.com/scoutsichraq-dotcom/Taskmaster/releases

Or use the local artifacts in `out/`:

- `out/TaskMaster Pro-Setup-1.0.0.exe` — NSIS installer
- `out/TaskMasterPro-win-x64.zip` — Portable ZIP
