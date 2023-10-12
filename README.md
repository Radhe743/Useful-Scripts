# Scripts for developers



1. `Note Commit Powershell Script`
   1. This is a script that I made to make my `obsidian` notes commit easier. To use this follow the steps 
   ```powershell
    Invoke-CommitNote
    # or 
    Invoke-CommitNote -push # To push to a remote repo after commit
   ```
   This will commit each days note with a format `yy-Month-dd-{counter}` format

   ### To install this use these steps
   1. Open your powershell profile file in your favorite editor

   ```powershell
      notepad $PROFILE
      #or
      code $PROFILE
   ```
   2. Clone the repo and get copy the location of the `Note-Commit.ps1` file
   3. add this to the end of the `$PROFILE` file
   ```powershell
    . "path/to/Note-commit.ps1"
   ```
   4. Reload your current session and you will be able to use it with the `Invoke-CommitNote` Command

1. `Github-Shortcuts`
   1. Unlocks the `Open-GH` and `New-Repo` commands
   ## `Open-GH`
      * `Open-GH -SetUser <username>` Set your github username this will be used to open your github homepage **(IMPORTANT)**
      * `Open-GH` will open your github profile. 
      * `Open-GH -Repo` will open your current repo

   ## `New-GH`
      * `New-GH` will open the github's repo creation page
