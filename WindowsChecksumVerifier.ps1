# Ensure the script runs in the same console window
$Host.UI.RawUI.WindowTitle = "Windows Checksum Verifier"

# Prompt user for the expected checksum algorithm
$expectedAlgorithm = Read-Host "Enter the expected checksum algorithm (MD5, SHA1, SHA256, SHA384, or SHA512)"

# Check if the user input a valid algorithm
$validAlgorithms = @("MD5", "SHA1", "SHA256", "SHA384", "SHA512")
if ($expectedAlgorithm -notin $validAlgorithms) {
    Write-Host "Invalid algorithm. Please choose one of the following: MD5, SHA1, SHA256, SHA384, or SHA512" -ForegroundColor Red
    Read-Host "Script finished. Press Enter to exit"
    return
}

# Prompt user for the expected checksum value
$expectedChecksum = Read-Host "Enter the expected checksum value"

# Open Windows Explorer to select a file
Write-Host "Please select the file to verify:"
Add-Type -AssemblyName System.Windows.Forms
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Title = "Select the file to verify"
$openFileDialog.Filter = "All Files (*.*)|*.*"
$openFileDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
$dialogResult = $openFileDialog.ShowDialog()

if ($dialogResult -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Host "No file selected. Exiting." -ForegroundColor Red
    Read-Host "Script finished. Press Enter to exit"
    return
}

$fileToCheck = Get-Item $openFileDialog.FileName

# Calculate the actual checksum of the selected file
$actualChecksum = Get-FileHash -Path $fileToCheck.FullName -Algorithm $expectedAlgorithm | Select-Object -ExpandProperty Hash

# Display both checksums
Write-Host "--- Results ---" -ForegroundColor Cyan
Write-Host "Actual Checksum:   $actualChecksum" -ForegroundColor Cyan
Write-Host "Expected Checksum: $expectedChecksum" -ForegroundColor Cyan

# Compare the checksums
if ($actualChecksum -eq $expectedChecksum) {
	Write-Host "-> Checksums match! The file has not been modified." -ForegroundColor Green
} else {
	Write-Host "-> Checksums do NOT match! Please make sure you chose the correct algorithm and if so, do not trust this file!" -ForegroundColor Red
}

# Keep the terminal open
Read-Host "Script finished. Press Enter to exit"
