# Melissa - MatchUp Object Global SQL Server CLR

## Purpose
This code showcases the Melissa MatchUp Object Global using SQL Server CLR .

Please feel free to copy or embed this code to your own project. Happy coding!

For the latest Melissa MatchUp Object Global release notes, please visit: https://releasenotes.melissa.com/on-premise-api/matchup-object-global/

For further details, please visit: https://wiki.melissadata.com/index.php?title=MatchUp_Object:Reference

## Tested Environments
- Windows 10 64-bit Microsoft SQL MaServer Management Studio 19, Powershell 5.1
- Melissa data files for 2023-Q3

## Required File(s) and Programs

#### Binaries
This is the c++ code of the Melissa Object.

- MatchupSQL.dll
- mdMatchup.dll
- mdGlobalParse.dll

#### Data File(s)
- icudt52l.dat
- mdMatchup.dat
- mdMatchup.mc
- mdMatchup.sac
- mdMatchup.cfg

## Getting Started
These instructions will get you a copy of the project up and running for development and testing purposes.

#### Set up Powershell settings
If running Powershell for the first time, you will need to run this command in the Powershell console: `Set-ExecutionPolicy RemoteSigned`.
The console will then prompt you with the following warning shown in the image below. 
 - Enter `'A'`. 
 	- If successful, the console will not output any messages. (You may need to run Powershell as administrator to enforce this setting).
	
 ![alt text](/screenshots/powershell_executionpolicy.png)
 
#### Download this project
```
$ git clone https://github.com/MelissaData/MatchUpObjectGlobal-SQLServerCLR
$ cd MatchUpObjectGlobal-SQLServerCLR
```

#### Set up Melissa Updater
Melissa Updater is a CLI application allowing the user to update their Melissa applications/data.
- Download Melissa Updater here: <https://releases.melissadata.net/Download/Library/WINDOWS/NET/ANY/latest/MelissaUpdater.exe>
- Create a folder within the cloned repo called `MelissaUpdater`.
- Put `MelissaUpdater.exe` in the `MelissaUpdater` folder you've just created.


## Run Powershell Script

Parameters:

- -license (optional): a license string to test the MatchUp Object Global
- -quiet (optional): add to the command if you do not want to get any console output from the Melissa Updater

This will get you the required binary and data files ready to use in the project Build and Data folders respectively.

 ```
    $ .\GetFilesMelissaMatchupObjectGlobal.ps1
    $ .\GetFilesMelissaMatchupObjectGlobal.ps1 -license "<your_license_string>"
 ```

For quiet mode:

```
    $ .\GetFilesMelissaMatchupObjectGlobal.ps1 -quiet
    $ .\GetFilesMelissaMatchupObjectGlobal.ps1 -license "<your_license_string>" -quiet
 ```

## Run SQL Scripts

Run these SQL scripts in the below order and make sure you follow the setup instructions at the top of each script:

- 1. InstallMatchupObjectGlobalSqlClr.sql
- 2. CreateMatchUpObjectGlobalTable.sql
- 3. MelissaMatchupObjectGlobalSqlClr.sql


## Contact Us
For free technical support, please call us at 800-MELISSA ext. 4 (800-635-4772 ext. 4) or email us at tech@melissa.com.

To purchase this product, contact the Melissa sales department at 800-MELISSA ext. 3 (800-635-4772 ext. 3).
 