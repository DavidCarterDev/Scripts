param($filter)
process {
    Get-ChildItem -Recurse -Filter $filter c:\ | Select-Object -Property directory,name
}