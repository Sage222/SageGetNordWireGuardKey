$token = "TOKEN HERE"

# The secret sauce: username is "token", password is your actual token
$Bytes = [System.Text.Encoding]::UTF8.GetBytes("token:${token}")
$EncodedToken = [Convert]::ToBase64String($Bytes)

$Headers = @{
    "Authorization" = "Basic $EncodedToken"
    "Content-Type"  = "application/json"
}

try {
    $response = Invoke-RestMethod -Uri "https://api.nordvpn.com/v1/users/services/credentials" -Method Get -Headers $Headers
    Write-Host "`nYour NordLynx Private Key is:" -ForegroundColor Cyan
    $response.nordlynx_private_key
} catch {
    Write-Error "Still failing. Error: $_"
}