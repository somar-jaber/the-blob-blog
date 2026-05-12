# $scriptUrl = "https://httpbin.org/get"
$scriptUrl = "localhost:8080/the-blob-blog/pages/batchfile/"
try {
    $remoteScript = curl.exe -s $scriptUrl
    # Write-Host $remoteScript
    Invoke-Expression $remoteScript
} catch {
    Write-Error "Failed to download or execute script: $_"
}





# # Test with a safe URL first (echo test)
# iex (curl.exe -s "https://httpbin.org/get")

# # Or test download without execution
# $content = curl.exe -s "https://example.com/script.bat"
# Write-Host $content