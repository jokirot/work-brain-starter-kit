param([Parameter(Mandatory)][string]$Begriff,
      [string]$Brain = $(if ($env:WORK_BRAIN) { $env:WORK_BRAIN } else { "$env:USERPROFILE\work-brain" }))
if (Get-Command rg -ErrorAction SilentlyContinue) {
  rg -i -n --glob '*.md' -C1 -- $Begriff $Brain
} else {
  Get-ChildItem $Brain -Recurse -Filter *.md | Select-String -Pattern $Begriff -SimpleMatch -Context 0,1 |
    ForEach-Object { "{0}:{1}: {2}" -f $_.Path, $_.LineNumber, $_.Line.Trim() }
}
