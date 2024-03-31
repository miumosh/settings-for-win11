$MaximumHistoryCount=32760

$PSReadlineOptions = @{
  BellStyle = "None"
	EditMode = "emacs"
	HistoryNoDuplicates = $true
	HistorySearchCursorMovesToEnd = $true
	Colors = @{
		Command = "White"
	}
}
Set-PSReadlineOption @PSReadlineOptions

Set-PsFzfOption `
  -PSReadlineChordProvider 'Ctrl+t' `
  -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineKeyHandler `
  -Key Tab `
  -ScriptBlock { Invoke-FzfTabCompletion }

$env:FZF_DEFAULT_OPTS="--height 50% --layout=reverse"
