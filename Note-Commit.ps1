function CommitNote {
  param(
    [switch]$push
  )

  function RadheyShyam {
    Write-Host "Radhey Shyam..."
  }

  function Get-DateFormatted {
    return Get-Date -Format "yy-MMMM-dd"
  }

  # Function to get the next available note number for the current date
  function Get-NextCommitNumber {
    $dateFormatted = Get-Date -Format "yy-MMMM-dd"
    $counterFile = Join-Path $env:APPDATA ".notes_commit_counter"
  
    if (Test-Path $counterFile) {
      $savedDate, $noteCounter = Get-Content $counterFile -ErrorAction SilentlyContinue
    }
  
    if ($savedDate -ne $dateFormatted) {
      $noteCounter = 0
      $dateFormatted | Out-File $counterFile -Force
    }
  
    $noteCounter = [int]$noteCounter
    return $noteCounter
  }

  function Add-NextCommitNumber {
    $dateFormatted = Get-Date -Format "yy-MMMM-dd"
    $counterFile = Join-Path $env:APPDATA ".notes_commit_counter"
    $noteCounter = Get-NextCommitNumber
    $noteCounter++
    "$dateFormatted`n$noteCounter" | Out-File $counterFile -Force
    return
  }

  function Commit {
    $dateFormatted = Get-DateFormatted
    $nextCommitNumber = Get-NextCommitNumber
    $commitMessage = "Date-$dateFormatted-$nextCommitNumber"

    # Check if there are any changes to commit
    if (git status --short) {
      git add -A
      git commit -m $commitMessage
      RadheyShyam
      Write-Host "Committed: $commitMessage"
      Add-NextCommitNumber

    }
    else {
      Write-Host "Nothing to commit."
    }
    
    if ($push) {
      git push
    }
  }

  Commit
}
