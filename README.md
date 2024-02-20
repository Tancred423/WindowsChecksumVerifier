# ![PowerShell Logo](PowerShell.svg) Windows Checksum Verifier

### Overview
Windows Checksum Verifier is a PowerShell script designed to validate the integrity of a file by comparing its checksum hash against a provided value. It supports a variety of checksum algorithms including MD5, SHA1, SHA256, SHA384, and SHA512.

### Requirements
- Windows operating system
- PowerShell 4.0 or later
    - To verify your PowerShell version, execute `$PSVersionTable.PSVersion` in the PowerShell terminal.
    - Most systems will already have this version or a later one installed.

### Instructions
1. Launch the script
    - Option 1: Double-click the `Start.bat` file.
    - Option 2: Right-click the `WindowsChecksumVerifier.ps1` file and select "Run with PowerShell".
2. When prompted, input the expected checksum algorithm.
    - This information is typically provided by the source of the file you're verifying.
3. When prompted, input the expected checksum hash.
    - This is the unique string provided by the file's source.
4. A Windows Explorer window will open for you to select the file to verify.
5. Review the results and proceed accordingly. Stay secure! :)
