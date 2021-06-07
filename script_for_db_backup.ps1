try
{
# Set PostgreSQL password as environment variable

$env:PGPASSWORD=[Password of PostgreSQL]

# Read database list from a specified path

$dbList=Get-Content -Path '[Databse List file path]'

#Backup repository path

$backUpPath='[Backup repository path]'

#Log file path
$logFilePath='[Log file path]'

# Create log file with date and time of the system

$dateCaptured = (Get-Date).tostring("dd-MM-yyyy HH_mm_ss")            
$fileName=New-Item -itemType File -Path $logFilePath -Name ($dateCaptured + "_DB_backup_operation.log")

#Loop for taking database backup one by one

foreach($i in $dbList){

$startTime=(Get-Date).tostring("dd-MM-yyyy HH_mm_ss")

# Message written in the log file

$startTime+' : Backup started for '+$i | Out-File -FilePath $fileName -Append

[Path to PostgreSQL bin]\pg_dump.exe -h [hostname] -p [port] -U [Username] -d $i -f $backUpPath$i".backup"

$endTime=(Get-Date).tostring("dd-MM-yyyy HH_mm_ss") 
$endTime+' : Backup ended for '+$i | Out-File -FilePath $fileName -Append
'--------------------'|Out-File -FilePath $fileName -Append
}
}
#Errors are written in the log file
catch
{
"Error Message: "+$_.Exception.Message|Out-File -FilePath $fileName -Append
"Error in Line: "+$_.InvocationInfo.Line|Out-File -FilePath $fileName -Append
"Eror in Line Number: "+$_.InvocationInfo.ScriptLineNumber|Out-File -FilePath $fileName -Append
"Error in Item Name: "+$_.Exception.ItemName|Out-File -FilePath $fileName -Append
}

