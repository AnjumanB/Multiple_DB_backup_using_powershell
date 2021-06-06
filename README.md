# Multiple_DB_backup_using_powershell

**#Introduction**

This project describes a way to take backup of multiple PostgreSQL DBs using a powershell script.
pgdumpall command can be used to take backup of all databases in one server of PostgreSQL. But pgdumpall takes backup of databases in a single file hence it is not possible to take backup of any specific or a few databases of one's requirement. So a logic has been implemented to take backup of PostgreSQL databases of one's choice or requirement.Logic has been developed in Powershell. Script has been successfully tested on PostgreSQL EDB advanced server version 13. Logical aspect for the same has been mentioned in the next section.

**#Logic**

i) Read the list of databases from a text file.<br>
ii) Set the path where backup of databses are to kept.<br>
iii) Set the path where log file of the backup activity is to be created.<br>
iv) Create log file to designated path.<br>
v) Start a loop to take backup of all databases as read from the text file one by one.<br>
vi) Write log of the backup activity with start and end time of backup for every databases.<br>
vii) Log errors if any into log file with error message, line number and error item.<br>

**#Further scope**

The same logic can be applied to create a similar script for restoring multipe databases.

