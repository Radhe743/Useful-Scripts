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

> May be in future I will make a script to automatically install this script into your ps1 file :))

