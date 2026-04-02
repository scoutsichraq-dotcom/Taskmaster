!define APP_NAME "TaskMaster Pro"
!define APP_EXE "TaskMaster Pro.exe"
!define OUT_DIR "out"

Name "${APP_NAME}"
OutFile "C:\\Users\\LENOVO\\Desktop\\xxxxccccc\\taskmaster-pro\\out\\${APP_NAME}-Setup-1.0.0.exe"
InstallDir "$PROGRAMFILES64\\${APP_NAME}"
RequestExecutionLevel user

Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  ; Copy all application files (use absolute path)
  File /r "C:\\Users\\LENOVO\\Desktop\\xxxxccccc\\taskmaster-pro\\out\\win-unpacked\\*"

  ; Create shortcuts
  CreateDirectory "$SMPROGRAMS\\${APP_NAME}"
  CreateShortCut "$SMPROGRAMS\\${APP_NAME}\\${APP_NAME}.lnk" "$INSTDIR\\${APP_EXE}"
  CreateShortCut "$DESKTOP\\${APP_NAME}.lnk" "$INSTDIR\\${APP_EXE}"
  ; Write uninstaller
  WriteUninstaller "$INSTDIR\\Uninstall.exe"
SectionEnd

Section "Uninstall"
  ; Run uninstall actions
  Delete "$INSTDIR\\${APP_EXE}"
  Delete "$INSTDIR\\Uninstall.exe"
  RMDir /r "$INSTDIR"
  Delete "$SMPROGRAMS\\${APP_NAME}\\${APP_NAME}.lnk"
  RMDir "$SMPROGRAMS\\${APP_NAME}"
  Delete "$DESKTOP\\${APP_NAME}.lnk"
SectionEnd
