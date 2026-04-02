# TaskMaster Pro — Release v1.0.0

Release date: 2026-04-02

## Highlights
- Initial desktop release (Electron + Vite + React)
- License activation system implemented
- Auto-update scaffolding added
- Windows installer (NSIS) produced and included

## Artifacts
- NSIS installer: `TaskMaster Pro-Setup-1.0.0.exe` (in `out/`)
- Portable ZIP: `TaskMasterPro-win-x64.zip` (in `out/`)

## Notes
- The installer is unsigned. For distribution, sign the installer with a code signing certificate.
- CI workflow `.github/workflows/release.yml` builds and publishes artifacts to GitHub Releases on tag push.

## Quick local test
1. Build renderer: `npm run build:vite`
2. Build unpacked: `npx electron-builder --win --x64 --dir`
3. Run app from `out/win-unpacked/TaskMaster Pro.exe`

## Next steps
- Add code signing certificate to GitHub Secrets (`CSC_LINK`, `CSC_KEY_PASSWORD`) for signed builds.
- Configure GitHub Releases description and assets if manual adjustment is needed.
