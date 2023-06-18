Invoke-Expression (& 'C:\Users\stefa\scoop\apps\starship\current\starship.exe' init powershell --print-full-init | Out-String)

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

$Env:XDG_CONFIG_HOME = "C:\Users\stefa\.config"
$Env:HOME = "C:\Users\stefa"
