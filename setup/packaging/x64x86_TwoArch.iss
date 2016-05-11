; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SpectraFox"                
#define BuildDirectory_x86="..\..\sourcecode\Build\x86\Release"
#define BuildDirectory_x64="..\..\sourcecode\Build\x64\Release"
#define MyAppVersion GetFileVersion('..\..\sourcecode\Build\x86\Release\SpectroscopyManager.exe')
#define MyAppPublisher "Michael Ruby"
#define MyAppURL "http://www.spectrafox.com/"
#define MyAppExeName "SpectroscopyManager.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{6392100C-6A48-4781-800D-02B45BA14F58}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
#if CmdPrivRequired == "admin"
DefaultDirName={pf}\{#MyAppName}
#else
DefaultDirName={userappdata}\{#MyAppName}
#endif
DefaultGroupName={#MyAppName}
LicenseFile={#BuildDirectory_x86}\License.txt
OutputDir=..\output
OutputBaseFilename=spectrafox-setup
SetupIconFile="..\..\artwork\logo\SpectraFoxLogo3.ico"
Compression=lzma
SolidCompression=yes
PrivilegesRequired={#CmdPrivRequired}
;SignTool=Microsoft

; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]
Name: "{app}\plugins"
Name: "{app}\x64mode"; Check: Is64BitInstallMode

[Files]                                                                                      
; Place all x64 files here
;Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: Is64BitInstallMode

Source: "{#BuildDirectory_x64}\SpectroscopyManager.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\SpectroscopyManager.application"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\SpectroscopyManager.pdb"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\SpectroscopyManager.exe.config"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\SpectroscopyManager.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\SpectroscopyManager.pdb"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
;Source: "{#BuildDirectory_x64}\SpectroscopyManager.xml"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\ExpTreeLib.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "{#BuildDirectory_x64}\ZedGraph.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode

; Place all x86 files here, first one should be marked 'solidbreak'
;Source: "MyProg.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
Source: "{#BuildDirectory_x86}\SpectroscopyManager.exe"; DestDir: "{app}"; Flags: ignoreversion solidbreak; Check: not Is64BitInstallMode;
Source: "{#BuildDirectory_x86}\SpectroscopyManager.application"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\SpectroscopyManager.pdb"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\SpectroscopyManager.exe.config"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\SpectroscopyManager.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\SpectroscopyManager.pdb"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
;Source: "{#BuildDirectory_x86}\SpectroscopyManager.xml"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\ExpTreeLib.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "{#BuildDirectory_x86}\ZedGraph.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode

; Place all common files here, first one should be marked 'solidbreak'
;Source: "MyProg.chm"; DestDir: "{app}"; Flags: solidbreak
;Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#BuildDirectory_x86}\changelog_stable.html"; DestDir: "{app}"; Flags: ignoreversion solidbreak
Source: "{#BuildDirectory_x86}\changelog_dev.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\License.txt"; DestDir: "{app}"; 
Source: "{#BuildDirectory_x86}\License-CUDAfy.txt"; DestDir: "{app}"; 
Source: "{#BuildDirectory_x86}\License-ILSpy.txt"; DestDir: "{app}"; 
Source: "{#BuildDirectory_x86}\License-Magick.NET.txt"; DestDir: "{app}";
Source: "{#BuildDirectory_x86}\License-Math.Net.txt"; DestDir: "{app}"; 
Source: "{#BuildDirectory_x86}\License-ZedGraph.txt"; DestDir: "{app}"; 
Source: "{#BuildDirectory_x86}\License-zip.txt"; DestDir: "{app}";
Source: "{#BuildDirectory_x86}\License-NetSparkle.txt"; DestDir: "{app}";

; Place a file to the output, that marks that this setup is executed with low privileges!
; This is necessary for the automatic update procedure!
#if CmdPrivRequired != "admin"
Source: "{#BuildDirectory_x86}\LowPrivilegeSetup.txt"; DestDir: "{app}";
#endif

Source: "{#BuildDirectory_x86}\*.resources.*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BuildDirectory_x86}\Cudafy.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\Cudafy.NET.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\Ionic.Zip.Reduced.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\Magick.NET-Q8-AnyCPU.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\Magick.NET-Q8-AnyCPU.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.Data.Matlab.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.Data.Matlab.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.Data.Text.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.Data.Text.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.IO.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.IO.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.IO.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\MathNet.Numerics.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\SmartThreadPool.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\SmartThreadPool.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\NetSparkle.Net40.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\ZedGraph.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\zlib.net.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDirectory_x86}\ColorSchemes\*"; DestDir: "{app}\ColorSchemes"; Flags: ignoreversion recursesubdirs

; .NET Framework Setup
;Source: "addons\dotNetFx40_Full_setup.exe"; DestDir: {tmp}; Flags: deleteafterinstall; Check: not IsRequiredDotNetDetected
Source: "addons\dotNetFx45_Full_setup.exe"; DestDir: {tmp}; Flags: deleteafterinstall; Check: not IsRequiredDotNetDetected
                                                                                                                                   
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
;Filename: {tmp}\dotNetFx40_Full_setup.exe; Parameters: "/q:a /c:""install /l /q"""; Check: not IsRequiredDotNetDetected; StatusMsg: Installing Microsoft .NET Framework 4.0. Please wait ...
Filename: {tmp}\dotNetFx45_Full_setup.exe; Parameters: "/q:a /c:""install /l /q"""; Check: not IsRequiredDotNetDetected; StatusMsg: Installing Microsoft .NET Framework 4.5. Please wait ...
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked
Filename: http://wiki.spectrafox.com/; Description: "open the online manual"; Flags: postinstall shellexec unchecked

[Code]
function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1.4322'     .NET Framework 1.1
//    'v2.0.50727'    .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//    'v4.5'          .NET Framework 4.5
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key: string;
    install, release, serviceCount: cardinal;
    check45, success: boolean;
var reqNetVer : string;
begin
    // .NET 4.5 installs as update to .NET 4.0 Full
    if version = 'v4.5' then begin
        version := 'v4\Full';
        check45 := true;
    end else
        check45 := false;

    // installation key group for all .NET versions
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + version;

    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;

    // .NET 4.0/4.5 uses value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;

    // .NET 4.5 uses additional value Release
    if check45 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Release', release);
        success := success and (release >= 378389);
    end;

    result := success and (install = 1) and (serviceCount >= service);
end;

// Check for installed .NET Framework!
function IsRequiredDotNetDetected(): Boolean;  
begin
    //result := IsDotNetDetected('v4\Full', 0);
    result := IsDotNetDetected('v4.5', 0);
end;

