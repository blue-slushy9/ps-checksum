# This is a PowerShell script that will run a SHA256 checksum on an Arch Linux
# ISO that I downloaded to verify its integrity;

# Create variable that will store local path to file;
$filePath = "C:\Users\slushy\Downloads\Arch\archlinux-2023.07.01-x86_64.iso"

# Calculate the SHA-256 hash of the file;
$hash = Get-FileHash -Algorithm SHA256 -Path $filePath

# Output the SHA-256 hash;
$local_hash = $hash.Hash

# Since the hash is stored in all caps on Windows, we can use the .ToLower()
# method to convert it to all lowercase, as it shows up in Linux;
$local_hash = $local_hash.ToLower()

# Original file hash from official repo

$orig_hash = "1a2c1cdea0118b60525f55ee616e9cd4cf68fe17db906ce3d8e46fd06f9907eb"

# Print out both hashes to verify they've actually been assigned to their
# respective variables;

Write-Host "The original file hash is $orig_hash"
Write-Host "The local file hash is $local_hash"

# Now compare the two hashes to see if they match, we use 'ceq' for a case-
# sensitive comparison;

if ($orig_hash -ceq $local_hash) {
    Write-Host "The strings match (case-sensitive)."
} else {
    Write-Host "The strings DO NOT match (case-sensitive)."
}


