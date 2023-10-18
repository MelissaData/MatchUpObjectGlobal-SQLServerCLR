
/***********************************************************************************************

WELCOME TO MELISSA MATCHUP OBJECT GLOBAL SQL SERVER CLR

1. InstallMatchupObjectGlobalSQLServerCLR.sql
   Set up MatchUp Obejct Global SQL Server CLR functions.

   Before executing, search for '*** MODIFY ***' and replace with the respective information.

*************************************************************************************************/

-- Change database unmanaged code execution:
ALTER DATABASE [{Database}] SET TRUSTWORTHY ON              -- *** MODIFY *** Replace with your database name
USE [{Database}];                                           -- *** MODIFY *** Replace with your database name

-- Turn CLR on:
EXEC sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO

-- Remove functions and procedures if they already exist:
IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetComponentType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetComponentType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetComponentType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetComponentType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetWordCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetWordCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetWordCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetWordCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetStart') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetStart
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetStart') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetStart
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetStartPos') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetStartPos
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetStartPos') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetStartPos
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetTrim') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetTrim
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetTrim') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetTrim
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFuzzy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFuzzy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetFuzzy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetFuzzy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetNear') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetNear
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetNear') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetNear
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFieldMatch') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFieldMatch
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetFieldMatch') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetFieldMatch
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSwap') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSwap
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetSwap') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetSwap
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetCombination') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetCombination
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetCombination') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetCombination
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetComponentDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetComponentDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetComponentDescriptionFromEnum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetComponentDescriptionFromEnum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetComponentAbbreviation') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetComponentAbbreviation
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseComponentDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseComponentDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSizeDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSizeDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseSizeDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseSizeDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseWordCountDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseWordCountDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetStartDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetStartDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseStartDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseStartDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseStartPosDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseStartPosDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFuzzyDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFuzzyDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFuzzyDescriptionFromEnum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFuzzyDescriptionFromEnum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseFuzzyDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseFuzzyDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseNearDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseNearDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFieldMatchDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFieldMatchDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentParseFieldMatchDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentParseFieldMatchDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSwapDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSwapDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeComponentType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeComponentType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeWordCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeWordCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeStart') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeStart
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeTrim') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeTrim
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentCanChangeFuzzy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentCanChangeFuzzy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSizeMinimum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSizeMinimum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetSizeMaximum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetSizeMaximum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetAllowedStarts') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetAllowedStarts
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetAllowedFuzzies') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetAllowedFuzzies
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentIsAllowedFuzzy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentIsAllowedFuzzy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFuzzyNearType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFuzzyNearType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetNearMinimum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetNearMinimum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetNearMaximum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetNearMaximum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetAllowedFieldMatches') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetAllowedFieldMatches
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetAllowedCombinations') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetAllowedCombinations
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetAllowedSwaps') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetAllowedSwaps
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetComponentTypeEnum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetComponentTypeEnum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetFuzzyEnum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetFuzzyEnum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentSetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentSetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeComponentGetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeComponentGetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListSetPathToMatchUpFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListSetPathToMatchUpFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListInitializeDataFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListInitializeDataFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListGetInitializeErrorString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListGetInitializeErrorString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListGetMatchcodeCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListGetMatchcodeCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeListGetMatchcodeName') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeListGetMatchcodeName
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSetPathToMatchUpFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSetPathToMatchUpFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeInitializeDataFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeInitializeDataFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetInitializeErrorString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetInitializeErrorString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeFindMatchcode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeFindMatchcode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMatchcodeName') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMatchcodeName
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSetDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSetDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSetNGram') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSetNGram
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetNGram') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetNGram
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMatchcodeItemCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMatchcodeItemCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMatchcodeItem') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMatchcodeItem
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMappingItemCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMappingItemCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMappingItemType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMappingItemType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMappingItemLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMappingItemLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeAddMatchcodeItem') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeAddMatchcodeItem
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeInsertMatchcodeItem') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeInsertMatchcodeItem
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeChangeMatchcodeItem') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeChangeMatchcodeItem
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeDeleteMatchcodeItem') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeDeleteMatchcodeItem
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeRenameMatchcode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeRenameMatchcode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeDeleteMatchcode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeDeleteMatchcode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSave') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSave
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSaveToFile') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSaveToFile
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeCreateNewMatchcode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeCreateNewMatchcode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetRuleDescription') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetRuleDescription
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetMaximumCombinations') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetMaximumCombinations
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetAllowedInputMappingCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetAllowedInputMappingCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetAllowedInputMappingType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetAllowedInputMappingType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetAllowedInputMappingLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetAllowedInputMappingLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetInputMappingLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetInputMappingLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeParseInputMappingLabel') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeParseInputMappingLabel
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetBestInputMappingType') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetBestInputMappingType
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeIsDirectConversion') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeIsDirectConversion
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeIsConvertable') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeIsConvertable
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetInputMappingEnum') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetInputMappingEnum
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeSetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeSetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchcodeGetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUMatchcodeGetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetPathToMatchUpFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetPathToMatchUpFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetMatchcodeName') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetMatchcodeName
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetKeyFile') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetKeyFile
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteInitializeDataFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteInitializeDataFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetEncoding') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetEncoding
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetMaximumCharacterSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetMaximumCharacterSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetInitializeErrorString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetInitializeErrorString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetLicenseString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetLicenseString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetBuildNumber') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetBuildNumber
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetDatabaseDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetDatabaseDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetDatabaseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetDatabaseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetLicenseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetLicenseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteClearMappings') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteClearMappings
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteAddMapping') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteAddMapping
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteClearFields') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteClearFields
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteAddField') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteAddField
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteBuildKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteBuildKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteBuildKeyEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteBuildKeyEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetUserInfo') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetUserInfo
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteWriteRecord') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteWriteRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteWriteRecordEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteWriteRecordEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteProcess') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteProcess
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteReadRecord') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteReadRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteReadRecordEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteReadRecordEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetUserInfo') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetUserInfo
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetDupeGroup') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetDupeGroup
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetStatusCode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetStatusCode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetEntry') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetEntry
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetError') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetError
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetCombinations') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetCombinations
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetResults') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetResults
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetGroupSorting') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetGroupSorting
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteSetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteSetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUReadWriteGetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUReadWriteGetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetPathToMatchUpFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetPathToMatchUpFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetMatchcodeName') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetMatchcodeName
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetMustExist') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetMustExist
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetKeyFile') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetKeyFile
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalInitializeDataFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalInitializeDataFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetEncoding') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetEncoding
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetMaximumCharacterSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetMaximumCharacterSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetInitializeErrorString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetInitializeErrorString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetLicenseString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetLicenseString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetBuildNumber') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetBuildNumber
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetDatabaseDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetDatabaseDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetDatabaseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetDatabaseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetLicenseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetLicenseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalClearMappings') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalClearMappings
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalAddMapping') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalAddMapping
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalClearFields') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalClearFields
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalAddField') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalAddField
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalBuildKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalBuildKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalBuildKeyEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalBuildKeyEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetUserInfo') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetUserInfo
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalMatchRecord') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalMatchRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalMatchRecordEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalMatchRecordEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalAddRecord') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalAddRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalAddRecordEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalAddRecordEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalNextMatchingRecord') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalNextMatchingRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetUserInfo') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetUserInfo
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetDupeGroup') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetDupeGroup
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetStatusCode') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetStatusCode
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetCount') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetCount
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetEntry') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetEntry
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetCombinations') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetCombinations
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetResults') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetResults
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalSetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalSetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalGetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalGetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalBeginTransaction') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalBeginTransaction
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalCommitTransaction') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalCommitTransaction
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUIncrementalRollbackTransaction') AND type='FS')
BEGIN
  DROP FUNCTION mdMUIncrementalRollbackTransaction
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridCreate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridCreate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridDestroy') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridDestroy
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetPathToMatchUpFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetPathToMatchUpFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetMatchcodeName') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetMatchcodeName
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridInitializeDataFiles') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridInitializeDataFiles
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetEncoding') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetEncoding
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetMaximumCharacterSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetMaximumCharacterSize
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetInitializeErrorString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetInitializeErrorString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetLicenseString') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetLicenseString
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetBuildNumber') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetBuildNumber
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetDatabaseDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetDatabaseDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetDatabaseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetDatabaseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetLicenseExpirationDate') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetLicenseExpirationDate
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetMatchcodeObject') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetMatchcodeObject
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridClearMappings') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridClearMappings
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridAddMapping') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridAddMapping
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridClearFields') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridClearFields
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridAddField') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridAddField
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridBuildKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridBuildKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridBuildKeyEx') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridBuildKeyEx
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetKey') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetKey
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetKeySize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetKeySize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetClusterSize') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetClusterSize
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridCompareKeys') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridCompareKeys
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetResults') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetResults
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridSetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridSetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUHybridGetReserved') AND type='FS')
BEGIN
  DROP FUNCTION mdMUHybridGetReserved
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUInsertTable') AND type='PC')
BEGIN
  DROP PROCEDURE mdMUInsertTable
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchRecord') AND type='FT')
BEGIN
  DROP FUNCTION mdMUMatchRecord
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID('mdMUMatchTable') AND type='FT')
BEGIN
  DROP FUNCTION mdMUMatchTable
