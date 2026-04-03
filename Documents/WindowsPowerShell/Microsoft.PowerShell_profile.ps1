# Ensure PSReadLine is loaded
Import-Module PSReadLine

# This makes Tab show a menu of options you can navigate with arrows
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set colors for syntax highlighting
Set-PSReadLineOption -Colors @{
    Command            = "#8470FF"   ## Purple/Slate Blue for commands
    Parameter          = "#a6accd"   ## Light gray for --parameters
    Operator           = "#89ddff"   ## Cyan for symbols like | or >
    Variable           = "#ff5d62"   ## Soft red for $variables
    String             = "#98c379"   ## Green for "text in quotes"
    Number             = "#ff9e64"   ## Orange for 123
    Comment            = "#565f89"   ## Dim blue for #comments
    Type               = "#7aa2f7"   ## Blue for [types]
    Error              = "#f7768e"   ## Bright red for typos
}

# Enable "Predictive IntelliSense" (Grey suggestions as you type)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

# 1. Fix encoding for MesloLGM Nerd Font icons
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 2. Prevent "Double Prompt" on reload
# If Oh My Posh is already running, we stop the old prompt function first
if (Test-Path Function:\oss-prompt) { Remove-Item Function:\oss-prompt }
if (Test-Path Function:\prompt) { Remove-Item Function:\prompt }

# 3. Initialize with Takuya
oh-my-posh init pwsh --config "takuya" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })
$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\RAVEN\.config\komorebi'