
Write-Output "Radhey Shyam"
function Open-GH {
  param(
    [switch]$repo
  )

  if ($repo) {
    $gitSSHUrl = git remote get-url origin

    if ($gitSSHUrl -match 'github\.com') {
      $repoPath = $gitSSHUrl -replace '(git@github\.com:|\.git)', ''

      Start-Process "https://github.com/$repoPath"
    }
    else {
      Write-Output $gitSSHUrl
    }
  }
  else {
    Start-Process "https://github.com/golok727"
  }
}
function New-Repo {
  Start-Process "https://github.com/new"
}
Open-GH -repo