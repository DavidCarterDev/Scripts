param($filter)
process {
    Set-Location (Get-ChildItem -Recurse -Filter $filter c:\).Directory
}