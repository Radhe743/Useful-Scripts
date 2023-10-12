
Write-Output "Radhey Shyam"
function Open-GH {
  param(
    [switch]$Repo,
    [string]$SetUser
  )

  

  if ($SetUser) {
    Write-Host "Setting User to $SetUser"
    [System.Environment]::SetEnvironmentVariable("OPEN_GH_USERNAME", $SetUser, "User")
    $env:OPEN_GH_USERNAME = $SetUser
    Write-Host "OPEN_GH will use profile repo https://github.com/$SetUser"
    return 
  }

  if ($repo) {
    $gitSSHUrl = git remote get-url origin

    if ($gitSSHUrl -match 'github\.com') {
      $repoPath = $gitSSHUrl -replace '(git@github\.com:|\.git)', ''

      Start-Process "https://github.com/$repoPath"
    }
    else {
      Write-Output $gitSSHUrl
    }
    return
  }

  if (-not $env:OPEN_GH_USERNAME) {
    Write-Warning "Your GitHub username is not set. Either Set it as Environment Variable OPEN_GH_USERNAME or use OPEN-GH -SetUser <your github username>"
    return
  }


  Start-Process "https://github.com/$env:OPEN_GH_USERNAME"
}
function New-Repo {
  Start-Process "https://github.com/new"
}
