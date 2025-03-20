; Define installer settings
[Setup]
AppName=Zeus Pro
AppVersion=4.0.6
DefaultDirName={commonpf}\ZeusPro
DefaultGroupName=Geeksoft
UninstallDisplayIcon={app}\zeuspro.exe
OutputBaseFilename=zeus_pro_4.0.6_install
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
LicenseFile=C:\Users\User\Documents\license.txt
SetupIconFile=C:\Users\User\Documents\ico101.ico

; Check if updating or fresh install
[Code]
function IsUpgrade(): Boolean;
var
  ExistingVersion: String;
begin
  if RegQueryStringValue(HKLM, 'Software\GeekSoft\ZeusPro\build1', 'version', ExistingVersion) then
  begin
    if ExistingVersion <> '{#SetupSetting("AppVersion")}' then
    begin
      Result := True;
      exit;
    end;
  end;
  Result := False;
end;

procedure InitializeWizard;
begin
  if IsUpgrade() then
    MsgBox('An existing version is detected. The installer will update it.', mbInformation, MB_OK);
end;

[Tasks]
Name: "desktopicon"; Description: "Create a Desktop shortcut"; GroupDescription: "Additional tasks:";
Name: "startmenuicon"; Description: "Create a Start Menu shortcut"; GroupDescription: "Additional tasks:";

[Files]
Source: "C:\Users\User\Documents\ZeusPro\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\Zeus Pro"; Filename: "{app}\zeuspro.exe"; Tasks: desktopicon
Name: "{group}\Geeksoft\Zeus Pro"; Filename: "{app}\zeuspro.exe"; Tasks: startmenuicon

[Registry]
; Ensure full registry key removal on uninstall
Root: HKCU; Subkey: "Software\GeekSoft\ZeusPro"; Flags: uninsdeletekey

; Store version info in registry
Root: HKCU64; Subkey: "Software\GeekSoft\ZeusPro\build1"; ValueType: string; ValueName: "version"; ValueData: "{#SetupSetting("AppVersion")}"; Flags: uninsdeletekey
; Store installation path in registry
Root: HKCU64; Subkey: "Software\GeekSoft\ZeusPro\build1"; ValueType: string; ValueName: "zeusdir"; ValueData: "{app}\"; Flags: uninsdeletekey

; File associations
; Gimmick file
Root: HKCR; Subkey: ".Z3G"; ValueType: string; ValueData: "Z3GFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Z3GFile"; ValueType: string; ValueData: "Zeus Gimmick File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Z3GFile\DefaultIcon"; ValueType: string; ValueData: "{app}\zeuspro.exe,1"
; Commentary file
Root: HKCR; Subkey: ".ZCM"; ValueType: string; ValueData: "ZCMFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ZCMFile"; ValueType: string; ValueData: "Zeus Commentary File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ZCMFile\DefaultIcon"; ValueType: string; ValueData: "{app}\zeuspro.exe,5"
; Federation file
Root: HKCR; Subkey: ".ZFD"; ValueType: string; ValueData: "ZFDFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ZFDFile"; ValueType: string; ValueData: "Zeus Federation File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ZFDFile\DefaultIcon"; ValueType: string; ValueData: "{app}\zeuspro.exe,2"
; Import file
Root: HKCR; Subkey: ".ZIM"; ValueType: string; ValueData: "ZIMFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ZIMFile"; ValueType: string; ValueData: "Zeus Import File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ZIMFile\DefaultIcon"; ValueType: string; ValueData: "{app}\zeuspro.exe,7"
; Moves file
Root: HKCR; Subkey: ".ZMS"; ValueType: string; ValueData: "ZMSFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ZMSFile"; ValueType: string; ValueData: "Zeus Move Set"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ZMSFile\DefaultIcon"; ValueType: string; ValueData: "{app}\zeuspro.exe,6"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Run]
Filename: "{app}\zeuspro.exe"; Description: "Launch Zeus Pro"; Flags: runascurrentuser postinstall nowait skipifsilent