END
GO

-- Remove the CLR assembly if it already exists:
IF EXISTS (SELECT * FROM sys.assemblies WHERE name='MatchUpSql')
BEGIN
  DROP ASSEMBLY MatchUpSql
END
GO

-- Add the new CLR assembly:
DECLARE @dllLocation VARCHAR(1024);
SET @dllLocation='{Full Path}\MatchupSQL.dll';              -- *** MODIFY *** Replace with full path and name of MatchUpSQL.dll. By default, this file is available in the project Build folder.
CREATE ASSEMBLY MatchUpSql FROM @dllLocation WITH PERMISSION_SET=UNSAFE
GO

-- Add the new CLR functions:
CREATE FUNCTION mdMUMatchcodeComponentCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCreate
GO

CREATE FUNCTION mdMUMatchcodeComponentDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentDestroy
GO

CREATE FUNCTION mdMUMatchcodeComponentGetComponentType(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetComponentType
GO

CREATE FUNCTION mdMUMatchcodeComponentSetComponentType(@i BIGINT,@type INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetComponentType
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSize(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSize
GO

CREATE FUNCTION mdMUMatchcodeComponentSetSize(@i BIGINT,@size INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetSize
GO

CREATE FUNCTION mdMUMatchcodeComponentGetLabel(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetLabel
GO

CREATE FUNCTION mdMUMatchcodeComponentSetLabel(@i BIGINT,@label NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetLabel
GO

CREATE FUNCTION mdMUMatchcodeComponentGetWordCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetWordCount
GO

CREATE FUNCTION mdMUMatchcodeComponentSetWordCount(@i BIGINT,@count INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetWordCount
GO

CREATE FUNCTION mdMUMatchcodeComponentGetStart(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetStart
GO

CREATE FUNCTION mdMUMatchcodeComponentSetStart(@i BIGINT,@start INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetStart
GO

CREATE FUNCTION mdMUMatchcodeComponentGetStartPos(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetStartPos
GO

CREATE FUNCTION mdMUMatchcodeComponentSetStartPos(@i BIGINT,@startPos INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetStartPos
GO

CREATE FUNCTION mdMUMatchcodeComponentGetTrim(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetTrim
GO

CREATE FUNCTION mdMUMatchcodeComponentSetTrim(@i BIGINT,@trim INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetTrim
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFuzzy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFuzzy
GO

CREATE FUNCTION mdMUMatchcodeComponentSetFuzzy(@i BIGINT,@fuzzy INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetFuzzy
GO

CREATE FUNCTION mdMUMatchcodeComponentGetNear(@i BIGINT)
RETURNS FLOAT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetNear
GO

CREATE FUNCTION mdMUMatchcodeComponentSetNear(@i BIGINT,@near FLOAT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetNear
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFieldMatch(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFieldMatch
GO

CREATE FUNCTION mdMUMatchcodeComponentSetFieldMatch(@i BIGINT,@fieldMatch INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetFieldMatch
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSwap(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSwap
GO

CREATE FUNCTION mdMUMatchcodeComponentSetSwap(@i BIGINT,@swap INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetSwap
GO

CREATE FUNCTION mdMUMatchcodeComponentGetCombination(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetCombination
GO

CREATE FUNCTION mdMUMatchcodeComponentSetCombination(@i BIGINT,@combination INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetCombination
GO

CREATE FUNCTION mdMUMatchcodeComponentGetComponentDescription(@i BIGINT,@UseLabel BIT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetComponentDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetComponentDescriptionFromEnum(@i BIGINT,@Value INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetComponentDescriptionFromEnum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetComponentAbbreviation(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetComponentAbbreviation
GO

CREATE FUNCTION mdMUMatchcodeComponentParseComponentDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseComponentDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSizeDescription(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSizeDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseSizeDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseSizeDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseWordCountDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseWordCountDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetStartDescription(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetStartDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseStartDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseStartDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseStartPosDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseStartPosDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFuzzyDescription(@i BIGINT,@Decorated BIT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFuzzyDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFuzzyDescriptionFromEnum(@i BIGINT,@Value INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFuzzyDescriptionFromEnum
GO

CREATE FUNCTION mdMUMatchcodeComponentParseFuzzyDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseFuzzyDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseNearDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS FLOAT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseNearDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFieldMatchDescription(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFieldMatchDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentParseFieldMatchDescription(@i BIGINT,@Value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentParseFieldMatchDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSwapDescription(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSwapDescription
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeComponentType(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeComponentType
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeLabel(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeLabel
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeSize(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeSize
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeWordCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeWordCount
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeStart(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeStart
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeTrim(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeTrim
GO

CREATE FUNCTION mdMUMatchcodeComponentCanChangeFuzzy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentCanChangeFuzzy
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSizeMinimum(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSizeMinimum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetSizeMaximum(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetSizeMaximum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetAllowedStarts(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetAllowedStarts
GO

CREATE FUNCTION mdMUMatchcodeComponentGetAllowedFuzzies(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetAllowedFuzzies
GO

CREATE FUNCTION mdMUMatchcodeComponentIsAllowedFuzzy(@i BIGINT,@Value INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentIsAllowedFuzzy
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFuzzyNearType(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFuzzyNearType
GO

CREATE FUNCTION mdMUMatchcodeComponentGetNearMinimum(@i BIGINT)
RETURNS FLOAT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetNearMinimum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetNearMaximum(@i BIGINT)
RETURNS FLOAT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetNearMaximum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetAllowedFieldMatches(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetAllowedFieldMatches
GO

CREATE FUNCTION mdMUMatchcodeComponentGetAllowedCombinations(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetAllowedCombinations
GO

CREATE FUNCTION mdMUMatchcodeComponentGetAllowedSwaps(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetAllowedSwaps
GO

CREATE FUNCTION mdMUMatchcodeComponentGetComponentTypeEnum(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetComponentTypeEnum
GO

CREATE FUNCTION mdMUMatchcodeComponentGetFuzzyEnum(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetFuzzyEnum
GO

CREATE FUNCTION mdMUMatchcodeComponentSetReserved(@i BIGINT,@property NVARCHAR(4000),@value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentSetReserved
GO

CREATE FUNCTION mdMUMatchcodeComponentGetReserved(@i BIGINT,@property NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeComponentGetReserved
GO

CREATE FUNCTION mdMUMatchcodeListCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListCreate
GO

CREATE FUNCTION mdMUMatchcodeListDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListDestroy
GO

CREATE FUNCTION mdMUMatchcodeListSetPathToMatchUpFiles(@i BIGINT,@path NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListSetPathToMatchUpFiles
GO

CREATE FUNCTION mdMUMatchcodeListInitializeDataFiles(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListInitializeDataFiles
GO

CREATE FUNCTION mdMUMatchcodeListGetInitializeErrorString(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListGetInitializeErrorString
GO

CREATE FUNCTION mdMUMatchcodeListGetMatchcodeCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListGetMatchcodeCount
GO

CREATE FUNCTION mdMUMatchcodeListGetMatchcodeName(@i BIGINT,@pos INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeListGetMatchcodeName
GO

CREATE FUNCTION mdMUMatchcodeCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeCreate
GO

CREATE FUNCTION mdMUMatchcodeDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeDestroy
GO

CREATE FUNCTION mdMUMatchcodeSetPathToMatchUpFiles(@i BIGINT,@path NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSetPathToMatchUpFiles
GO

CREATE FUNCTION mdMUMatchcodeInitializeDataFiles(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeInitializeDataFiles
GO

CREATE FUNCTION mdMUMatchcodeGetInitializeErrorString(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetInitializeErrorString
GO

CREATE FUNCTION mdMUMatchcodeFindMatchcode(@i BIGINT,@name NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeFindMatchcode
GO

CREATE FUNCTION mdMUMatchcodeGetMatchcodeName(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMatchcodeName
GO

CREATE FUNCTION mdMUMatchcodeSetDescription(@i BIGINT,@desc NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSetDescription
GO

CREATE FUNCTION mdMUMatchcodeGetDescription(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetDescription
GO

CREATE FUNCTION mdMUMatchcodeSetNGram(@i BIGINT,@nGram INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSetNGram
GO

CREATE FUNCTION mdMUMatchcodeGetNGram(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetNGram
GO

CREATE FUNCTION mdMUMatchcodeGetMatchcodeItemCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMatchcodeItemCount
GO

CREATE FUNCTION mdMUMatchcodeGetMatchcodeItem(@i BIGINT,@pos INT)
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMatchcodeItem
GO

CREATE FUNCTION mdMUMatchcodeGetMappingItemCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMappingItemCount
GO

CREATE FUNCTION mdMUMatchcodeGetMappingItemType(@i BIGINT,@pos INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMappingItemType
GO

CREATE FUNCTION mdMUMatchcodeGetMappingItemLabel(@i BIGINT,@pos INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMappingItemLabel
GO

CREATE FUNCTION mdMUMatchcodeAddMatchcodeItem(@i BIGINT,@item BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeAddMatchcodeItem
GO

CREATE FUNCTION mdMUMatchcodeInsertMatchcodeItem(@i BIGINT,@pos INT,@item BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeInsertMatchcodeItem
GO

CREATE FUNCTION mdMUMatchcodeChangeMatchcodeItem(@i BIGINT,@pos INT,@item BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeChangeMatchcodeItem
GO

CREATE FUNCTION mdMUMatchcodeDeleteMatchcodeItem(@i BIGINT,@pos INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeDeleteMatchcodeItem
GO

CREATE FUNCTION mdMUMatchcodeRenameMatchcode(@i BIGINT,@name NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeRenameMatchcode
GO

CREATE FUNCTION mdMUMatchcodeDeleteMatchcode(@i BIGINT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeDeleteMatchcode
GO

CREATE FUNCTION mdMUMatchcodeSave(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSave
GO

CREATE FUNCTION mdMUMatchcodeSaveToFile(@i BIGINT,@name NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSaveToFile
GO

CREATE FUNCTION mdMUMatchcodeCreateNewMatchcode(@i BIGINT,@name NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeCreateNewMatchcode
GO

CREATE FUNCTION mdMUMatchcodeGetRuleDescription(@i BIGINT,@Rule_ INT,@Abbreviated_ BIT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetRuleDescription
GO

CREATE FUNCTION mdMUMatchcodeGetMaximumCombinations(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetMaximumCombinations
GO

CREATE FUNCTION mdMUMatchcodeGetAllowedInputMappingCount(@i BIGINT,@Mapping_ INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetAllowedInputMappingCount
GO

CREATE FUNCTION mdMUMatchcodeGetAllowedInputMappingType(@i BIGINT,@Mapping_ INT,@Pos_ INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetAllowedInputMappingType
GO

CREATE FUNCTION mdMUMatchcodeGetAllowedInputMappingLabel(@i BIGINT,@Mapping_ INT,@Pos_ INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetAllowedInputMappingLabel
GO

CREATE FUNCTION mdMUMatchcodeGetInputMappingLabel(@i BIGINT,@Mapping_ INT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetInputMappingLabel
GO

CREATE FUNCTION mdMUMatchcodeParseInputMappingLabel(@i BIGINT,@Value_ NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeParseInputMappingLabel
GO

CREATE FUNCTION mdMUMatchcodeGetBestInputMappingType(@i BIGINT,@Target_ INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetBestInputMappingType
GO

CREATE FUNCTION mdMUMatchcodeIsDirectConversion(@i BIGINT,@Source_ INT,@Target_ INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeIsDirectConversion
GO

CREATE FUNCTION mdMUMatchcodeIsConvertable(@i BIGINT,@Source_ INT,@Target_ INT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeIsConvertable
GO

CREATE FUNCTION mdMUMatchcodeGetInputMappingEnum(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetInputMappingEnum
GO

CREATE FUNCTION mdMUMatchcodeSetReserved(@i BIGINT,@property NVARCHAR(4000),@value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeSetReserved
GO

CREATE FUNCTION mdMUMatchcodeGetReserved(@i BIGINT,@property NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchcodeGetReserved
GO

CREATE FUNCTION mdMUReadWriteCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteCreate
GO

CREATE FUNCTION mdMUReadWriteDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteDestroy
GO

CREATE FUNCTION mdMUReadWriteSetPathToMatchUpFiles(@i BIGINT,@path NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetPathToMatchUpFiles
GO

CREATE FUNCTION mdMUReadWriteSetMatchcodeName(@i BIGINT,@name NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetMatchcodeName
GO

CREATE FUNCTION mdMUReadWriteSetMatchcodeObject(@i BIGINT,@matchcode BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetMatchcodeObject
GO

CREATE FUNCTION mdMUReadWriteSetKeyFile(@i BIGINT,@keyFile NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetKeyFile
GO

CREATE FUNCTION mdMUReadWriteInitializeDataFiles(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteInitializeDataFiles
GO

CREATE FUNCTION mdMUReadWriteSetEncoding(@i BIGINT,@encodingStr NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetEncoding
GO

CREATE FUNCTION mdMUReadWriteSetMaximumCharacterSize(@i BIGINT, @charSz INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetMaximumCharacterSize
GO

CREATE FUNCTION mdMUReadWriteGetInitializeErrorString(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetInitializeErrorString
GO

CREATE FUNCTION mdMUReadWriteSetLicenseString(@i BIGINT,@license NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetLicenseString
GO

CREATE FUNCTION mdMUReadWriteGetBuildNumber(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetBuildNumber
GO

CREATE FUNCTION mdMUReadWriteGetDatabaseDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetDatabaseDate
GO

CREATE FUNCTION mdMUReadWriteGetDatabaseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetDatabaseExpirationDate
GO

CREATE FUNCTION mdMUReadWriteGetLicenseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetLicenseExpirationDate
GO

CREATE FUNCTION mdMUReadWriteGetMatchcodeObject(@i BIGINT)
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetMatchcodeObject
GO

CREATE FUNCTION mdMUReadWriteClearMappings(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteClearMappings
GO

CREATE FUNCTION mdMUReadWriteAddMapping(@i BIGINT,@mapping INT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteAddMapping
GO

CREATE FUNCTION mdMUReadWriteClearFields(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteClearFields
GO

CREATE FUNCTION mdMUReadWriteAddField(@i BIGINT,@field NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteAddField
GO

CREATE FUNCTION mdMUReadWriteBuildKey(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteBuildKey
GO

CREATE FUNCTION mdMUReadWriteBuildKeyEx(@i BIGINT,@field1 NVARCHAR(4000),@field2 NVARCHAR(4000),@field3 NVARCHAR(4000),@field4 NVARCHAR(4000),@field5 NVARCHAR(4000),@field6 NVARCHAR(4000),@field7 NVARCHAR(4000),@field8 NVARCHAR(4000),@field9 NVARCHAR(4000),@field10 NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteBuildKeyEx
GO

CREATE FUNCTION mdMUReadWriteSetKey(@i BIGINT,@key NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetKey
GO

CREATE FUNCTION mdMUReadWriteSetUserInfo(@i BIGINT,@userInfo NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetUserInfo
GO

CREATE FUNCTION mdMUReadWriteWriteRecord(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteWriteRecord
GO

CREATE FUNCTION mdMUReadWriteWriteRecordEx(@i BIGINT,@key NVARCHAR(4000),@userInfo NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteWriteRecordEx
GO

CREATE FUNCTION mdMUReadWriteProcess(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteProcess
GO

CREATE FUNCTION mdMUReadWriteReadRecord(@i BIGINT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteReadRecord
GO

CREATE FUNCTION mdMUReadWriteReadRecordEx(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteReadRecordEx
GO

CREATE FUNCTION mdMUReadWriteGetKey(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetKey
GO

CREATE FUNCTION mdMUReadWriteGetUserInfo(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetUserInfo
GO

CREATE FUNCTION mdMUReadWriteGetDupeGroup(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetDupeGroup
GO

CREATE FUNCTION mdMUReadWriteGetStatusCode(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetStatusCode
GO

CREATE FUNCTION mdMUReadWriteGetCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetCount
GO

CREATE FUNCTION mdMUReadWriteGetEntry(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetEntry
GO

CREATE FUNCTION mdMUReadWriteGetError(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetError
GO

CREATE FUNCTION mdMUReadWriteGetCombinations(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetCombinations
GO

CREATE FUNCTION mdMUReadWriteGetResults(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetResults
GO

CREATE FUNCTION mdMUReadWriteSetGroupSorting(@i BIGINT,@groupSorting BIT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetGroupSorting
GO

CREATE FUNCTION mdMUReadWriteSetReserved(@i BIGINT,@property NVARCHAR(4000),@value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteSetReserved
GO

CREATE FUNCTION mdMUReadWriteGetReserved(@i BIGINT,@property NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUReadWriteGetReserved
GO

CREATE FUNCTION mdMUIncrementalCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalCreate
GO

CREATE FUNCTION mdMUIncrementalDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalDestroy
GO

CREATE FUNCTION mdMUIncrementalSetPathToMatchUpFiles(@i BIGINT,@path NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetPathToMatchUpFiles
GO

CREATE FUNCTION mdMUIncrementalSetMatchcodeName(@i BIGINT,@name NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetMatchcodeName
GO

CREATE FUNCTION mdMUIncrementalSetMatchcodeObject(@i BIGINT,@matchcode BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetMatchcodeObject
GO

CREATE FUNCTION mdMUIncrementalSetMustExist(@i BIGINT,@mustExist BIT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetMustExist
GO

CREATE FUNCTION mdMUIncrementalSetKeyFile(@i BIGINT,@keyFile NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetKeyFile
GO

CREATE FUNCTION mdMUIncrementalInitializeDataFiles(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalInitializeDataFiles
GO

CREATE FUNCTION mdMUIncrementalSetEncoding(@i BIGINT,@encodingStr NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetEncoding
GO

CREATE FUNCTION mdMUIncrementalSetMaximumCharacterSize(@i BIGINT, @charSz INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetMaximumCharacterSize
GO

CREATE FUNCTION mdMUIncrementalGetInitializeErrorString(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetInitializeErrorString
GO

CREATE FUNCTION mdMUIncrementalSetLicenseString(@i BIGINT,@license NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetLicenseString
GO

CREATE FUNCTION mdMUIncrementalGetBuildNumber(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetBuildNumber
GO

CREATE FUNCTION mdMUIncrementalGetDatabaseDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetDatabaseDate
GO

CREATE FUNCTION mdMUIncrementalGetDatabaseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetDatabaseExpirationDate
GO

CREATE FUNCTION mdMUIncrementalGetLicenseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetLicenseExpirationDate
GO

CREATE FUNCTION mdMUIncrementalGetMatchcodeObject(@i BIGINT)
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetMatchcodeObject
GO

CREATE FUNCTION mdMUIncrementalClearMappings(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalClearMappings
GO

CREATE FUNCTION mdMUIncrementalAddMapping(@i BIGINT,@mapping INT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalAddMapping
GO

CREATE FUNCTION mdMUIncrementalClearFields(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalClearFields
GO

CREATE FUNCTION mdMUIncrementalAddField(@i BIGINT,@field NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalAddField
GO

CREATE FUNCTION mdMUIncrementalBuildKey(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalBuildKey
GO

CREATE FUNCTION mdMUIncrementalBuildKeyEx(@i BIGINT,@field1 NVARCHAR(4000),@field2 NVARCHAR(4000),@field3 NVARCHAR(4000),@field4 NVARCHAR(4000),@field5 NVARCHAR(4000),@field6 NVARCHAR(4000),@field7 NVARCHAR(4000),@field8 NVARCHAR(4000),@field9 NVARCHAR(4000),@field10 NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalBuildKeyEx
GO

CREATE FUNCTION mdMUIncrementalSetKey(@i BIGINT,@key NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetKey
GO

CREATE FUNCTION mdMUIncrementalSetUserInfo(@i BIGINT,@userInfo NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetUserInfo
GO

CREATE FUNCTION mdMUIncrementalMatchRecord(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalMatchRecord
GO

CREATE FUNCTION mdMUIncrementalMatchRecordEx(@i BIGINT,@key NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalMatchRecordEx
GO

CREATE FUNCTION mdMUIncrementalAddRecord(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalAddRecord
GO

CREATE FUNCTION mdMUIncrementalAddRecordEx(@i BIGINT,@key NVARCHAR(4000),@userInfo NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalAddRecordEx
GO

CREATE FUNCTION mdMUIncrementalNextMatchingRecord(@i BIGINT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalNextMatchingRecord
GO

CREATE FUNCTION mdMUIncrementalGetKey(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetKey
GO

CREATE FUNCTION mdMUIncrementalGetUserInfo(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetUserInfo
GO

CREATE FUNCTION mdMUIncrementalGetDupeGroup(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetDupeGroup
GO

CREATE FUNCTION mdMUIncrementalGetStatusCode(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetStatusCode
GO

CREATE FUNCTION mdMUIncrementalGetCount(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetCount
GO

CREATE FUNCTION mdMUIncrementalGetEntry(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetEntry
GO

CREATE FUNCTION mdMUIncrementalGetCombinations(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetCombinations
GO

CREATE FUNCTION mdMUIncrementalGetResults(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetResults
GO

CREATE FUNCTION mdMUIncrementalSetReserved(@i BIGINT,@property NVARCHAR(4000),@value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalSetReserved
GO

CREATE FUNCTION mdMUIncrementalGetReserved(@i BIGINT,@property NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalGetReserved
GO

CREATE FUNCTION mdMUIncrementalBeginTransaction(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalBeginTransaction
GO

CREATE FUNCTION mdMUIncrementalCommitTransaction(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalCommitTransaction
GO

CREATE FUNCTION mdMUIncrementalRollbackTransaction(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUIncrementalRollbackTransaction
GO

CREATE FUNCTION mdMUHybridCreate()
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridCreate
GO

CREATE FUNCTION mdMUHybridDestroy(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridDestroy
GO

CREATE FUNCTION mdMUHybridSetPathToMatchUpFiles(@i BIGINT,@path NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetPathToMatchUpFiles
GO

CREATE FUNCTION mdMUHybridSetMatchcodeName(@i BIGINT,@name NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetMatchcodeName
GO

CREATE FUNCTION mdMUHybridSetMatchcodeObject(@i BIGINT,@matchcode BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetMatchcodeObject
GO

CREATE FUNCTION mdMUHybridInitializeDataFiles(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridInitializeDataFiles
GO

CREATE FUNCTION mdMUHybridSetEncoding(@i BIGINT,@encodingStr NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetEncoding
GO

CREATE FUNCTION mdMUHybridSetMaximumCharacterSize(@i BIGINT, @charSz INT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetMaximumCharacterSize
GO

CREATE FUNCTION mdMUHybridGetInitializeErrorString(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetInitializeErrorString
GO

CREATE FUNCTION mdMUHybridSetLicenseString(@i BIGINT,@license NVARCHAR(4000))
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetLicenseString
GO

CREATE FUNCTION mdMUHybridGetBuildNumber(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetBuildNumber
GO

CREATE FUNCTION mdMUHybridGetDatabaseDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetDatabaseDate
GO

CREATE FUNCTION mdMUHybridGetDatabaseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetDatabaseExpirationDate
GO

CREATE FUNCTION mdMUHybridGetLicenseExpirationDate(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetLicenseExpirationDate
GO

CREATE FUNCTION mdMUHybridGetMatchcodeObject(@i BIGINT)
RETURNS BIGINT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetMatchcodeObject
GO

CREATE FUNCTION mdMUHybridClearMappings(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridClearMappings
GO

CREATE FUNCTION mdMUHybridAddMapping(@i BIGINT,@mapping INT)
RETURNS BIT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridAddMapping
GO

CREATE FUNCTION mdMUHybridClearFields(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridClearFields
GO

CREATE FUNCTION mdMUHybridAddField(@i BIGINT,@field NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridAddField
GO

CREATE FUNCTION mdMUHybridBuildKey(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridBuildKey
GO

CREATE FUNCTION mdMUHybridBuildKeyEx(@i BIGINT,@field1 NVARCHAR(4000),@field2 NVARCHAR(4000),@field3 NVARCHAR(4000),@field4 NVARCHAR(4000),@field5 NVARCHAR(4000),@field6 NVARCHAR(4000),@field7 NVARCHAR(4000),@field8 NVARCHAR(4000),@field9 NVARCHAR(4000),@field10 NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridBuildKeyEx
GO

CREATE FUNCTION mdMUHybridGetKey(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetKey
GO

CREATE FUNCTION mdMUHybridGetKeySize(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetKeySize
GO

CREATE FUNCTION mdMUHybridGetClusterSize(@i BIGINT)
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetClusterSize
GO

CREATE FUNCTION mdMUHybridCompareKeys(@i BIGINT,@key1 NVARCHAR(4000),@key2 NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridCompareKeys
GO

CREATE FUNCTION mdMUHybridGetResults(@i BIGINT)
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetResults
GO

CREATE FUNCTION mdMUHybridSetReserved(@i BIGINT,@property NVARCHAR(4000),@value NVARCHAR(4000))
RETURNS INT WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridSetReserved
GO

CREATE FUNCTION mdMUHybridGetReserved(@i BIGINT,@property NVARCHAR(4000))
RETURNS NVARCHAR(4000) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUHybridGetReserved
GO

CREATE PROCEDURE mdMUInsertTable(@retVal INT OUTPUT,@configFile NVARCHAR(4000),@insertTable NVARCHAR(4000),@masterTable NVARCHAR(4000))
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUInsertTable
GO

CREATE FUNCTION mdMUMatchRecord(@configFile NVARCHAR(4000),@fields NVARCHAR(4000),@masterTable NVARCHAR(4000),@idColumn NVARCHAR(4000))
RETURNS TABLE (Id INT,Result NVARCHAR(128),Dupes INT,DupeNo INT,[Key] NVARCHAR(1024)) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchRecord
GO

CREATE FUNCTION mdMUMatchTable(@configFile NVARCHAR(4000),@matchTable NVARCHAR(4000),@masterTable NVARCHAR(4000),@idColumn NVARCHAR(4000))
RETURNS TABLE (Id INT,Result NVARCHAR(128),Dupes INT,DupeNo INT,[Key] NVARCHAR(1024)) WITH EXECUTE AS CALLER
AS EXTERNAL NAME MatchUpSQL.MelissaDataDQT.mdMUMatchTable
GO