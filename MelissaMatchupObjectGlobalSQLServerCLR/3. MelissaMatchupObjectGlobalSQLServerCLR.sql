
/***********************************************************************************************

3. MelissaMatchupObjectGlobalSQLServerCLR.sql
   Run the MatchUp process on the sample input table.

   Input Table Name:   [MatchupGlobalSampleInput] 
   Output Table Name:  [MatchupGlobalSampleInput_output]

   Before executing, search for '*** MODIFY ***' and replace with the respective information.

*************************************************************************************************/

USE [{Database}];                              -- *** MODIFY *** Replace with your database name

SET NOCOUNT ON
-- This block allows you to create a new Output table which will be populated with 
-- unique records and records which have duplicates, but are not flagged duplicates

IF OBJECT_ID('dbo.MatchupGlobalSampleInput_output', 'U') IS NOT NULL 
  BEGIN
    DROP TABLE dbo.[MatchupGlobalSampleInput_output];
  END
GO

CREATE TABLE [dbo].[MatchupGlobalSampleInput_output] (
	IDENT     INT  NOT NULL,
	MatchKey  NVARCHAR(200) NULL,
	DupeGroup INT NULL,
	[Results] NVARCHAR(32) NULL,
    [Count]   int null,
    [Combos]  NVARCHAR(16) NULL,
    [Entry]   int null
)
GO



DECLARE @dFILELOC VARCHAR(256), @dLICENSE VARCHAR(256), @dKEYFILE VARCHAR(256), @MATCHCODENAME VARCHAR(256)
SET @dFILELOC = '{Full Path}\Data'                                      -- *** MODIFY *** Replace with your full path to where your data files folder locates

--   Specify a file to store the match key built for each record 
SET @dKEYFILE = '{Full Path}\temp.key'                 -- *** MODIFY *** Replace with your full path 


/*************************** LICENSE STRINGS ***************************
     You will need a valid license string to use MatchUp Object Global,   
     please call a sales representative at 1-800-MELISSA ext. 3 
          (1-800-635-4772 x3) for a license string        
                
 
     MatchUp will also check for a valid license in  
     the MD_LICENSE(Environment) variable. This allows you   
     to modify the license without recompiling the project
************************************************************************/

SET @dLICENSE = '{License Key}'                           -- *** MODIFY *** Replace with your Melissa License Key

--   Specify the matchcode used to compare records
SET @MATCHCODENAME = 'Global Address'

DECLARE @Total INT, @Dupes INT

DECLARE @ReadWrite BIGINT, @Error INT, @RetVal INT, @mcHit INT
DECLARE @ErrorString NVARCHAR(1024)
DECLARE @Results NVARCHAR(1024)
SET @Total = 0
SET @Dupes = 0 

SET @ReadWrite = dbo.mdMUReadWriteCreate()


IF dbo.mdMUReadWriteSetLicenseString(@ReadWrite, @dLICENSE) = 0 BEGIN
  RAISERROR ('Error setting license to %s', 16, 1, @dLICENSE)
  RAISERROR ('Please contact a sales representative at 1-800-800-6245 x3 for a valid license string', 16, 1)
  RETURN
END

SET @RetVal = dbo.mdMUReadWriteSetPathToMatchUpFiles(@ReadWrite, @dFILELOC)
SET @RetVal = dbo.mdMUReadWriteSetMatchcodeName(@ReadWrite, @MATCHCODENAME)
SET @RetVal = dbo.mdMUReadWriteSetKeyFile(@ReadWrite,  @dKEYFILE)


-- Set this property to '1' if you would like records returned in group order
SET @RetVal = dbo.mdMUReadWriteSetGroupSorting(@ReadWrite, 1)
 
-- Initialize the session:
IF dbo.mdMUReadWriteInitializeDataFiles(@ReadWrite) != 0 BEGIN
  SET @ErrorString = dbo.mdMUReadWriteGetInitializeErrorString(@ReadWrite)
  RAISERROR ('Error Initializing mdMUReadWrite: %s', 16, 1, @ErrorString)
  RETURN
END



---- Return properties of the initialized Object
PRINT '============== WELCOME TO MELISSA MATCHUP OBJECT GLOBAL SQL SERVER CLR ==============='
PRINT '                     Database Date   : ' + dbo.mdMUReadWriteGetDatabaseDate(@ReadWrite)
PRINT '                     Expiration Date : ' + dbo.mdMUReadWriteGetDatabaseExpirationDate(@ReadWrite)
PRINT '                     Object Version  : ' + dbo.mdMUReadWriteGetBuildNumber(@ReadWrite)

PRINT '=================================== INPUT ============================================'
PRINT '                     Table Name:   [MatchupGlobalSampleInput]                           ' 
PRINT ''   
   
PRINT '================================== OUTPUT ============================================'
PRINT '                     Table Name:   [MatchupGlobalSampleInput_output]                    ' 
PRINT ''   


-- Clear any remaining mappings and Establish field mappings:
SET @RetVal = dbo.mdMUReadWriteClearMappings(@ReadWrite)


-- Add the correct mappings - which tell MatchUp the format of incoming data you are about to send to it.
IF dbo.mdMUReadWriteAddMapping(@ReadWrite, 21) = 0 BEGIN
  RAISERROR ('Incorrect AddMapping() parameter', 16, 1)
  RETURN
END 
IF dbo.mdMUReadWriteAddMapping(@ReadWrite, 14) = 0 BEGIN
  RAISERROR ('Incorrect AddMapping() parameter', 16, 1)
  RETURN
END



--   Write Matchcode Keys to table and submit them to the deduper:
--   Since the MatchUp SetUSerInfo function requires a return value, we'll just put the value into the temporarily into the DupeGroup field.
UPDATE [MatchupGlobalSampleInput] SET Results = '',
  MatchKey = dbo.mdMUReadWriteBuildKeyEx(@ReadWrite, Country, [Address1], [Address2], [Address3], ' ', ' ', ' ', ' ', ' ',' '),
  DupeGroup = dbo.mdMUReadWriteSetUserInfo(@ReadWrite, [IDENT]) +
  dbo.mdMUReadWriteWriteRecord(@ReadWrite)


-- Initiate processing:
SET @Error = dbo.mdMUReadWriteProcess(@ReadWrite)

PRINT 'For Each record processed: '
PRINT ''
print 'RECORD_ID           BUILT MATCHKEY '
print '(SetUserInfo)       (Used to detect duplicates)'
print '__________________________________________________________'

--Retrieve the Results. Duplicates will not be written to the new Output table
WHILE dbo.mdMUReadWriteReadRecord(@ReadWrite) != 0 BEGIN
  SET @Total = @Total + 1
  print left(dbo.mdMUReadWriteGetUserInfo(@ReadWrite) + space(20),20) +  dbo.mdMUReadWriteGetKey(@ReadWrite)
  IF ((dbo.mdMUReadWriteGetResults(@ReadWrite) like '%MS%') or ( dbo.mdMUReadWriteGetResults(@ReadWrite) like '%MS02%'))
    BEGIN
      INSERT INTO [MatchupGlobalSampleInput_output] (IDENT, MatchKey,DupeGroup,[Results],[Count],[Combos],[Entry])
        VALUES (dbo.mdMUReadWriteGetUserInfo(@ReadWrite),
                dbo.mdMUReadWriteGetKey(@ReadWrite),
			    dbo.mdMUReadWriteGetDupeGroup(@ReadWrite),
			    dbo.mdMUReadWriteGetResults(@ReadWrite),
			    dbo.mdMUReadWriteGetCount(@ReadWrite),
			    dbo.mdMUReadWriteGetCombinations(@ReadWrite),
			    dbo.mdMUReadWriteGetEntry(@ReadWrite)
               )	   
    END
  ELSE
    BEGIN
      SET @Dupes = @Dupes + 1
    END
END

-- Lets see the clean output table:
select * from [MatchupGlobalSampleInput_output]

-- Close the process:
SET @Error = dbo.mdMUReadWriteDestroy(@ReadWrite)

PRINT ''
print 'Total: '+ str(@Total)
print 'Dupes: '+ str(@Dupes)