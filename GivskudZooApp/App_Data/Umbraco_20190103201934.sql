-- Script Date: 1/3/2019 9:19 PM  - ErikEJ.SqlCeScripting version 3.5.2.26
-- Database information:
-- Locale Identifier: 1030
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\xampp\htdocs\zoo\GivskudZooApp\App_Data\\Umbraco_20190103201934.sdf
-- ServerVersion: 4.0.8902.1
-- DatabaseSize: 2752512
-- Created: 1/3/2019 9:19 PM

-- User Table information:
-- Number of tables: 51
-- cmsContent: 28 row(s)
-- cmsContentType: 17 row(s)
-- cmsContentType2ContentType: 1 row(s)
-- cmsContentTypeAllowedContentType: 11 row(s)
-- cmsContentVersion: 83 row(s)
-- cmsContentXml: 14 row(s)
-- cmsDataType: 161 row(s)
-- cmsDataTypePreValues: 405 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 74 row(s)
-- cmsDocumentType: 8 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 1 row(s)
-- cmsMacroProperty: 1 row(s)
-- cmsMedia: 9 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 9 row(s)
-- cmsPreviewXml: 46 row(s)
-- cmsPropertyData: 433 row(s)
-- cmsPropertyType: 50 row(s)
-- cmsPropertyTypeGroup: 18 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 11 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoAudit: 92 row(s)
-- umbracoCacheInstruction: 21 row(s)
-- umbracoConsent: 0 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLock: 1 row(s)
-- umbracoLog: 656 row(s)
-- umbracoMigration: 1 row(s)
-- umbracoNode: 222 row(s)
-- umbracoRedirectUrl: 0 row(s)
-- umbracoRelation: 14 row(s)
-- umbracoRelationType: 3 row(s)
-- umbracoServer: 3 row(s)
-- umbracoUser: 3 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2UserGroup: 4 row(s)
-- umbracoUserGroup: 5 row(s)
-- umbracoUserGroup2App: 12 row(s)
-- umbracoUserGroup2NodePermission: 0 row(s)
-- umbracoUserLogin: 43 row(s)
-- umbracoUserStartNode: 0 row(s)

CREATE TABLE [cmsContent] (
  [pk] int NOT NULL  IDENTITY (48,1)
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int NOT NULL  IDENTITY (561,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) NOT NULL DEFAULT ('folder.png')
, [description] nvarchar(1500) NULL
, [isContainer] bit NOT NULL DEFAULT ('0')
, [allowAtRoot] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int NOT NULL  IDENTITY (171,1)
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int NOT NULL  IDENTITY (177,1)
, [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int NOT NULL  IDENTITY (530,1)
, [datatypeNodeId] int NOT NULL
, [value] ntext NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(450) NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [templateId] int NULL
, [newest] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int NOT NULL  IDENTITY (2,1)
, [uniqueId] uniqueidentifier NOT NULL
, [macroUseInEditor] bit NOT NULL DEFAULT ('0')
, [macroRefreshRate] int NOT NULL DEFAULT ('0')
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit NOT NULL DEFAULT ('1')
, [macroCachePersonalized] bit NOT NULL DEFAULT ('0')
, [macroDontRender] bit NOT NULL DEFAULT ('0')
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int NOT NULL  IDENTITY (2,1)
, [uniquePropertyId] uniqueidentifier NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int NOT NULL DEFAULT ('0')
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMedia] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [mediaPath] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) NOT NULL DEFAULT ('''')
, [LoginName] nvarchar(1000) NOT NULL DEFAULT ('''')
, [Password] nvarchar(1000) NOT NULL DEFAULT ('''')
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int NOT NULL  IDENTITY (10,1)
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit NOT NULL DEFAULT ('0')
, [viewOnProfile] bit NOT NULL DEFAULT ('0')
, [isSensitive] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int NOT NULL  IDENTITY (825,1)
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDecimal] numeric(38,6) NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int NOT NULL  IDENTITY (124,1)
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int NOT NULL DEFAULT ('0')
, [mandatory] bit NOT NULL DEFAULT ('0')
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
, [UniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int NOT NULL  IDENTITY (39,1)
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int NOT NULL  IDENTITY (1,1)
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit NOT NULL DEFAULT ('0')
, [id] int NOT NULL  IDENTITY (1,1)
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime NOT NULL DEFAULT (GETDATE())
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int NOT NULL  IDENTITY (14,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAudit] (
  [id] int NOT NULL  IDENTITY (93,1)
, [performingUserId] int NOT NULL
, [performingDetails] nvarchar(1024) NULL
, [performingIp] nvarchar(64) NULL
, [eventDateUtc] datetime NOT NULL DEFAULT (GETDATE())
, [affectedUserId] int NOT NULL
, [affectedDetails] nvarchar(1024) NULL
, [eventType] nvarchar(256) NOT NULL
, [eventDetails] nvarchar(1024) NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int NOT NULL  IDENTITY (541,1)
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
, [instructionCount] int NOT NULL DEFAULT ('1')
);
GO
CREATE TABLE [umbracoConsent] (
  [id] int NOT NULL  IDENTITY (1,1)
, [current] bit NOT NULL
, [source] nvarchar(512) NOT NULL
, [context] nvarchar(128) NOT NULL
, [action] nvarchar(512) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [state] int NOT NULL
, [comment] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int NOT NULL  IDENTITY (1,1)
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int NOT NULL  IDENTITY (2,1)
, [languageISOCode] nvarchar(14) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoLock] (
  [id] int NOT NULL  IDENTITY (1,1)
, [value] int NOT NULL
, [name] nvarchar(64) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int NOT NULL  IDENTITY (657,1)
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime NOT NULL DEFAULT (GETDATE())
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoMigration] (
  [id] int NOT NULL  IDENTITY (100,1)
, [name] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [version] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int NOT NULL  IDENTITY (1285,1)
, [trashed] bit NOT NULL DEFAULT ('0')
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int NOT NULL  IDENTITY (31,1)
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime NOT NULL DEFAULT (GETDATE())
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int NOT NULL  IDENTITY (4,1)
, [typeUniqueId] uniqueidentifier NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int NOT NULL  IDENTITY (4,1)
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime NOT NULL DEFAULT (GETDATE())
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int NOT NULL  IDENTITY (3,1)
, [userDisabled] bit NOT NULL DEFAULT ('0')
, [userNoConsole] bit NOT NULL DEFAULT ('0')
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [passwordConfig] nvarchar(500) NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
, [emailConfirmedDate] datetime NULL
, [invitedDate] datetime NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [avatar] nvarchar(500) NULL
, [tourData] ntext NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser2UserGroup] (
  [userId] int NOT NULL
, [userGroupId] int NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup] (
  [id] int NOT NULL  IDENTITY (6,1)
, [userGroupAlias] nvarchar(200) NOT NULL
, [userGroupName] nvarchar(200) NOT NULL
, [userGroupDefaultPermissions] nvarchar(50) NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [icon] nvarchar(255) NULL
, [startContentId] int NULL
, [startMediaId] int NULL
);
GO
CREATE TABLE [umbracoUserGroup2App] (
  [userGroupId] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup2NodePermission] (
  [userGroupId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserLogin] (
  [sessionId] uniqueidentifier NOT NULL
, [userId] int NOT NULL
, [loggedInUtc] datetime NOT NULL
, [lastValidatedUtc] datetime NOT NULL
, [loggedOutUtc] datetime NULL
, [ipAddress] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoUserStartNode] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [startNode] int NOT NULL
, [startNodeType] int NOT NULL
);
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (1,1062,1061);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (23,1187,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (24,1188,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (25,1189,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (5,1093,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (26,1194,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (27,1195,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (45,1268,1263);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (9,1161,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (28,1196,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (29,1197,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (30,1198,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (31,1199,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (32,1200,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (33,1201,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (19,1183,1076);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (34,1202,1032);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (35,1214,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (36,1215,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (37,1216,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (38,1217,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (39,1218,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (40,1224,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (41,1230,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (42,1234,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (44,1259,1163);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (46,1269,1264);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (47,1278,1264);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (534,1033,N'File',N'icon-document',N'icon-document',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (535,1061,N'home',N'icon-home color-black',N'folder.png',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (540,1076,N'animals',N'icon-flowerpot color-black',N'folder.png',NULL,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (537,1068,N'banner',N'icon-disk-image color-black',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (538,1071,N'content',N'icon-umb-content color-black',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (539,1074,N'sEO',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (558,1263,N'calendar',N'icon-document',N'folder.png',NULL,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (559,1264,N'calendarItem',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (551,1223,N'galleryForAnimals',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (549,1163,N'animal',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (547,1112,N'feature',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (554,1254,N'animalCollection',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (555,1258,N'category',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (560,1282,N'maps',N'icon-document',N'folder.png',NULL,0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1068,1163);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1033,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1076,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1263,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1264,2);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1076,1163,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1163,3);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1254,4);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1258,5);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1263,1264,0);
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (1,1062,'b8c19884-7ecd-4c1e-a776-5b9ccd80387d',{ts '2018-11-23 14:26:50.670'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (91,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',{ts '2018-12-10 15:33:34.040'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (92,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',{ts '2018-12-10 15:35:40.393'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (93,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',{ts '2018-12-10 15:36:07.447'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (94,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',{ts '2018-12-10 15:36:07.483'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (6,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',{ts '2018-12-05 23:38:23.667'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (95,1183,'d6edbe5c-9a2b-4aaa-b487-8e50f933e3d2',{ts '2018-12-10 15:36:35.520'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (96,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',{ts '2018-12-11 09:46:08.520'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (97,1183,'9343da05-0e14-471e-b7db-a938488e3f45',{ts '2018-12-11 09:46:22.027'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (98,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',{ts '2018-12-11 09:58:23.767'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (99,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',{ts '2018-12-11 10:04:53.663'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (100,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',{ts '2018-12-11 10:32:16.067'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (101,1183,'bdd00222-58c7-4931-8851-a318145fbaf9',{ts '2018-12-11 10:32:59.153'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (102,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',{ts '2018-12-11 10:33:52.793'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (103,1183,'766f2fe8-91bf-4526-bc0c-b03b10fc108c',{ts '2018-12-11 13:57:28.307'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (104,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',{ts '2018-12-11 12:03:19.480'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (105,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',{ts '2018-12-11 12:56:29.940'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (106,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',{ts '2018-12-11 12:56:39.433'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (107,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',{ts '2018-12-11 12:56:40.277'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (20,1062,'f7b14908-e95e-4c68-9ce9-982e2bbf1eb6',{ts '2018-12-28 13:03:43.247'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (108,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',{ts '2018-12-11 12:56:41.053'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (109,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',{ts '2018-12-11 12:56:41.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (110,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',{ts '2018-12-11 12:56:42.800'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (111,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',{ts '2018-12-11 12:56:43.653'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (162,1268,'ce82372e-c9e2-400e-8d78-1d8c694c681b',{ts '2018-12-28 13:28:17.183'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (112,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',{ts '2018-12-11 12:56:55.693'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (113,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',{ts '2018-12-11 13:52:49.553'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (114,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',{ts '2018-12-11 13:53:10.853'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (115,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',{ts '2018-12-11 13:53:58.487'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (116,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',{ts '2018-12-11 13:54:31.773'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (117,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',{ts '2018-12-11 13:57:01.587'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (32,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',{ts '2018-12-10 10:29:06.713'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (118,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',{ts '2018-12-11 13:57:01.630'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (119,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',{ts '2018-12-11 13:57:09.637'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (120,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',{ts '2018-12-11 13:57:09.673'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (121,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',{ts '2018-12-11 13:57:16.220'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (122,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',{ts '2018-12-11 13:57:16.247'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (123,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',{ts '2018-12-11 13:57:21.943'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (124,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',{ts '2018-12-11 13:57:21.967'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (125,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',{ts '2018-12-11 13:58:16.260'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (126,1183,'3e60ff2b-3499-4adf-89ec-1479cbca25aa',{ts '2018-12-11 14:07:21.537'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (127,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',{ts '2018-12-11 14:06:33.540'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (128,1183,'e0aa7661-4c7b-4ce8-bbbc-29f4be1bd3f6',{ts '2018-12-11 14:16:30.753'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (129,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',{ts '2018-12-11 14:15:54.163'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (130,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',{ts '2018-12-11 14:15:54.237'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (131,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',{ts '2018-12-11 14:17:49.703'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (132,1183,'e93a8bcb-2137-4d13-8195-6d8a08a666e7',{ts '2018-12-11 14:18:10.147'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (133,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',{ts '2018-12-11 14:18:36.440'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (134,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',{ts '2018-12-11 14:31:48.317'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (135,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',{ts '2018-12-11 14:31:48.387'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (136,1189,'5879eef9-5b97-4859-b810-44a068d140dc',{ts '2018-12-11 14:31:49.927'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (137,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',{ts '2018-12-11 14:31:49.947'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (138,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',{ts '2018-12-11 14:31:51.140'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (139,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',{ts '2018-12-11 14:31:51.157'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (140,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',{ts '2018-12-11 14:31:52.500'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (141,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',{ts '2018-12-11 14:31:52.533'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (142,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',{ts '2018-12-11 14:31:53.690'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (143,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',{ts '2018-12-11 14:31:53.713'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (144,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',{ts '2018-12-11 14:31:55.087'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (145,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',{ts '2018-12-11 14:31:55.107'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (146,1183,'7ed56826-0fc2-4854-b4a0-b6a8a774e8a4',{ts '2018-12-11 14:32:12.333'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (147,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',{ts '2018-12-11 14:33:51.333'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (79,1183,'39472b80-b7a5-4cc2-b3fe-c9ae02f15ad0',{ts '2018-12-10 15:22:32.817'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (148,1183,'e7ba6190-aa8c-4846-a30c-f2243f70590f',{ts '2018-12-11 14:34:32.717'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (81,1183,'53406609-6ef0-44b2-b183-b557923aa25a',{ts '2018-12-10 15:27:35.613'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (149,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',{ts '2018-12-11 14:37:37.837'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (83,1183,'cdda4e99-0bf2-4749-b3a2-1efc31965708',{ts '2018-12-10 15:29:50.090'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (150,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',{ts '2018-12-11 14:42:43.170'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (151,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',{ts '2018-12-11 14:43:14.133'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (154,1183,'cc22de5c-7893-40e6-a45c-1ee5033872d1',{ts '2018-12-12 10:30:04.710'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (155,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',{ts '2018-12-17 10:45:20.143'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (156,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',{ts '2018-12-17 10:45:20.197'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (157,1183,'4a954c1f-66e5-46ea-9158-21260f63a931',{ts '2018-12-17 10:45:24.697'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (158,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',{ts '2018-12-17 10:47:06.130'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (159,1183,'234f0a84-acd3-4c1c-9fea-91229d9d9d82',{ts '2018-12-17 10:48:17.177'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (163,1269,'dfd8942c-cc07-4de1-a640-141c6afb1c79',{ts '2018-12-28 13:30:51.897'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (164,1268,'e92221b6-42b9-4a16-ac5a-2f5b8fd6f729',{ts '2018-12-28 13:31:15.043'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (165,1268,'4674b53b-8989-4182-8dc0-6f221f20dc02',{ts '2018-12-28 13:31:19.250'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (166,1278,'3d29e530-9595-450d-b971-3eff1ea92919',{ts '2018-12-28 14:17:04.137'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (167,1269,'556c42e4-8972-4a18-9b10-826338855917',{ts '2018-12-28 14:17:19.177'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (168,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',{ts '2018-12-28 14:17:19.200'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (169,1268,'35b3d003-c6c9-4b12-b90e-21e6882c2740',{ts '2018-12-28 14:18:38.103'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (170,1062,'75421f6a-a5b2-4d33-af82-74dfca1b882f',{ts '2019-01-03 14:18:32.410'});
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1062,N'<home id="1062" key="8a593e06-83f0-477c-81b7-dc2af19a375e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-23T14:26:50" updateDate="2019-01-03T14:18:32" nodeName="Map" urlName="map" path="-1,1062" isDoc="" nodeType="1061" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1060" nodeTypeAlias="home" isPublished="true"><map><![CDATA[[{"key":"29c55997-cd96-451f-8e5c-1bcf51f485f9","name":"Item 1","ncContentTypeAlias":"maps","map":"{\r\n  \"position\": {\r\n    \"id\": \"WGS84\",\r\n    \"datum\": \"55.808262,9.350541\"\r\n  }\r\n}","animal":"umb://document/2bdc597da73c4b6f805a02cc5663e5ab"}]]]></map></home>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1268,N'<calendar id="1268" key="c6a64856-1361-48ed-ae5e-89bdbaec04b7" parentID="1062" level="2" creatorID="0" sortOrder="4" createDate="2018-12-28T13:28:17" updateDate="2018-12-28T14:18:38" nodeName="Calendar" urlName="calendar" path="-1,1062,1268" isDoc="" nodeType="1263" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1077" nodeTypeAlias="calendar" isPublished="true"><featureCalendar><![CDATA[umb://document/338d00d939f548f7af7d3f319c219c5d]]></featureCalendar></calendar>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1183,N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-17T10:48:17" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/2bdc597da73c4b6f805a02cc5663e5ab]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1161,N'<Image id="1161" key="7308629d-1a48-4327-9e9e-49d947682d06" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-12-10T10:29:06" updateDate="2018-12-10T10:29:06" nodeName="alpaka6.jpg" urlName="alpaka6jpg" path="-1,1161" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1002/alpaka6.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[2000]]></umbracoWidth><umbracoHeight><![CDATA[1000]]></umbracoHeight><umbracoBytes><![CDATA[260255]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1093,N'<Image id="1093" key="abc48596-ab70-4865-8083-2a9fbf01a223" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-05T23:38:23" updateDate="2018-12-05T23:38:23" nodeName="givskudzoo_alpaka.jpg" urlName="givskudzoo_alpakajpg" path="-1,1093" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="11dde1c8-de94-45b3-9298-a4f5d07fb548" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1001/givskudzoo_alpaka.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[700]]></umbracoWidth><umbracoHeight><![CDATA[741]]></umbracoHeight><umbracoBytes><![CDATA[124411]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1259,N'<animal id="1259" key="2bdc597d-a73c-4b6f-805a-02cc5663e5ab" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-17T10:47:06" updateDate="2018-12-17T10:47:06" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1259" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><bannerImage><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></bannerImage><imageAnimal><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></imageAnimal><animalWeight><![CDATA[50-100]]></animalWeight><animalDescription><![CDATA[<p><strong>An alpaca</strong></p>
<p> </p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p> </p>
<p><strong>An alpaca</strong></p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>]]></animalDescription><animalHeight><![CDATA[100-200]]></animalHeight><animalName><![CDATA[Alpacha]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></galleryImage1><galleryImage3><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage3><galleryImage2><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage2></animal>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1278,N'<calendarItem id="1278" key="338d00d9-39f5-48f7-af7d-3f319c219c5d" parentID="1268" level="3" creatorID="0" sortOrder="1" createDate="2018-12-28T14:17:04" updateDate="2018-12-28T14:17:04" nodeName="Secoud try" urlName="secoud-try" path="-1,1062,1268,1278" isDoc="" nodeType="1264" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1079" nodeTypeAlias="calendarItem" isPublished="true"><descriptionContent><![CDATA[asdasdasdasd]]></descriptionContent><imageEvent><![CDATA[umb://media/7266ed16a35d4afe9c52f53518c41902]]></imageEvent><eventTitle><![CDATA[asdasdasd]]></eventTitle><event>2018-12-31T14:16:28</event><altDescription><![CDATA[asdasdasd]]></altDescription></calendarItem>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1196,N'<Image id="1196" key="7266ed16-a35d-4afe-9c52-f53518c41902" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-12-11T12:56:29" updateDate="2018-12-11T12:56:29" nodeName="blpandet-dvrgara.jpg" urlName="blpandet-dvrgarajpg" path="-1,1196" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="f0f60bed-a36e-4ffa-b912-b2484ebf5f03" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1003/blpandet-dvrgara.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[700]]></umbracoWidth><umbracoHeight><![CDATA[741]]></umbracoHeight><umbracoBytes><![CDATA[65280]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1197,N'<Image id="1197" key="8b93931a-369f-41f2-953b-ad86df5c2653" parentID="-1" level="1" creatorID="0" sortOrder="3" createDate="2018-12-11T12:56:39" updateDate="2018-12-11T12:56:39" nodeName="alpaka4.jpg" urlName="alpaka4jpg" path="-1,1197" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="0516a2cf-2c8a-449c-83a1-9f0a0cb44557" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1004/alpaka4.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[425]]></umbracoWidth><umbracoHeight><![CDATA[392]]></umbracoHeight><umbracoBytes><![CDATA[39922]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1198,N'<Image id="1198" key="61af577e-573a-4824-be7f-36938628b75c" parentID="-1" level="1" creatorID="0" sortOrder="4" createDate="2018-12-11T12:56:40" updateDate="2018-12-11T12:56:40" nodeName="givskudzoo_flamingo.jpg" urlName="givskudzoo_flamingojpg" path="-1,1198" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="9d09b507-48c6-4a91-93ed-7e9426cdaeba" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1005/givskudzoo_flamingo.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[1170]]></umbracoWidth><umbracoHeight><![CDATA[480]]></umbracoHeight><umbracoBytes><![CDATA[174073]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1199,N'<Image id="1199" key="613f6245-7e1a-4a62-a909-75d68d62aff0" parentID="-1" level="1" creatorID="0" sortOrder="5" createDate="2018-12-11T12:56:41" updateDate="2018-12-11T12:56:41" nodeName="givskudzoo_kamelflok_liggende_anlaeg_0769.jpg" urlName="givskudzoo_kamelflok_liggende_anlaeg_0769jpg" path="-1,1199" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1006/givskudzoo_kamelflok_liggende_anlaeg_0769.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[1170]]></umbracoWidth><umbracoHeight><![CDATA[480]]></umbracoHeight><umbracoBytes><![CDATA[238303]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1200,N'<Image id="1200" key="dca25b70-10ab-4ca9-93ba-c2ee48f55c87" parentID="-1" level="1" creatorID="0" sortOrder="6" createDate="2018-12-11T12:56:41" updateDate="2018-12-11T12:56:41" nodeName="lion.jpg" urlName="lionjpg" path="-1,1200" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="3dd71910-2072-426d-aab4-1bb78df78c42" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1007/lion.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[1196]]></umbracoWidth><umbracoHeight><![CDATA[793]]></umbracoHeight><umbracoBytes><![CDATA[123449]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1201,N'<Image id="1201" key="45fe8798-300d-4ff0-b7a8-4e2b813afbf2" parentID="-1" level="1" creatorID="0" sortOrder="7" createDate="2018-12-11T12:56:42" updateDate="2018-12-11T12:56:42" nodeName="park-opening.jpg" urlName="park-openingjpg" path="-1,1201" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="dc249e48-9c5b-451c-b326-1cd2be48ac3d" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1008/park-opening.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[256]]></umbracoWidth><umbracoHeight><![CDATA[256]]></umbracoHeight><umbracoBytes><![CDATA[33774]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1202,N'<Image id="1202" key="53850509-a4d0-4bcb-9793-017702c222a8" parentID="-1" level="1" creatorID="0" sortOrder="8" createDate="2018-12-11T12:56:43" updateDate="2018-12-11T12:56:43" nodeName="soldaterara.jpg" urlName="soldaterarajpg" path="-1,1202" isDoc="" nodeType="1032" writerName="Jonathan Pabst Klemensen" writerID="0" version="0a28d41a-2a5e-4c33-938b-11274bc32aaf" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1009/soldaterara.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[700]]></umbracoWidth><umbracoHeight><![CDATA[741]]></umbracoHeight><umbracoBytes><![CDATA[92877]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>');
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (1,-49,N'Umbraco.TrueFalse',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (2,-51,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (3,-87,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (4,-88,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (5,-89,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (6,-90,N'Umbraco.UploadField',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (7,-92,N'Umbraco.NoEdit',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (8,-36,N'Umbraco.DateTime',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (9,-37,N'Umbraco.ColorPickerAlias',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (11,-39,N'Umbraco.DropDownMultiple',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (12,-40,N'Umbraco.RadioButtonList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (13,-41,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (14,-42,N'Umbraco.DropDown',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (15,-43,N'Umbraco.CheckBoxList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (22,1041,N'Umbraco.Tags',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (24,1043,N'Umbraco.ImageCropper',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-26,-95,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-27,-96,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-28,-97,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (26,1046,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (27,1047,N'Umbraco.MemberPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (28,1048,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (29,1049,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (30,1050,N'Umbraco.RelatedLinks2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (40,1067,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (41,1069,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (42,1070,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (43,1072,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (44,1073,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (45,1083,N'Umbraco.MultipleTextstring',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (46,1084,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (47,1089,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (48,1090,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (49,1091,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (50,1092,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (51,1099,N'Umbraco.NestedContent',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (52,1100,N'Umbraco.NestedContent',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (53,1101,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (54,1102,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (55,1103,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (56,1104,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (57,1105,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (58,1106,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (59,1107,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (60,1108,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (61,1109,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (62,1110,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (63,1111,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (64,1113,N'Umbraco.NestedContent',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (65,1114,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (66,1115,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (67,1116,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (68,1117,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (69,1118,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (70,1119,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (71,1120,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (72,1122,N'Umbraco.NestedContent',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (73,1124,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (74,1125,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (75,1126,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (76,1127,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (77,1130,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (78,1131,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (79,1132,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (80,1133,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (81,1134,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (82,1135,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (83,1136,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (84,1137,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (85,1138,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (86,1139,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (87,1140,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (88,1141,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (89,1142,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (90,1144,N'Umbraco.MultipleTextstring',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (91,1145,N'Umbraco.MultipleTextstring',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (92,1146,N'Umbraco.MultipleTextstring',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (93,1147,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (94,1148,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (95,1149,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (96,1150,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (97,1151,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (98,1152,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (99,1153,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (100,1154,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (101,1155,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (102,1159,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (103,1156,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (104,1157,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (105,1158,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (106,1160,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (107,1164,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (108,1165,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (109,1166,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (110,1167,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (111,1168,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (112,1169,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (113,1170,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (114,1175,N'Umbraco.Decimal',N'Decimal');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (115,1176,N'Umbraco.Decimal',N'Decimal');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (116,1177,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (117,1178,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (118,1190,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (119,1191,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (120,1193,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (121,1192,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (122,1203,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (123,1204,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (124,1205,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (125,1206,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (126,1207,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (127,1208,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (128,1209,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (129,1210,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (130,1212,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (131,1211,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (132,1219,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (133,1220,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (134,1221,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (135,1222,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (136,1225,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (137,1226,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (138,1227,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (139,1228,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (140,1229,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (141,1231,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (142,1232,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (143,1233,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (144,1235,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (145,1236,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (146,1240,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (147,1241,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (148,1242,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (149,1243,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (150,1245,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (151,1246,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (152,1247,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (153,1248,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (154,1249,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (155,1250,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (156,1251,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (157,1252,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (158,1255,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (159,1256,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (160,1257,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (161,1260,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (162,1265,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (163,1266,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (164,1267,N'Umbraco.MultiNodeTreePicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (165,1270,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (166,1271,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (167,1272,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (168,1273,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (169,1274,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (170,1275,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (171,1276,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (172,1277,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (173,1279,N'Terratype',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (174,1280,N'Umbraco.NestedContent',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (175,1283,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (176,1284,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (5,1041,N'Json',0,N'storageType');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-1,-97,N'10',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-2,-97,N'username',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-3,-97,N'asc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-4,-97,N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]',4,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-5,-96,N'100',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-6,-96,N'updateDate',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-7,-96,N'desc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-8,-96,N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]',4,N'layouts');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-9,-96,N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]',5,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (6,1049,N'1',0,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (10,1067,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (11,1067,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (12,1067,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (13,1067,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (14,1069,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (15,1070,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (16,1070,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (17,1072,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (18,1073,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (19,1083,N'{"Minimum":5,"Maximum":10}',1,N'0');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (20,1084,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (21,1084,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (22,1084,N'0',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (23,1084,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (24,1089,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (25,1090,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (26,1090,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (27,1090,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (28,1090,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (29,1091,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (30,1092,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (31,1099,N'[
  {
    "ncAlias": "animal",
    "ncTabAlias": "Animal",
    "nameTemplate": "{{Animal}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (32,1099,N'2',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (33,1099,N'50',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (34,1099,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (35,1099,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (36,1099,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (37,1100,N'[
  {
    "ncAlias": "animal",
    "ncTabAlias": "Animal",
    "nameTemplate": "{{Animal}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (38,1100,N'5',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (39,1100,N'50',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (40,1100,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (41,1100,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (42,1100,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (43,1101,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (44,1101,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (45,1101,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (46,1101,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (47,1102,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (48,1103,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (49,1104,N'{
  "type": "content",
  "id": "umb://document/ff34f4a1b7e24106a2877c4d44697f34"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (50,1104,N'Animals',2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (51,1104,N'2',3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (52,1104,N'10',4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (53,1104,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (54,1105,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (55,1106,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (56,1107,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (57,1108,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (58,1109,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (59,1109,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (60,1109,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (61,1109,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (172,1138,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (173,1138,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (174,1138,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (175,1138,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (176,1139,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (177,1139,N'24',2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (178,1139,NULL,3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (179,1140,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (180,1140,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (181,1140,N'24',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (182,1141,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (183,1142,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (184,1144,N'{"Minimum":1,"Maximum":10}',1,N'0');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (185,1145,N'{"Minimum":1,"Maximum":10}',1,N'0');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (186,1146,N'{"Minimum":1,"Maximum":10}',1,N'0');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (187,1147,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (188,1148,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (189,1149,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (190,1150,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (191,1151,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (192,1151,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (193,1151,N'1000',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (194,1152,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (195,1152,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (196,1152,N'1000',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (197,1153,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (198,1153,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (199,1153,N'1000',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (200,1154,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (201,1155,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (202,1159,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (203,1156,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (204,1157,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (205,1158,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (206,1160,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (207,1122,N'[
  {
    "ncAlias": "animals",
    "ncTabAlias": "Animal list",
    "nameTemplate": "{{animalName}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (208,1122,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (209,1122,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (210,1122,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (211,1122,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (212,1122,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (213,1122,N'[
  {
    "ncAlias": "animals",
    "ncTabAlias": "Animal list",
    "nameTemplate": "{{animalName}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (214,1122,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (215,1122,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (216,1122,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (217,1122,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (218,1122,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (219,1122,N'[
  {
    "ncAlias": "animals",
    "ncTabAlias": "Animal list",
    "nameTemplate": "{{animalName}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (220,1122,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (221,1122,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (222,1122,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (223,1122,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (224,1122,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (225,1122,N'[
  {
    "ncAlias": "animals",
    "ncTabAlias": "Animal list",
    "nameTemplate": "{{animalName}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (226,1122,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (227,1122,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (228,1122,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (229,1122,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (230,1122,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (260,1127,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (261,1127,N'Animal',2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (262,1127,N'0',3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (263,1127,N'100',4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (264,1127,N'1',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (236,1164,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (237,1165,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (258,1177,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (259,1178,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (265,1190,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (266,1191,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (267,1193,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (268,1192,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (462,1167,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (463,1167,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (464,1167,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (465,1167,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (277,1203,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (278,1203,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (279,1203,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (280,1203,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (281,1204,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (282,1204,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (283,1204,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (284,1204,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (285,1205,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (286,1205,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (287,1205,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (288,1205,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (329,1206,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (330,1206,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (331,1206,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (332,1206,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (293,1207,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (294,1207,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (295,1207,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (296,1207,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (333,1208,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (334,1208,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (335,1208,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (336,1208,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (301,1209,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (302,1209,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (303,1209,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (304,1209,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (305,1210,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (306,1210,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (307,1210,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (308,1210,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (349,1212,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (350,1212,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (351,1212,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (352,1212,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (313,1211,N'1',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (314,1211,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (315,1211,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (316,1211,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (337,1208,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (338,1208,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (339,1208,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (340,1208,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (353,1219,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (354,1219,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (355,1219,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (356,1219,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (357,1220,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (358,1220,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (359,1220,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (360,1220,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (361,1221,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (362,1221,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (363,1221,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (364,1221,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (365,1222,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (366,1222,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (367,1222,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (368,1222,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (369,1225,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (370,1225,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (371,1225,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (372,1225,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (373,1226,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (374,1226,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (375,1226,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (376,1226,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (377,1227,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (378,1227,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (471,1265,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (472,1266,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (473,1266,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (474,1266,N'1',3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (475,1266,N'100',4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (476,1266,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (477,1267,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (478,1267,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (479,1267,N'1',3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (480,1267,N'100',4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (481,1267,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (482,1270,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (483,1271,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (484,1272,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (485,1273,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (486,1274,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (487,1274,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (488,1274,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (489,1274,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (490,1275,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (491,1275,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (492,1275,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (493,1275,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (494,1276,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (495,1277,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (529,1279,N'{
  "config": {
    "height": 400,
    "gridHeight": 400,
    "debug": 0,
    "icon": {
      "id": "redcircle",
      "url": "https://mt.google.com/vt/icon/name=icons/spotlight/generic_search_L_8x.png&scale=2",
      "size": {
        "width": 48,
        "height": 48
      },
      "anchor": {
        "horizontal": "center",
        "vertical": "center"
      }
    },
    "label": {
      "enable": false,
      "editPosition": "0",
      "id": "standard"
    },
    "provider": {
      "id": "Terratype.LeafletV1",
      "grid": {
        "enable": false
      },
      "zoomControl": {
        "enable": true,
        "position": "12"
      },
      "mapSources": [
        {
          "minZoom": 12,
          "maxZoom": 18,
          "mapSource": {
            "id": "OpenStreetMap"
          },
          "tileServer": {
            "id": "OpenStreetMap.de"
          }
        }
      ]
    }
  },
  "position": {
    "id": "WGS84",
    "precision": 6,
    "datum": "55.808262,9.350541"
  }
}',1,N'definition');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (522,1280,N'[
  {
    "ncAlias": "maps",
    "ncTabAlias": "Map",
    "nameTemplate": ""
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (523,1280,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (524,1280,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (525,1280,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (526,1280,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (527,1280,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (504,1283,N'0',1,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (505,1283,N'umb://document/abbcadf0466d48fc86ba27ff8c56b44e',2,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (508,1284,N'0',1,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (509,1284,N'umb://document/abbcadf0466d48fc86ba27ff8c56b44e',2,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (62,1110,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (63,1111,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (82,1113,N'[
  {
    "ncAlias": "animal",
    "ncTabAlias": "animal details",
    "nameTemplate": "{{Animal}}"
  }
]',1,N'contentTypes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (83,1113,N'0',2,N'minItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (84,1113,N'0',3,N'maxItems');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (85,1113,N'1',4,N'confirmDeletes');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (86,1113,N'1',5,N'showIcons');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (87,1113,N'0',6,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (88,1114,N'New Animal',1,N'tabName');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (89,1114,N'1',2,N'displayAtTabNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (90,1114,N'10',3,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (91,1114,N'[
  {
    "name": "Grid",
    "path": "views/propertyeditors/listview/layouts/grid/grid.html",
    "icon": "icon-thumbnails-small",
    "isSystem": 1,
    "selected": true
  },
  {
    "name": "List",
    "path": "views/propertyeditors/listview/layouts/list/list.html",
    "icon": "icon-list",
    "isSystem": 1,
    "selected": true
  }
]',4,N'layouts');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (92,1114,N'[
  {
    "alias": "sortOrder",
    "header": "Sort order",
    "isSystem": 1
  },
  {
    "alias": "updateDate",
    "header": "Last edited",
    "isSystem": 1
  },
  {
    "alias": "owner",
    "header": "Created by",
    "isSystem": 1
  }
]',5,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (93,1114,N'name',6,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (94,1114,N'asc',7,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (95,1114,N'{
  "allowBulkPublish": true,
  "allowBulkUnpublish": true,
  "allowBulkCopy": true,
  "allowBulkMove": false,
  "allowBulkDelete": true
}',8,N'bulkActionPermissions');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (96,1115,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (97,1116,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (98,1117,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (99,1118,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (100,1119,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (101,1119,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (102,1120,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (103,1120,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (104,1120,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (105,1120,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (238,1166,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (239,1166,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (240,1166,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (241,1166,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (379,1227,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (380,1227,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (112,1124,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (113,1125,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (114,1126,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (381,1228,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (382,1228,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (246,1168,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (247,1168,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (248,1169,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (135,1130,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (136,1130,N'0',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (137,1130,N'0',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (138,1130,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (139,1131,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (140,1131,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (141,1131,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (142,1131,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (143,1132,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (144,1132,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (145,1132,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (146,1132,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (147,1133,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (148,1133,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (149,1133,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (150,1133,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (159,1134,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (160,1134,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (161,1134,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (162,1134,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (163,1135,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (164,1136,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (165,1136,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (166,1136,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (167,1136,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (168,1137,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (169,1137,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (170,1137,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (171,1137,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (249,1169,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (250,1170,N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (251,1170,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (252,1175,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (253,1175,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (254,1175,N'10000',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (255,1176,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (256,1176,NULL,2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (257,1176,N'10000',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (383,1228,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (384,1228,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (385,1229,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (386,1229,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (387,1229,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (388,1229,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (389,1231,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (390,1231,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (391,1231,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (392,1231,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (393,1232,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (394,1232,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (395,1232,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (396,1232,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (397,1233,N'0',1,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (398,1233,N'1',2,N'onlyImages');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (399,1233,N'1',3,N'disableFolderSelect');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (400,1233,N'',4,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (401,1235,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (402,1236,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (403,1236,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (404,1236,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (405,1236,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (406,1236,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (407,1240,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (408,1241,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (409,1242,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (410,1242,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (411,1242,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (412,1242,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (413,1242,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (414,1243,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (415,1243,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (416,1243,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (417,1243,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (418,1243,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (419,1245,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (420,1246,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (421,1247,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (422,1247,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (423,1247,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (424,1247,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (425,1247,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (426,1248,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (427,1248,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (428,1248,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (429,1248,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (430,1248,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (431,1249,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (432,1249,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (433,1249,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (434,1249,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (435,1249,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (436,1250,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (437,1250,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (438,1250,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (439,1250,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (440,1250,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (441,1251,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (442,1251,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (443,1251,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (444,1251,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (445,1251,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (446,1252,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (447,1252,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (448,1252,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (449,1252,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (450,1252,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (451,1255,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (452,1256,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (453,1257,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (454,1257,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (455,1257,NULL,3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (456,1257,NULL,4,N'maxNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (457,1257,N'0',5,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (466,1260,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (467,1265,N'{
  "type": "content"
}',1,N'startNode');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (468,1265,NULL,2,N'filter');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (469,1265,N'1',3,N'minNumber');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (470,1265,N'100',4,N'maxNumber');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1062,0,0,'b8c19884-7ecd-4c1e-a776-5b9ccd80387d',N'Frontpage',NULL,NULL,{ts '2018-11-23 14:26:50.670'},1060,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1187,0,0,'b55db367-0d55-4af9-8229-c5552a7a582e',N'Alpaca',NULL,NULL,{ts '2018-12-10 15:33:34.040'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1188,0,0,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',N'Alpaca (1)',NULL,NULL,{ts '2018-12-10 15:35:40.393'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1188,0,0,'5985949e-1221-4a0c-bc29-ca9c64f57362',N'Alpaca (1)',NULL,NULL,{ts '2018-12-10 15:36:07.447'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1188,0,0,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',N'Alpaca (1)',NULL,NULL,{ts '2018-12-10 15:36:07.483'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'d6edbe5c-9a2b-4aaa-b487-8e50f933e3d2',N'Animals',NULL,NULL,{ts '2018-12-10 15:36:35.520'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1189,0,0,'57325650-ba53-4ebc-9c1a-ada13d775554',N'Jesper',NULL,NULL,{ts '2018-12-11 09:46:08.520'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'9343da05-0e14-471e-b7db-a938488e3f45',N'Animals',NULL,NULL,{ts '2018-12-11 09:46:22.027'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1189,0,0,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',N'Jesper',NULL,NULL,{ts '2018-12-11 09:58:23.767'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1187,0,0,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',N'Alpaca',NULL,NULL,{ts '2018-12-11 10:04:53.663'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1194,0,0,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',N'Uffe',NULL,NULL,{ts '2018-12-11 10:32:16.067'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'bdd00222-58c7-4931-8851-a318145fbaf9',N'Animals',NULL,NULL,{ts '2018-12-11 10:32:59.153'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1195,0,0,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',N'jonathan',NULL,NULL,{ts '2018-12-11 10:33:52.793'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'766f2fe8-91bf-4526-bc0c-b03b10fc108c',N'Animals',NULL,NULL,{ts '2018-12-11 13:57:28.307'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1187,0,0,'8ed51033-a89a-497e-b01c-c29cf34218e8',N'Alpaca',NULL,NULL,{ts '2018-12-11 12:03:19.480'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1195,0,0,'b1968057-0ea4-4806-920f-8b1f4d776910',N'jonathan',NULL,NULL,{ts '2018-12-11 12:56:55.693'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1214,0,0,'821c9c9b-e5f4-4829-9b54-b94a75920173',N'Mogens',NULL,NULL,{ts '2018-12-11 13:52:49.553'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1215,0,0,'ac51af52-6a43-4190-82ae-70336e2bd96a',N'Mogens (1)',NULL,NULL,{ts '2018-12-11 13:53:10.853'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1062,0,0,'f7b14908-e95e-4c68-9ce9-982e2bbf1eb6',N'Map',NULL,NULL,{ts '2018-12-28 13:03:43.247'},1060,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1216,0,0,'55208417-3bd1-42c0-976a-5796b16cbcac',N'Mogens (2)',NULL,NULL,{ts '2018-12-11 13:53:58.487'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1217,0,0,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',N'Mogens (3)',NULL,NULL,{ts '2018-12-11 13:54:31.773'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1214,0,0,'6add2f9a-1b51-40e2-9766-a2e49da309cd',N'Mogens',NULL,NULL,{ts '2018-12-11 13:57:01.587'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1214,0,0,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',N'Mogens',NULL,NULL,{ts '2018-12-11 13:57:01.630'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1268,0,0,'ce82372e-c9e2-400e-8d78-1d8c694c681b',N'Calendar',NULL,NULL,{ts '2018-12-28 13:28:17.183'},1077,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1215,0,0,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',N'Mogens (1)',NULL,NULL,{ts '2018-12-11 13:57:09.637'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1215,0,0,'ab0efb5f-0a43-40bf-b348-e8873c743a86',N'Mogens (1)',NULL,NULL,{ts '2018-12-11 13:57:09.673'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1216,0,0,'cbac87c4-8b53-4946-8e58-38e552fff726',N'Mogens (2)',NULL,NULL,{ts '2018-12-11 13:57:16.220'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1216,0,0,'11c032a1-692a-46a2-89ed-0c2e5656a49e',N'Mogens (2)',NULL,NULL,{ts '2018-12-11 13:57:16.247'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1217,0,0,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',N'Mogens (3)',NULL,NULL,{ts '2018-12-11 13:57:21.943'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1217,0,0,'0db20dfb-253d-4631-a3a6-87f2df9e0024',N'Mogens (3)',NULL,NULL,{ts '2018-12-11 13:57:21.967'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1218,0,0,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',N'adew',NULL,NULL,{ts '2018-12-11 13:58:16.260'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'3e60ff2b-3499-4adf-89ec-1479cbca25aa',N'Animals',NULL,NULL,{ts '2018-12-11 14:07:21.537'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1224,0,0,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',N'lort',NULL,NULL,{ts '2018-12-11 14:06:33.540'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'e0aa7661-4c7b-4ce8-bbbc-29f4be1bd3f6',N'Animals',NULL,NULL,{ts '2018-12-11 14:16:30.753'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1224,0,0,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',N'lort',NULL,NULL,{ts '2018-12-11 14:15:54.163'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1224,0,0,'60792152-26de-463f-80b3-fdb3fa5e468b',N'lort',NULL,NULL,{ts '2018-12-11 14:15:54.237'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1230,0,0,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',N'jens',NULL,NULL,{ts '2018-12-11 14:17:49.703'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'e93a8bcb-2137-4d13-8195-6d8a08a666e7',N'Animals',NULL,NULL,{ts '2018-12-11 14:18:10.147'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1230,0,0,'60012621-b729-477b-b3e0-dfafd3679ab0',N'jens',NULL,NULL,{ts '2018-12-11 14:18:36.440'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1187,0,0,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:31:48.317'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1187,0,0,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:31:48.387'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1189,0,0,'5879eef9-5b97-4859-b810-44a068d140dc',N'Jesper',NULL,NULL,{ts '2018-12-11 14:31:49.927'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1189,0,0,'2c06e987-ee30-4a09-af16-de58ace2f0e4',N'Jesper',NULL,NULL,{ts '2018-12-11 14:31:49.947'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1194,0,0,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',N'Uffe',NULL,NULL,{ts '2018-12-11 14:31:51.140'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1194,0,0,'fdd6f837-44ca-4414-8ebf-65a532107e88',N'Uffe',NULL,NULL,{ts '2018-12-11 14:31:51.157'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1195,0,0,'540d35c5-a80c-4a39-90eb-7f147bd68a82',N'jonathan',NULL,NULL,{ts '2018-12-11 14:31:52.500'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1195,0,0,'19ea3a36-e7b0-4ead-8361-87147e75174d',N'jonathan',NULL,NULL,{ts '2018-12-11 14:31:52.533'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1218,0,0,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',N'adew',NULL,NULL,{ts '2018-12-11 14:31:53.690'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1218,0,0,'d81c316b-7722-4ff4-b241-33570e427bd6',N'adew',NULL,NULL,{ts '2018-12-11 14:31:53.713'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1230,0,0,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',N'jens',NULL,NULL,{ts '2018-12-11 14:31:55.087'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1230,0,0,'a79a7263-3687-4d10-b8bb-945561ec2a56',N'jens',NULL,NULL,{ts '2018-12-11 14:31:55.107'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'7ed56826-0fc2-4854-b4a0-b6a8a774e8a4',N'Animals',NULL,NULL,{ts '2018-12-11 14:32:12.333'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'22b80537-77c1-4acf-8b8c-279a980898ac',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:33:51.333'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'e7ba6190-aa8c-4846-a30c-f2243f70590f',N'Animals',NULL,NULL,{ts '2018-12-11 14:34:32.717'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'0726c572-a87e-4d30-8cde-ee150b5d20fd',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:37:37.837'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'4481b806-b0e2-47b6-8ee5-87288eb584f3',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:42:43.170'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',N'Alpaca',NULL,NULL,{ts '2018-12-11 14:43:14.133'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'cc22de5c-7893-40e6-a45c-1ee5033872d1',N'Animals',NULL,NULL,{ts '2018-12-12 10:30:04.710'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'44b78f98-f6b6-461f-99fa-6582d4fcad28',N'Alpaca',NULL,NULL,{ts '2018-12-17 10:45:20.143'},1075,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1234,0,0,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',N'Alpaca (2)',NULL,NULL,{ts '2018-12-17 10:45:20.197'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'39472b80-b7a5-4cc2-b3fe-c9ae02f15ad0',N'Animals',NULL,NULL,{ts '2018-12-10 15:22:32.817'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'4a954c1f-66e5-46ea-9158-21260f63a931',N'Animals',NULL,NULL,{ts '2018-12-17 10:45:24.697'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'53406609-6ef0-44b2-b183-b557923aa25a',N'Animals',NULL,NULL,{ts '2018-12-10 15:27:35.613'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1259,1,0,'ac85fafe-294b-4dce-985b-f349fefccfbd',N'Alpaca',NULL,NULL,{ts '2018-12-17 10:47:06.130'},1075,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,0,0,'cdda4e99-0bf2-4749-b3a2-1efc31965708',N'Animals',NULL,NULL,{ts '2018-12-10 15:29:50.090'},1128,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1183,1,0,'234f0a84-acd3-4c1c-9fea-91229d9d9d82',N'Animals',NULL,NULL,{ts '2018-12-17 10:48:17.177'},1128,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1269,0,0,'dfd8942c-cc07-4de1-a640-141c6afb1c79',N'First event',NULL,NULL,{ts '2018-12-28 13:30:51.897'},1079,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1268,0,0,'e92221b6-42b9-4a16-ac5a-2f5b8fd6f729',N'Calendar',NULL,NULL,{ts '2018-12-28 13:31:15.043'},1077,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1268,0,0,'4674b53b-8989-4182-8dc0-6f221f20dc02',N'Calendar',NULL,NULL,{ts '2018-12-28 13:31:19.250'},1077,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1278,1,0,'3d29e530-9595-450d-b971-3eff1ea92919',N'Secoud try',NULL,NULL,{ts '2018-12-28 14:17:04.137'},1079,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1269,0,0,'556c42e4-8972-4a18-9b10-826338855917',N'First event',NULL,NULL,{ts '2018-12-28 14:17:19.177'},1079,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1269,0,0,'f53650eb-eeef-4512-a9ba-1a8482462082',N'First event',NULL,NULL,{ts '2018-12-28 14:17:19.200'},1079,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1268,1,0,'35b3d003-c6c9-4b12-b90e-21e6882c2740',N'Calendar',NULL,NULL,{ts '2018-12-28 14:18:38.103'},1077,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1062,1,0,'75421f6a-a5b2-4d33-af82-74dfca1b882f',N'Map',NULL,NULL,{ts '2019-01-03 14:18:32.410'},1060,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1061,1060,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1076,1128,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1263,1077,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1264,1079,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1163,1075,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1254,1253,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1258,1237,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1282,1281,1);
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] ON;
GO
INSERT INTO [cmsMacro] ([id],[uniqueId],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (1,'034e9afe-3ac9-4f9c-bf10-c86efc0e1cce',0,0,N'Gallery',N'Gallery',NULL,NULL,NULL,0,0,0,NULL);
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] ON;
GO
INSERT INTO [cmsMacroProperty] ([id],[uniquePropertyId],[editorAlias],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (1,'51f43565-b8d2-4be5-ac63-6d1b28e51748',N'Umbraco.MultipleMediaPicker',1,0,N'Gallery',N'Gallery');
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',N'/media/1001/givskudzoo_alpaka.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',N'/media/1002/alpaka6.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',N'/media/1003/blpandet-dvrgara.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',N'/media/1004/alpaka4.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',N'/media/1005/givskudzoo_flamingo.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',N'/media/1006/givskudzoo_kamelflok_liggende_anlaeg_0769.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1200,'3dd71910-2072-426d-aab4-1bb78df78c42',N'/media/1007/lion.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',N'/media/1008/park-opening.jpg');
GO
INSERT INTO [cmsMedia] ([nodeId],[versionId],[mediaPath]) VALUES (1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',N'/media/1009/soldaterara.jpg');
GO
SET IDENTITY_INSERT [cmsMemberType] ON;
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (1,1044,50,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (2,1044,51,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (3,1044,28,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (4,1044,29,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (5,1044,30,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (6,1044,31,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (7,1044,32,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (8,1044,33,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (9,1044,34,0,0,0);
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1062,'b8c19884-7ecd-4c1e-a776-5b9ccd80387d',{ts '2018-12-06 02:26:08.313'},N'<home id="1062" key="8a593e06-83f0-477c-81b7-dc2af19a375e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-23T14:26:50" updateDate="2018-11-23T14:26:50" nodeName="Frontpage" urlName="frontpage" path="-1,1062" isDoc="" nodeType="1061" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1060" nodeTypeAlias="home" isPublished="false" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1187,'b55db367-0d55-4af9-8229-c5552a7a582e',{ts '2018-12-10 15:33:34.093'},N'<animal id="1187" key="b8058c7b-4ccb-4c42-a016-4474156a7908" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-10T15:33:34" updateDate="2018-12-10T15:33:34" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1187" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[200]]></animalWeight><animalDescription><![CDATA[<p>eadeafeadsd</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',{ts '2018-12-10 15:35:40.427'},N'<animal id="1188" key="d6190b59-cc93-4137-962a-a87cc8b68ffb" parentID="1183" level="3" creatorID="0" sortOrder="1" createDate="2018-12-10T15:35:40" updateDate="2018-12-10T15:35:40" nodeName="Alpaca (1)" urlName="alpaca-1" path="-1,1062,1183,1188" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[1000]]></animalWeight><animalDescription><![CDATA[<p>ersewsa</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[alpaca]]></animalName></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'d6edbe5c-9a2b-4aaa-b487-8e50f933e3d2',{ts '2018-12-10 15:36:35.543'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-10T15:36:35" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1189,'57325650-ba53-4ebc-9c1a-ada13d775554',{ts '2018-12-11 09:46:08.553'},N'<animal id="1189" key="3bcb94db-0cdb-4d88-b41b-b2fda9cc3ff4" parentID="1183" level="3" creatorID="0" sortOrder="1" createDate="2018-12-11T09:46:08" updateDate="2018-12-11T09:46:08" nodeName="Jesper" urlName="jesper" path="-1,1062,1183,1189" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[123123]]></animalWeight><animalDescription><![CDATA[<p>qr3eq3eq</p>]]></animalDescription><animalHeight><![CDATA[123123123]]></animalHeight><animalName><![CDATA[Jesper]]></animalName></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'9343da05-0e14-471e-b7db-a938488e3f45',{ts '2018-12-11 09:46:22.050'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T09:46:22" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',{ts '2018-12-11 09:58:23.837'},N'<animal id="1189" key="3bcb94db-0cdb-4d88-b41b-b2fda9cc3ff4" parentID="1183" level="3" creatorID="0" sortOrder="1" createDate="2018-12-11T09:46:08" updateDate="2018-12-11T09:58:23" nodeName="Jesper" urlName="jesper" path="-1,1062,1183,1189" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[123123]]></animalWeight><animalDescription><![CDATA[<p>SLIM SHADY</p>]]></animalDescription><animalHeight><![CDATA[123123123]]></animalHeight><animalName><![CDATA[Jesper]]></animalName><shortDescription><![CDATA[WHAT MY NAME IS]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',{ts '2018-12-11 10:04:53.707'},N'<animal id="1187" key="b8058c7b-4ccb-4c42-a016-4474156a7908" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-10T15:33:34" updateDate="2018-12-11T10:04:53" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1187" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[200]]></animalWeight><animalDescription><![CDATA[<p>Ham u'' fra landet</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[Jonathan]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',{ts '2018-12-11 10:32:16.107'},N'<animal id="1194" key="b91067f8-d189-4a38-930e-e98f8677b1db" parentID="1183" level="3" creatorID="0" sortOrder="2" createDate="2018-12-11T10:32:16" updateDate="2018-12-11T10:32:16" nodeName="Uffe" urlName="uffe" path="-1,1062,1183,1194" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></imageAnimal><animalWeight><![CDATA[2]]></animalWeight><animalDescription><![CDATA[<p>wadwqadwqdqwd</p>]]></animalDescription><animalHeight><![CDATA[1]]></animalHeight><animalName><![CDATA[Uffe]]></animalName><shortDescription><![CDATA[An species of uffe]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'bdd00222-58c7-4931-8851-a318145fbaf9',{ts '2018-12-11 10:32:59.183'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T10:32:59" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',{ts '2018-12-11 10:33:52.810'},N'<animal id="1195" key="c24db2f8-1644-47f4-9144-3f6bc2a52217" parentID="1183" level="3" creatorID="0" sortOrder="3" createDate="2018-12-11T10:33:52" updateDate="2018-12-11T10:33:52" nodeName="jonathan" urlName="jonathan" path="-1,1062,1183,1195" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[2]]></animalWeight><animalDescription><![CDATA[<p>ewfsdfdfs</p>]]></animalDescription><animalHeight><![CDATA[1]]></animalHeight><animalName><![CDATA[Jonathan]]></animalName><shortDescription><![CDATA[Fiskw]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'766f2fe8-91bf-4526-bc0c-b03b10fc108c',{ts '2018-12-11 13:57:28.313'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T13:57:28" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',{ts '2018-12-11 12:03:23.767'},N'<animal id="1187" key="b8058c7b-4ccb-4c42-a016-4474156a7908" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-10T15:33:34" updateDate="2018-12-11T12:03:19" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1187" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="false"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06]]></imageAnimal><animalWeight><![CDATA[200]]></animalWeight><animalDescription><![CDATA[<p>Ham u'' fra landet</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[Jonathan]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1195,'b1968057-0ea4-4806-920f-8b1f4d776910',{ts '2018-12-11 12:57:00.267'},N'<animal id="1195" key="c24db2f8-1644-47f4-9144-3f6bc2a52217" parentID="1183" level="3" creatorID="0" sortOrder="3" createDate="2018-12-11T10:33:52" updateDate="2018-12-11T12:56:55" nodeName="jonathan" urlName="jonathan" path="-1,1062,1183,1195" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="false"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06,umb://media/7266ed16a35d4afe9c52f53518c41902,umb://media/61af577e573a4824be7f36938628b75c,umb://media/45fe8798300d4ff0b7a84e2b813afbf2,umb://media/dca25b7010ab4ca993bac2ee48f55c87,umb://media/613f62457e1a4a62a90975d68d62aff0,umb://media/53850509a4d04bcb9793017702c222a8]]></imageAnimal><animalWeight><![CDATA[2]]></animalWeight><animalDescription><![CDATA[<p>ewfsdfdfs</p>]]></animalDescription><animalHeight><![CDATA[1]]></animalHeight><animalName><![CDATA[Jonathan]]></animalName><shortDescription><![CDATA[Fiskw]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',{ts '2018-12-11 13:52:49.620'},N'<animal id="1214" key="9e44e3c9-37fe-4a24-90e0-277d00e9bda4" parentID="1183" level="3" creatorID="0" sortOrder="4" createDate="2018-12-11T13:52:49" updateDate="2018-12-11T13:52:49" nodeName="Mogens" urlName="mogens" path="-1,1062,1183,1214" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImage3><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage3><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[1198]]></galleryImage2><imageAnimal><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></imageAnimal><animalWeight><![CDATA[200-300]]></animalWeight><animalDescription><![CDATA[<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>]]></animalDescription><animalHeight><![CDATA[100-200]]></animalHeight><animalName><![CDATA[Mogens]]></animalName><shortDescription><![CDATA[A rare species of Mogens]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',{ts '2018-12-11 13:53:10.870'},N'<animal id="1215" key="c2a3e449-c4f5-40c0-915e-e849ca033f76" parentID="1183" level="3" creatorID="0" sortOrder="5" createDate="2018-12-11T13:53:10" updateDate="2018-12-11T13:53:10" nodeName="Mogens (1)" urlName="mogens-1" path="-1,1062,1183,1215" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImage3><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage3><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[1198]]></galleryImage2><imageAnimal><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></imageAnimal><animalWeight><![CDATA[100]]></animalWeight><animalDescription><![CDATA[<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[Mogens]]></animalName><shortDescription><![CDATA[A rare species of Mogens]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1216,'55208417-3bd1-42c0-976a-5796b16cbcac',{ts '2018-12-11 13:53:58.507'},N'<animal id="1216" key="1d58f4ec-67f6-4c88-9ae2-7e9b8905f59c" parentID="1183" level="3" creatorID="0" sortOrder="6" createDate="2018-12-11T13:53:58" updateDate="2018-12-11T13:53:58" nodeName="Mogens (2)" urlName="mogens-2" path="-1,1062,1183,1216" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImage3><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage3><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[1198]]></galleryImage2><imageAnimal><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></imageAnimal><animalWeight><![CDATA[100]]></animalWeight><animalDescription><![CDATA[<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>]]></animalDescription><animalHeight><![CDATA[100]]></animalHeight><animalName><![CDATA[Mogens]]></animalName><shortDescription><![CDATA[A rare species of Mogens]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',{ts '2018-12-11 13:54:31.787'},N'<animal id="1217" key="082ff554-f5bb-4c99-8247-10e7dabd5a2c" parentID="1183" level="3" creatorID="0" sortOrder="7" createDate="2018-12-11T13:54:31" updateDate="2018-12-11T13:54:31" nodeName="Mogens (3)" urlName="mogens-3" path="-1,1062,1183,1217" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImage3><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage3><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[1198]]></galleryImage2><imageAnimal><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></imageAnimal><animalDescription><![CDATA[<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>]]></animalDescription><animalName><![CDATA[Mogens]]></animalName><shortDescription><![CDATA[A rare species of Mogens]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1062,'f7b14908-e95e-4c68-9ce9-982e2bbf1eb6',{ts '2018-12-28 13:03:43.270'},N'<home id="1062" key="8a593e06-83f0-477c-81b7-dc2af19a375e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-23T14:26:50" updateDate="2018-12-28T13:03:43" nodeName="Map" urlName="map" path="-1,1062" isDoc="" nodeType="1061" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1060" nodeTypeAlias="home" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1268,'ce82372e-c9e2-400e-8d78-1d8c694c681b',{ts '2018-12-28 13:28:17.213'},N'<calendar id="1268" key="c6a64856-1361-48ed-ae5e-89bdbaec04b7" parentID="1062" level="2" creatorID="0" sortOrder="4" createDate="2018-12-28T13:28:17" updateDate="2018-12-28T13:28:17" nodeName="Calendar" urlName="calendar" path="-1,1062,1268" isDoc="" nodeType="1263" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1077" nodeTypeAlias="calendar" isPublished="true"><featureCalendar><![CDATA[umb://document/8a593e0683f0477c81b7dc2af19a375e]]></featureCalendar></calendar>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',{ts '2018-12-11 13:58:16.277'},N'<animal id="1218" key="3829e12a-c42d-45a9-8c60-784cc25aa66d" parentID="1183" level="3" creatorID="0" sortOrder="4" createDate="2018-12-11T13:58:16" updateDate="2018-12-11T13:58:16" nodeName="adew" urlName="adew" path="-1,1062,1183,1218" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[asdad]]></animalWeight><animalDescription><![CDATA[<p>adwddwad</p>]]></animalDescription><animalHeight><![CDATA[adsad]]></animalHeight><animalName><![CDATA[adeawe]]></animalName><shortDescription><![CDATA[awdwada]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'3e60ff2b-3499-4adf-89ec-1479cbca25aa',{ts '2018-12-11 14:07:21.590'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T14:07:21" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',{ts '2018-12-11 14:06:33.577'},N'<animal id="1224" key="b00e3edf-fab1-4bea-ad6b-57185e329a36" parentID="1183" level="3" creatorID="0" sortOrder="5" createDate="2018-12-11T14:06:33" updateDate="2018-12-11T14:06:33" nodeName="lort" urlName="lort" path="-1,1062,1183,1224" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImageTwo><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImageTwo><galleryImageOne><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></galleryImageOne><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></imageAnimal><animalWeight><![CDATA[asdad]]></animalWeight><animalDescription><![CDATA[<p>adeadawadeee</p>]]></animalDescription><animalHeight><![CDATA[adasd]]></animalHeight><animalName><![CDATA[lort]]></animalName><shortDescription><![CDATA[adasdawdawda]]></shortDescription></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'e0aa7661-4c7b-4ce8-bbbc-29f4be1bd3f6',{ts '2018-12-11 14:16:30.783'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T14:16:30" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d,umb://document/b00e3edffab14beaad6b57185e329a36]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',{ts '2018-12-11 14:17:49.727'},N'<animal id="1230" key="a62b12bb-181e-4772-bbf3-c7d9fa5a0d88" parentID="1183" level="3" creatorID="0" sortOrder="5" createDate="2018-12-11T14:17:49" updateDate="2018-12-11T14:17:49" nodeName="jens" urlName="jens" path="-1,1062,1183,1230" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'e93a8bcb-2137-4d13-8195-6d8a08a666e7',{ts '2018-12-11 14:18:10.163'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T14:18:10" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d,umb://document/a62b12bb181e4772bbf3c7d9fa5a0d88]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1230,'60012621-b729-477b-b3e0-dfafd3679ab0',{ts '2018-12-11 14:19:49.517'},N'<animal id="1230" key="a62b12bb-181e-4772-bbf3-c7d9fa5a0d88" parentID="1183" level="3" creatorID="0" sortOrder="5" createDate="2018-12-11T14:17:49" updateDate="2018-12-11T14:18:36" nodeName="jens" urlName="jens" path="-1,1062,1183,1230" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="false"><imageAnimal><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></imageAnimal><animalWeight><![CDATA[adasda]]></animalWeight><animalDescription><![CDATA[<p>asdads</p>]]></animalDescription><animalHeight><![CDATA[asdas]]></animalHeight><animalName><![CDATA[Jens]]></animalName><shortDescription><![CDATA[adsada]]></shortDescription><galleryImage1><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></galleryImage1><galleryImage2><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'7ed56826-0fc2-4854-b4a0-b6a8a774e8a4',{ts '2018-12-11 14:32:12.347'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T14:32:12" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1234,'22b80537-77c1-4acf-8b8c-279a980898ac',{ts '2018-12-11 14:33:51.347'},N'<animal id="1234" key="d1b3336e-ceba-4833-b440-f4919b06d0d9" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-11T14:33:51" updateDate="2018-12-11T14:33:51" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1234" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06]]></imageAnimal><animalWeight><![CDATA[very fat]]></animalWeight><animalDescription><![CDATA[<p>eacearacjdjfjjrtjjej</p>]]></animalDescription><animalHeight><![CDATA[very tall]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage1><galleryImage3><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage3><galleryImage2><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'e7ba6190-aa8c-4846-a30c-f2243f70590f',{ts '2018-12-11 14:34:43.347'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-11T14:34:32" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="false"><featuredAnimals><![CDATA[umb://document/d1b3336eceba4833b440f4919b06d0d9]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',{ts '2018-12-11 14:37:37.860'},N'<animal id="1234" key="d1b3336e-ceba-4833-b440-f4919b06d0d9" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-11T14:33:51" updateDate="2018-12-11T14:37:37" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1234" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/45fe8798300d4ff0b7a84e2b813afbf2]]></imageAnimal><animalWeight><![CDATA[very fat]]></animalWeight><animalDescription><![CDATA[<p>eacearacjdjfjjrtjjej</p>]]></animalDescription><animalHeight><![CDATA[very tall]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage1><galleryImage3><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage3><galleryImage2><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',{ts '2018-12-11 14:42:43.187'},N'<animal id="1234" key="d1b3336e-ceba-4833-b440-f4919b06d0d9" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-11T14:33:51" updateDate="2018-12-11T14:42:43" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1234" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c]]></imageAnimal><animalWeight><![CDATA[very fat]]></animalWeight><animalDescription><![CDATA[<p>eacearacjdjfjjrtjjej</p>]]></animalDescription><animalHeight><![CDATA[very tall]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage1><galleryImage3><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage3><galleryImage2><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',{ts '2018-12-11 14:43:14.150'},N'<animal id="1234" key="d1b3336e-ceba-4833-b440-f4919b06d0d9" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-11T14:33:51" updateDate="2018-12-11T14:43:14" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1234" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><imageAnimal><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c]]></imageAnimal><animalWeight><![CDATA[100-200]]></animalWeight><animalDescription><![CDATA[<p>eacearacjdjfjjrtjjej</p>]]></animalDescription><animalHeight><![CDATA[100-200]]></animalHeight><animalName><![CDATA[Alpaca]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage1><galleryImage3><![CDATA[umb://media/61af577e573a4824be7f36938628b75c]]></galleryImage3><galleryImage2><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'cc22de5c-7893-40e6-a45c-1ee5033872d1',{ts '2018-12-12 10:30:04.750'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-12T10:30:04" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><itemIds><![CDATA[umb://document/d1b3336eceba4833b440f4919b06d0d9]]></itemIds><categoryName><![CDATA[Mammal]]></categoryName><featuredAnimals><![CDATA[umb://document/d1b3336eceba4833b440f4919b06d0d9]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'4a954c1f-66e5-46ea-9158-21260f63a931',{ts '2018-12-17 10:45:24.717'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-17T10:45:24" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',{ts '2018-12-17 10:47:06.153'},N'<animal id="1259" key="2bdc597d-a73c-4b6f-805a-02cc5663e5ab" parentID="1183" level="3" creatorID="0" sortOrder="0" createDate="2018-12-17T10:47:06" updateDate="2018-12-17T10:47:06" nodeName="Alpaca" urlName="alpaca" path="-1,1062,1183,1259" isDoc="" nodeType="1163" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1075" nodeTypeAlias="animal" isPublished="true"><bannerImage><![CDATA[umb://media/abc48596ab70486580832a9fbf01a223]]></bannerImage><imageAnimal><![CDATA[umb://media/7308629d1a4843279e9e49d947682d06]]></imageAnimal><animalWeight><![CDATA[50-100]]></animalWeight><animalDescription><![CDATA[<p><strong>An alpaca</strong></p>
<p> </p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p> </p>
<p><strong>An alpaca</strong></p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>]]></animalDescription><animalHeight><![CDATA[100-200]]></animalHeight><animalName><![CDATA[Alpacha]]></animalName><shortDescription><![CDATA[An alpaca]]></shortDescription><galleryImage1><![CDATA[umb://media/8b93931a369f41f2953bad86df5c2653]]></galleryImage1><galleryImage3><![CDATA[umb://media/dca25b7010ab4ca993bac2ee48f55c87]]></galleryImage3><galleryImage2><![CDATA[umb://media/613f62457e1a4a62a90975d68d62aff0]]></galleryImage2></animal>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'234f0a84-acd3-4c1c-9fea-91229d9d9d82',{ts '2018-12-17 10:48:17.200'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-17T10:48:17" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/2bdc597da73c4b6f805a02cc5663e5ab]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1269,'dfd8942c-cc07-4de1-a640-141c6afb1c79',{ts '2018-12-28 13:30:51.907'},N'<calendarItem id="1269" key="c6d8e430-c760-4f7a-97e3-d90078507c23" parentID="1268" level="3" creatorID="0" sortOrder="0" createDate="2018-12-28T13:30:46" updateDate="2018-12-28T13:30:51" nodeName="First event" urlName="first-event" path="-1,1062,1268,1269" isDoc="" nodeType="1264" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1079" nodeTypeAlias="calendarItem" isPublished="true"><eventHeadline><![CDATA[First event]]></eventHeadline><eventTime>2018-12-31T13:30:41</eventTime></calendarItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1268,'e92221b6-42b9-4a16-ac5a-2f5b8fd6f729',{ts '2018-12-28 13:31:15.057'},N'<calendar id="1268" key="c6a64856-1361-48ed-ae5e-89bdbaec04b7" parentID="1062" level="2" creatorID="0" sortOrder="4" createDate="2018-12-28T13:28:17" updateDate="2018-12-28T13:31:15" nodeName="Calendar" urlName="calendar" path="-1,1062,1268" isDoc="" nodeType="1263" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1077" nodeTypeAlias="calendar" isPublished="true"><featureCalendar><![CDATA[umb://document/8a593e0683f0477c81b7dc2af19a375e,umb://document/c6d8e430c7604f7a97e3d90078507c23]]></featureCalendar></calendar>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'39472b80-b7a5-4cc2-b3fe-c9ae02f15ad0',{ts '2018-12-10 15:22:32.823'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-10T15:22:32" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1268,'4674b53b-8989-4182-8dc0-6f221f20dc02',{ts '2018-12-28 13:52:17.317'},N'<calendar id="1268" key="c6a64856-1361-48ed-ae5e-89bdbaec04b7" parentID="1062" level="2" creatorID="0" sortOrder="4" createDate="2018-12-28T13:28:17" updateDate="2018-12-28T13:31:19" nodeName="Calendar" urlName="calendar" path="-1,1062,1268" isDoc="" nodeType="1263" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1077" nodeTypeAlias="calendar" isPublished="false"><featureCalendar><![CDATA[umb://document/c6d8e430c7604f7a97e3d90078507c23]]></featureCalendar></calendar>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'53406609-6ef0-44b2-b183-b557923aa25a',{ts '2018-12-10 15:27:35.623'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-10T15:27:35" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/7419dd8c407b4fca977a7c6bae8bd3cc]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1278,'3d29e530-9595-450d-b971-3eff1ea92919',{ts '2018-12-28 14:17:04.167'},N'<calendarItem id="1278" key="338d00d9-39f5-48f7-af7d-3f319c219c5d" parentID="1268" level="3" creatorID="0" sortOrder="1" createDate="2018-12-28T14:17:04" updateDate="2018-12-28T14:17:04" nodeName="Secoud try" urlName="secoud-try" path="-1,1062,1268,1278" isDoc="" nodeType="1264" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1079" nodeTypeAlias="calendarItem" isPublished="true"><descriptionContent><![CDATA[asdasdasdasd]]></descriptionContent><imageEvent><![CDATA[umb://media/7266ed16a35d4afe9c52f53518c41902]]></imageEvent><eventTitle><![CDATA[asdasdasd]]></eventTitle><event>2018-12-31T14:16:28</event><altDescription><![CDATA[asdasdasd]]></altDescription></calendarItem>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1183,'cdda4e99-0bf2-4749-b3a2-1efc31965708',{ts '2018-12-10 15:29:50.097'},N'<animals id="1183" key="abbcadf0-466d-48fc-86ba-27ff8c56b44e" parentID="1062" level="2" creatorID="0" sortOrder="3" createDate="2018-12-10T15:22:32" updateDate="2018-12-10T15:29:50" nodeName="Animals" urlName="animals" path="-1,1062,1183" isDoc="" nodeType="1076" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1128" nodeTypeAlias="animals" isPublished="true"><featuredAnimals><![CDATA[umb://document/7419dd8c407b4fca977a7c6bae8bd3cc,umb://document/2b151276d10b48d3845fae526757d698]]></featuredAnimals></animals>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1268,'35b3d003-c6c9-4b12-b90e-21e6882c2740',{ts '2018-12-28 14:18:38.107'},N'<calendar id="1268" key="c6a64856-1361-48ed-ae5e-89bdbaec04b7" parentID="1062" level="2" creatorID="0" sortOrder="4" createDate="2018-12-28T13:28:17" updateDate="2018-12-28T14:18:38" nodeName="Calendar" urlName="calendar" path="-1,1062,1268" isDoc="" nodeType="1263" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1077" nodeTypeAlias="calendar" isPublished="true"><featureCalendar><![CDATA[umb://document/338d00d939f548f7af7d3f319c219c5d]]></featureCalendar></calendar>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1062,'75421f6a-a5b2-4d33-af82-74dfca1b882f',{ts '2019-01-03 14:18:32.443'},N'<home id="1062" key="8a593e06-83f0-477c-81b7-dc2af19a375e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-23T14:26:50" updateDate="2019-01-03T14:18:32" nodeName="Map" urlName="map" path="-1,1062" isDoc="" nodeType="1061" creatorName="Jonathan Pabst Klemensen" writerName="Jonathan Pabst Klemensen" writerID="0" template="1060" nodeTypeAlias="home" isPublished="true"><map><![CDATA[[{"key":"29c55997-cd96-451f-8e5c-1bcf51f485f9","name":"Item 1","ncContentTypeAlias":"maps","map":"{\r\n  \"position\": {\r\n    \"id\": \"WGS84\",\r\n    \"datum\": \"55.808262,9.350541\"\r\n  }\r\n}","animal":"umb://document/2bdc597da73c4b6f805a02cc5663e5ab"}]]]></map></home>');
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (352,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (353,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',93,NULL,NULL,NULL,N'200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (803,1268,'ce82372e-c9e2-400e-8d78-1d8c694c681b',117,NULL,NULL,NULL,NULL,N'umb://document/8a593e0683f0477c81b7dc2af19a375e');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (354,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',91,NULL,NULL,NULL,NULL,N'<p>eadeafeadsd</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (355,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (356,1187,'b55db367-0d55-4af9-8229-c5552a7a582e',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (357,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (358,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',93,NULL,NULL,NULL,N'1000',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (359,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',91,NULL,NULL,NULL,NULL,N'<p>ersewsa</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (360,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (361,1188,'70a92b3e-b8af-4da1-8440-65d0fc3217bb',89,NULL,NULL,NULL,N'alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (362,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (363,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',93,NULL,NULL,NULL,N'1000',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (364,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',91,NULL,NULL,NULL,NULL,N'<p>ersewsa</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (365,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (366,1188,'5985949e-1221-4a0c-bc29-ca9c64f57362',89,NULL,NULL,NULL,N'alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (367,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (368,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',93,NULL,NULL,NULL,N'1000',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (369,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',91,NULL,NULL,NULL,NULL,N'<p>ersewsa</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (370,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (371,1188,'c80bd39a-9bf2-4fce-b262-6e33c4d9b230',89,NULL,NULL,NULL,N'alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (372,1183,'d6edbe5c-9a2b-4aaa-b487-8e50f933e3d2',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (373,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (374,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',93,NULL,NULL,NULL,N'123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (375,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',91,NULL,NULL,NULL,NULL,N'<p>qr3eq3eq</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (376,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',92,NULL,NULL,NULL,N'123123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (377,1189,'57325650-ba53-4ebc-9c1a-ada13d775554',89,NULL,NULL,NULL,N'Jesper',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (378,1183,'9343da05-0e14-471e-b7db-a938488e3f45',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (379,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (380,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',93,NULL,NULL,NULL,N'123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (381,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',91,NULL,NULL,NULL,NULL,N'<p>SLIM SHADY</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (382,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',92,NULL,NULL,NULL,N'123123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (383,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',89,NULL,NULL,NULL,N'Jesper',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (384,1189,'abe8fc5c-e2a9-4185-9feb-3d7b51111fe8',94,NULL,NULL,NULL,N'WHAT MY NAME IS',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (385,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (765,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',52,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (766,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (764,1183,'cc22de5c-7893-40e6-a45c-1ee5033872d1',81,NULL,NULL,NULL,NULL,N'umb://document/d1b3336eceba4833b440f4919b06d0d9');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (767,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',93,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (768,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (769,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (770,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (771,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (772,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (773,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (774,1234,'44b78f98-f6b6-461f-99fa-6582d4fcad28',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (775,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',52,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (776,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (777,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',93,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (778,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (779,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (780,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (781,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (782,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (783,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (784,1234,'0a8849b5-6385-41b4-b5b2-4627b1cd96a1',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (785,1183,'4a954c1f-66e5-46ea-9158-21260f63a931',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (786,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',52,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (787,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',90,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (788,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',93,NULL,NULL,NULL,N'50-100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (789,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',91,NULL,NULL,NULL,NULL,N'<p><strong>An alpaca</strong></p>
<p> </p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p> </p>
<p><strong>An alpaca</strong></p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>
<p>An alpacaAn alpacaAn alpacaAn alpacaAn alpacaAn alpaca</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (790,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (791,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',89,NULL,NULL,NULL,N'Alpacha',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (792,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (793,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',100,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (794,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',102,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (386,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',93,NULL,NULL,NULL,N'200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (387,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',91,NULL,NULL,NULL,NULL,N'<p>Ham u'' fra landet</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (20,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1001/givskudzoo_alpaka.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (21,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',7,NULL,NULL,NULL,N'700',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (22,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',8,NULL,NULL,NULL,N'741',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (23,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',9,NULL,NULL,NULL,N'124411',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (24,1093,'11dde1c8-de94-45b3-9298-a4f5d07fb548',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (388,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (389,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (390,1187,'13f83258-292f-46ea-950b-7ec3c9aa8d9a',94,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (391,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',90,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (392,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (393,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',91,NULL,NULL,NULL,NULL,N'<p>wadwqadwqdqwd</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (394,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (395,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',89,NULL,NULL,NULL,N'Uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (396,1194,'a65573e4-eb3a-4e5d-a1f4-27a13d41d999',94,NULL,NULL,NULL,N'An species of uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (397,1183,'bdd00222-58c7-4931-8851-a318145fbaf9',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (398,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (399,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (400,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',91,NULL,NULL,NULL,NULL,N'<p>ewfsdfdfs</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (401,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (402,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',89,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (403,1195,'556f40cd-7e6d-45c3-ba6d-0661d96c9f7a',94,NULL,NULL,NULL,N'Fiskw',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (404,1183,'766f2fe8-91bf-4526-bc0c-b03b10fc108c',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (405,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (406,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',93,NULL,NULL,NULL,N'200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (407,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',91,NULL,NULL,NULL,NULL,N'<p>Ham u'' fra landet</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (408,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (409,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (410,1187,'8ed51033-a89a-497e-b01c-c29cf34218e8',94,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (411,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1003/blpandet-dvrgara.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (412,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',7,NULL,NULL,NULL,N'700',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (413,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',8,NULL,NULL,NULL,N'741',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (414,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',9,NULL,NULL,NULL,N'65280',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (415,1196,'f0f60bed-a36e-4ffa-b912-b2484ebf5f03',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (416,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1004/alpaka4.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (417,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',7,NULL,NULL,NULL,N'425',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (418,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',8,NULL,NULL,NULL,N'392',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (796,1183,'234f0a84-acd3-4c1c-9fea-91229d9d9d82',81,NULL,NULL,NULL,NULL,N'umb://document/2bdc597da73c4b6f805a02cc5663e5ab');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (804,1269,'dfd8942c-cc07-4de1-a640-141c6afb1c79',115,NULL,NULL,NULL,N'First event',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (805,1269,'dfd8942c-cc07-4de1-a640-141c6afb1c79',116,NULL,NULL,{ts '2018-12-31 13:30:41.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (806,1268,'e92221b6-42b9-4a16-ac5a-2f5b8fd6f729',117,NULL,NULL,NULL,NULL,N'umb://document/8a593e0683f0477c81b7dc2af19a375e,umb://document/c6d8e430c7604f7a97e3d90078507c23');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (807,1268,'4674b53b-8989-4182-8dc0-6f221f20dc02',117,NULL,NULL,NULL,NULL,N'umb://document/c6d8e430c7604f7a97e3d90078507c23');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (808,1278,'3d29e530-9595-450d-b971-3eff1ea92919',118,NULL,NULL,NULL,NULL,N'asdasdasdasd');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (809,1278,'3d29e530-9595-450d-b971-3eff1ea92919',119,NULL,NULL,NULL,NULL,N'umb://media/7266ed16a35d4afe9c52f53518c41902');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (810,1278,'3d29e530-9595-450d-b971-3eff1ea92919',115,NULL,NULL,NULL,N'asdasdasd',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (811,1278,'3d29e530-9595-450d-b971-3eff1ea92919',116,NULL,NULL,{ts '2018-12-31 14:16:28.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (812,1278,'3d29e530-9595-450d-b971-3eff1ea92919',120,NULL,NULL,NULL,N'asdasdasd',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (813,1269,'556c42e4-8972-4a18-9b10-826338855917',118,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (814,1269,'556c42e4-8972-4a18-9b10-826338855917',119,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (815,1269,'556c42e4-8972-4a18-9b10-826338855917',115,NULL,NULL,NULL,N'First event',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (816,1269,'556c42e4-8972-4a18-9b10-826338855917',116,NULL,NULL,{ts '2018-12-31 13:30:41.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (817,1269,'556c42e4-8972-4a18-9b10-826338855917',120,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (818,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',118,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (819,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',119,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (820,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',115,NULL,NULL,NULL,N'First event',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (821,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',116,NULL,NULL,{ts '2018-12-31 13:30:41.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (822,1269,'f53650eb-eeef-4512-a9ba-1a8482462082',120,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (823,1268,'35b3d003-c6c9-4b12-b90e-21e6882c2740',117,NULL,NULL,NULL,NULL,N'umb://document/338d00d939f548f7af7d3f319c219c5d');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (824,1062,'75421f6a-a5b2-4d33-af82-74dfca1b882f',123,NULL,NULL,NULL,NULL,N'[{"key":"29c55997-cd96-451f-8e5c-1bcf51f485f9","name":"Item 1","ncContentTypeAlias":"maps","map":"{\r\n  \"position\": {\r\n    \"id\": \"WGS84\",\r\n    \"datum\": \"55.808262,9.350541\"\r\n  }\r\n}","animal":"umb://document/2bdc597da73c4b6f805a02cc5663e5ab"}]');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (649,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (650,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',91,NULL,NULL,NULL,NULL,N'<p>wadwqadwqdqwd</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (651,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (652,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',89,NULL,NULL,NULL,N'Uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (653,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',94,NULL,NULL,NULL,N'An species of uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (654,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (655,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (656,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (657,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',90,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (658,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (659,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',91,NULL,NULL,NULL,NULL,N'<p>wadwqadwqdqwd</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (660,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (661,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',89,NULL,NULL,NULL,N'Uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (662,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',94,NULL,NULL,NULL,N'An species of uffe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (663,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (664,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (665,1194,'fdd6f837-44ca-4414-8ebf-65a532107e88',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (666,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06,umb://media/7266ed16a35d4afe9c52f53518c41902,umb://media/61af577e573a4824be7f36938628b75c,umb://media/45fe8798300d4ff0b7a84e2b813afbf2,umb://media/dca25b7010ab4ca993bac2ee48f55c87,umb://media/613f62457e1a4a62a90975d68d62aff0,umb://media/53850509a4d04bcb9793017702c222a8');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (667,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (668,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',91,NULL,NULL,NULL,NULL,N'<p>ewfsdfdfs</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (669,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (670,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',89,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (671,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',94,NULL,NULL,NULL,N'Fiskw',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (672,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (673,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (674,1195,'540d35c5-a80c-4a39-90eb-7f147bd68a82',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (675,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06,umb://media/7266ed16a35d4afe9c52f53518c41902,umb://media/61af577e573a4824be7f36938628b75c,umb://media/45fe8798300d4ff0b7a84e2b813afbf2,umb://media/dca25b7010ab4ca993bac2ee48f55c87,umb://media/613f62457e1a4a62a90975d68d62aff0,umb://media/53850509a4d04bcb9793017702c222a8');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (676,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (677,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',91,NULL,NULL,NULL,NULL,N'<p>ewfsdfdfs</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (678,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (679,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',89,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (680,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',94,NULL,NULL,NULL,N'Fiskw',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (681,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (682,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (683,1195,'19ea3a36-e7b0-4ead-8361-87147e75174d',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (684,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (685,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (686,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',91,NULL,NULL,NULL,NULL,N'<p>adwddwad</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (687,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',92,NULL,NULL,NULL,N'adsad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (688,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',89,NULL,NULL,NULL,N'adeawe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (689,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',94,NULL,NULL,NULL,N'awdwada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (690,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (691,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (692,1218,'3b80b983-5dbc-42de-9eb4-bcc560a10d1e',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (693,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (419,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',9,NULL,NULL,NULL,N'39922',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (420,1197,'0516a2cf-2c8a-449c-83a1-9f0a0cb44557',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (421,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1005/givskudzoo_flamingo.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (422,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',7,NULL,NULL,NULL,N'1170',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (316,1183,'39472b80-b7a5-4cc2-b3fe-c9ae02f15ad0',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (423,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',8,NULL,NULL,NULL,N'480',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (424,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',9,NULL,NULL,NULL,N'174073',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (425,1198,'9d09b507-48c6-4a91-93ed-7e9426cdaeba',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (426,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1006/givskudzoo_kamelflok_liggende_anlaeg_0769.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (427,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',7,NULL,NULL,NULL,N'1170',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (428,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',8,NULL,NULL,NULL,N'480',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (429,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',9,NULL,NULL,NULL,N'238303',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (430,1199,'8af13cd1-2e92-4ccf-bf7f-b63b8ddee26a',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (431,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1007/lion.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (432,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',7,NULL,NULL,NULL,N'1196',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (433,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',8,NULL,NULL,NULL,N'793',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (434,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',9,NULL,NULL,NULL,N'123449',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (435,1200,'3dd71910-2072-426d-aab4-1bb78df78c42',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (436,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1008/park-opening.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (437,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',7,NULL,NULL,NULL,N'256',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (438,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',8,NULL,NULL,NULL,N'256',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (439,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',9,NULL,NULL,NULL,N'33774',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (440,1201,'dc249e48-9c5b-451c-b326-1cd2be48ac3d',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (441,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1009/soldaterara.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (442,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',7,NULL,NULL,NULL,N'700',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (443,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',8,NULL,NULL,NULL,N'741',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (444,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',9,NULL,NULL,NULL,N'92877',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (445,1202,'0a28d41a-2a5e-4c33-938b-11274bc32aaf',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (446,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06,umb://media/7266ed16a35d4afe9c52f53518c41902,umb://media/61af577e573a4824be7f36938628b75c,umb://media/45fe8798300d4ff0b7a84e2b813afbf2,umb://media/dca25b7010ab4ca993bac2ee48f55c87,umb://media/613f62457e1a4a62a90975d68d62aff0,umb://media/53850509a4d04bcb9793017702c222a8');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (447,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',93,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (448,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',91,NULL,NULL,NULL,NULL,N'<p>ewfsdfdfs</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (449,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',92,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (450,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',89,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (451,1195,'b1968057-0ea4-4806-920f-8b1f4d776910',94,NULL,NULL,NULL,N'Fiskw',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (322,1183,'53406609-6ef0-44b2-b183-b557923aa25a',81,NULL,NULL,NULL,NULL,N'umb://document/7419dd8c407b4fca977a7c6bae8bd3cc');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (569,1183,'3e60ff2b-3499-4adf-89ec-1479cbca25aa',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (579,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (580,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (581,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',91,NULL,NULL,NULL,NULL,N'<p>adeadawadeee</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (455,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (456,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',93,NULL,NULL,NULL,N'200-300',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (457,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (458,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (459,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (460,1214,'821c9c9b-e5f4-4829-9b54-b94a75920173',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (572,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (573,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (574,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',91,NULL,NULL,NULL,NULL,N'<p>adeadawadeee</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (464,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (465,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (466,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (467,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (328,1183,'cdda4e99-0bf2-4749-b3a2-1efc31965708',81,NULL,NULL,NULL,NULL,N'umb://document/7419dd8c407b4fca977a7c6bae8bd3cc,umb://document/2b151276d10b48d3845fae526757d698');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (468,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (469,1215,'ac51af52-6a43-4190-82ae-70336e2bd96a',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (575,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',92,NULL,NULL,NULL,N'adasd',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (576,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',89,NULL,NULL,NULL,N'lort',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (577,1224,'fb6fb1d2-5a03-4dc9-be2f-85aafdbbb9cd',94,NULL,NULL,NULL,N'adasdawdawda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (473,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (474,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (475,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (476,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (477,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (478,1216,'55208417-3bd1-42c0-976a-5796b16cbcac',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (578,1183,'e0aa7661-4c7b-4ce8-bbbc-29f4be1bd3f6',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d,umb://document/b00e3edffab14beaad6b57185e329a36');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (582,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',92,NULL,NULL,NULL,N'adasd',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (583,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',89,NULL,NULL,NULL,N'lort',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (482,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (483,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',93,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (484,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (485,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',92,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (486,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (487,1217,'2f6ef9c6-9562-4fc2-afa3-2a60b7b1690e',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (584,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',94,NULL,NULL,NULL,N'adasdawdawda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (585,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (586,1224,'03964d7a-2c3c-4734-b2ee-9dedfed25eab',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (587,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (588,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (118,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',6,NULL,NULL,NULL,NULL,N'{"src": "/media/1002/alpaka6.jpg", "crops": []}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (119,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',7,NULL,NULL,NULL,N'2000',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (120,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',8,NULL,NULL,NULL,N'1000',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (121,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',9,NULL,NULL,NULL,N'260255',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (122,1161,'2ef1ec02-f5b8-45c7-b7f8-99a0383f2c7b',10,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (589,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',91,NULL,NULL,NULL,NULL,N'<p>adeadawadeee</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (590,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',92,NULL,NULL,NULL,N'adasd',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (491,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (492,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',93,NULL,NULL,NULL,N'200-300',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (493,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (494,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (495,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (496,1214,'6add2f9a-1b51-40e2-9766-a2e49da309cd',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (591,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',89,NULL,NULL,NULL,N'lort',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (592,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',94,NULL,NULL,NULL,N'adasdawdawda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (593,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (500,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (501,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',93,NULL,NULL,NULL,N'200-300',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (502,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (503,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (504,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (505,1214,'b7efdc96-29b2-426b-8c73-b4d87f6290bf',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (594,1224,'60792152-26de-463f-80b3-fdb3fa5e468b',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (595,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (596,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',93,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (509,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (510,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (511,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (512,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (513,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (514,1215,'8a4c3e6d-196a-4036-9ced-a83de954ad7d',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (597,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',91,NULL,NULL,NULL,NULL,N'');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (598,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',92,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (599,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (600,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',94,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (601,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',100,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (602,1230,'ea8d8919-2ef5-459a-b859-2d1a40e46f85',101,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (603,1183,'e93a8bcb-2137-4d13-8195-6d8a08a666e7',81,NULL,NULL,NULL,NULL,N'umb://document/b8058c7b4ccb4c42a0164474156a7908,umb://document/3bcb94db0cdb4d88b41bb2fda9cc3ff4,umb://document/b91067f8d1894a38930ee98f8677b1db,umb://document/c24db2f8164447f491443f6bc2a52217,umb://document/3829e12ac42d45a98c60784cc25aa66d,umb://document/a62b12bb181e4772bbf3c7d9fa5a0d88');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (604,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (605,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',93,NULL,NULL,NULL,N'adasda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (606,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',91,NULL,NULL,NULL,NULL,N'<p>asdads</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (518,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (519,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (520,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (521,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (522,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (523,1215,'ab0efb5f-0a43-40bf-b348-e8873c743a86',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (607,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',92,NULL,NULL,NULL,N'asdas',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (608,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',89,NULL,NULL,NULL,N'Jens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (609,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',94,NULL,NULL,NULL,N'adsada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (527,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (528,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (529,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (530,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (531,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (532,1216,'cbac87c4-8b53-4946-8e58-38e552fff726',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (610,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',100,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (611,1230,'60012621-b729-477b-b3e0-dfafd3679ab0',101,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (612,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (536,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (537,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',93,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (538,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (539,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (540,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (541,1216,'11c032a1-692a-46a2-89ed-0c2e5656a49e',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (613,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',93,NULL,NULL,NULL,N'200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (614,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',91,NULL,NULL,NULL,NULL,N'<p>Ham u'' fra landet</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (615,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (545,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (546,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',93,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (547,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (548,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',92,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (549,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (550,1217,'86f83a7c-a39d-4f67-a127-1c5ca65ca141',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (616,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (617,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',94,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (618,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (619,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (620,1187,'cc6947cf-b8f0-44bc-b587-fd855914ba7b',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (621,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (622,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',93,NULL,NULL,NULL,N'200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (554,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (555,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',93,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (556,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',91,NULL,NULL,NULL,NULL,N'<p>A rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of MogensA rare species of Mogens</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (557,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',92,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (558,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',89,NULL,NULL,NULL,N'Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (559,1217,'0db20dfb-253d-4631-a3a6-87f2df9e0024',94,NULL,NULL,NULL,N'A rare species of Mogens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (623,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',91,NULL,NULL,NULL,NULL,N'<p>Ham u'' fra landet</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (624,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',92,NULL,NULL,NULL,N'100',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (625,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (563,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (564,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (565,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',91,NULL,NULL,NULL,NULL,N'<p>adwddwad</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (566,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',92,NULL,NULL,NULL,N'adsad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (567,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',89,NULL,NULL,NULL,N'adeawe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (568,1218,'8b7bba9c-62fc-4412-a774-f83ef8fdfc8b',94,NULL,NULL,NULL,N'awdwada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (626,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',94,NULL,NULL,NULL,N'Jonathan',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (627,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (628,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (629,1187,'c7130a9d-faad-4b2d-b51a-be01473ae7c4',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (630,1189,'5879eef9-5b97-4859-b810-44a068d140dc',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (631,1189,'5879eef9-5b97-4859-b810-44a068d140dc',93,NULL,NULL,NULL,N'123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (632,1189,'5879eef9-5b97-4859-b810-44a068d140dc',91,NULL,NULL,NULL,NULL,N'<p>SLIM SHADY</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (633,1189,'5879eef9-5b97-4859-b810-44a068d140dc',92,NULL,NULL,NULL,N'123123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (634,1189,'5879eef9-5b97-4859-b810-44a068d140dc',89,NULL,NULL,NULL,N'Jesper',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (635,1189,'5879eef9-5b97-4859-b810-44a068d140dc',94,NULL,NULL,NULL,N'WHAT MY NAME IS',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (636,1189,'5879eef9-5b97-4859-b810-44a068d140dc',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (637,1189,'5879eef9-5b97-4859-b810-44a068d140dc',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (638,1189,'5879eef9-5b97-4859-b810-44a068d140dc',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (639,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (640,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',93,NULL,NULL,NULL,N'123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (641,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',91,NULL,NULL,NULL,NULL,N'<p>SLIM SHADY</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (642,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',92,NULL,NULL,NULL,N'123123123',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (643,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',89,NULL,NULL,NULL,N'Jesper',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (644,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',94,NULL,NULL,NULL,N'WHAT MY NAME IS',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (645,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (646,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (647,1189,'2c06e987-ee30-4a09-af16-de58ace2f0e4',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (648,1194,'f1b17c79-a1dd-4959-9af0-ff174b7b32ef',90,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (730,1183,'e7ba6190-aa8c-4846-a30c-f2243f70590f',81,NULL,NULL,NULL,NULL,N'umb://document/d1b3336eceba4833b440f4919b06d0d9');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (731,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/45fe8798300d4ff0b7a84e2b813afbf2');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (732,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',93,NULL,NULL,NULL,N'very fat',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (733,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (734,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',92,NULL,NULL,NULL,N'very tall',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (735,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (736,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (737,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (738,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (739,1234,'0726c572-a87e-4d30-8cde-ee150b5d20fd',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (740,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (741,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',93,NULL,NULL,NULL,N'very fat',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (742,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (743,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',92,NULL,NULL,NULL,N'very tall',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (744,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (745,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (746,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (747,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (748,1234,'4481b806-b0e2-47b6-8ee5-87288eb584f3',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (749,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (750,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',93,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (751,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (752,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',92,NULL,NULL,NULL,N'100-200',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (753,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (754,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (755,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (756,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (757,1234,'3ff43166-e0d7-4bd6-bf1a-be71feb94973',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (795,1259,'ac85fafe-294b-4dce-985b-f349fefccfbd',101,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (694,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',93,NULL,NULL,NULL,N'asdad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (695,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',91,NULL,NULL,NULL,NULL,N'<p>adwddwad</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (696,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',92,NULL,NULL,NULL,N'adsad',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (697,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',89,NULL,NULL,NULL,N'adeawe',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (698,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',94,NULL,NULL,NULL,N'awdwada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (699,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',100,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (700,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (701,1218,'d81c316b-7722-4ff4-b241-33570e427bd6',101,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (702,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (703,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',93,NULL,NULL,NULL,N'adasda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (704,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',91,NULL,NULL,NULL,NULL,N'<p>asdads</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (705,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',92,NULL,NULL,NULL,N'asdas',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (706,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',89,NULL,NULL,NULL,N'Jens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (707,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',94,NULL,NULL,NULL,N'adsada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (708,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',100,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (709,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (710,1230,'47120d1d-5c47-43c8-a0a9-ea754a84e51f',101,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (711,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',90,NULL,NULL,NULL,NULL,N'umb://media/8b93931a369f41f2953bad86df5c2653');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (712,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',93,NULL,NULL,NULL,N'adasda',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (713,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',91,NULL,NULL,NULL,NULL,N'<p>asdads</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (714,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',92,NULL,NULL,NULL,N'asdas',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (715,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',89,NULL,NULL,NULL,N'Jens',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (716,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',94,NULL,NULL,NULL,N'adsada',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (717,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',100,NULL,NULL,NULL,NULL,N'umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (718,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',102,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (719,1230,'a79a7263-3687-4d10-b8bb-945561ec2a56',101,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (720,1183,'7ed56826-0fc2-4854-b4a0-b6a8a774e8a4',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (721,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',90,NULL,NULL,NULL,NULL,N'umb://media/abc48596ab70486580832a9fbf01a223,umb://media/7308629d1a4843279e9e49d947682d06');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (722,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',93,NULL,NULL,NULL,N'very fat',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (723,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',91,NULL,NULL,NULL,NULL,N'<p>eacearacjdjfjjrtjjej</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (724,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',92,NULL,NULL,NULL,N'very tall',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (725,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',89,NULL,NULL,NULL,N'Alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (726,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',94,NULL,NULL,NULL,N'An alpaca',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (727,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',100,NULL,NULL,NULL,NULL,N'umb://media/613f62457e1a4a62a90975d68d62aff0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (728,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',102,NULL,NULL,NULL,NULL,N'umb://media/61af577e573a4824be7f36938628b75c');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (729,1234,'22b80537-77c1-4acf-8b8c-279a980898ac',101,NULL,NULL,NULL,NULL,N'umb://media/dca25b7010ab4ca993bac2ee48f55c87');
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (6,1043,1032,3,N'umbracoFile',N'Upload image',0,0,NULL,NULL,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',0,0,NULL,NULL,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (27,-96,1031,5,N'contents',N'Contents:',0,0,NULL,NULL,'0000001b-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (29,-92,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (32,-92,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (33,-92,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (34,-92,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (50,-92,1044,NULL,N'umbracoMemberPasswordRetrievalAnswer',N'Password Answer',0,0,NULL,NULL,'de3bbc28-0bfb-4d9c-a2bf-81d50c3c073c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (51,-92,1044,NULL,N'umbracoMemberPasswordRetrievalQuestion',N'Password Question',1,0,NULL,NULL,'1c86e45d-5f6b-463a-ab7c-3fab625f724c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (52,1067,1068,12,N'bannerImage',N'Animal Banner',0,0,NULL,N'Select an image to be shown on the animal cards on the animals list','6f65fc6b-dd61-4ab4-ad32-99d498ff8771');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (53,1069,1071,13,N'headline',N'Headline',0,0,NULL,NULL,'3ce37022-b2e4-4a99-8cb0-eb3d97d74bcf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (54,1070,1071,13,N'bodyText',N'Body text',1,0,NULL,NULL,'f673ea59-119d-407e-a8bc-251b1d914558');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (55,1072,1074,14,N'metaTitle',N'Meta title',0,0,NULL,NULL,'4d1e0abe-c2e7-4d75-b5f7-dcd7e543d848');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (56,1073,1074,14,N'metaDescription',N'Meta description',1,0,NULL,NULL,'048bc6b8-35ca-4631-9260-04dd00677206');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (89,1165,1163,25,N'animalName',N'Animal Name',0,0,NULL,N'Enter the name of the animal in this field','782516f1-3d05-47d3-93c5-cbba69ad39d6');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (98,1220,1223,27,N'galleryImageOne',N'Gallery image one',0,0,NULL,NULL,'624f42df-f815-48be-b582-e207bc777a50');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (90,1167,1163,25,N'imageAnimal',N'Image animal',1,0,NULL,N'Select a picture to be shown on the animal cards','e595357f-03c8-4620-b881-0988eb9971ab');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (91,1169,1163,25,N'animalDescription',N'Animal Description',3,0,NULL,N'Enter a thorough description of the animal','433fabbe-23dd-4b84-831f-771fc061351e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (72,1110,1112,19,N'featureName',N'Name',0,0,NULL,NULL,'04acdf75-469f-4bc6-9216-0380b320360e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (73,1111,1112,19,N'details',N'Details',1,0,NULL,NULL,'6178f1c1-2f79-46e3-a142-6b25f8a01923');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (92,1177,1163,25,N'animalHeight',N'Animal height',4,0,NULL,N'Enter the height of the animal','2f863b61-d998-40f2-ad51-ae50730b8daa');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (94,1192,1163,25,N'shortDescription',N'Short description',2,0,NULL,N'A short description to be shown on the animals page','15946a78-66c6-4b0f-81cb-fab42c89fa67');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (99,1222,1223,27,N'galleryImageTwo',N'Gallery image two',1,0,NULL,NULL,'2a1137b3-ffdd-48a3-b094-6ee659eb071c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (81,1127,1076,23,N'featuredAnimals',N'featured animals',3,0,NULL,NULL,'208c2f0f-fc0d-4437-af4b-690008a0f0ba');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (100,1227,1163,28,N'galleryImage1',N'Gallery image-1',0,0,NULL,N'Upload the first image for the gallery','cb4536cf-6bd2-4c7e-bf8b-2842ae194601');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (117,1266,1263,35,N'featureCalendar',N'feature Calendar',0,0,NULL,NULL,'82242b09-812d-48b8-b694-049eb270199d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (115,-88,1264,36,N'eventTitle',N'event headline',0,0,NULL,NULL,'f98e9174-1d6e-4426-8fbb-9c72fb228e36');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (93,1178,1163,25,N'animalWeight',N'Animal weight',5,0,NULL,N'enter the weight of the animal','aea3fba5-a9ee-418d-86c8-0bb130b2dbe9');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (101,1228,1163,28,N'galleryImage2',N'Gallery image-2',1,0,NULL,N'Upload the second image for the gallery','f147164d-7792-41da-9cc8-75444c3aabb4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (102,1233,1163,28,N'galleryImage3',N'Gallery image-3',2,0,NULL,N'Upload the third image for the gallery','2498eef8-5472-4d51-acb6-627825fce4c4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (107,1245,1254,31,N'collectionName',N'CollectionName',0,0,NULL,NULL,'0f05fd1b-86d1-4a2a-98b0-7ee490fba5e8');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (108,1249,1254,31,N'categoryIds',N'CategoryIds',1,0,NULL,NULL,'8d689390-e4cb-4a2e-9ccf-62fd6e8b31c3');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (109,1256,1258,32,N'categoryName',N'CategoryName',0,0,NULL,NULL,'8f149600-08e6-4a7c-b45c-facd4c3e36b3');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (110,1257,1258,32,N'categoryIds',N'CategoryIds',1,0,NULL,NULL,'b6c54175-dd8b-4d38-94e0-bc85b82e4005');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (116,-36,1264,36,N'event',N'Event time',1,0,NULL,NULL,'577d025a-dcd1-4b09-9d04-9e4598e66daf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (118,1273,1264,36,N'descriptionContent',N'Description',2,0,NULL,NULL,'e970fa98-84ed-4646-baee-1080d466e618');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (119,1275,1264,36,N'imageEvent',N'Image',3,0,NULL,NULL,'1a194df9-6cd9-4e86-b1a8-18c763cc68e5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (120,1277,1264,36,N'altDescription',N'alt description',4,0,NULL,NULL,'b5f6f992-b06f-41a9-8ecf-b39981d6e6a5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (121,1279,1282,37,N'map',N'Map',0,0,NULL,NULL,'f1670952-2214-4515-a37d-92574f503385');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (122,1284,1282,37,N'animal',N'Animal',1,0,NULL,NULL,'eb0d9cab-548d-4b41-b83b-6cb7b8a982cd');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (123,1280,1061,38,N'map',N'Map',0,0,NULL,NULL,'d3816496-d0d2-4d29-bacf-814a0cf3690e');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (5,1031,N'Contents',1,'79995fa2-63ee-453c-a29b-2e66f324cdbe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (12,1068,N'Banner',1,'91ddbce5-26b0-4a10-ad7b-97de35fc0183');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (13,1071,N'Headline',0,'024cf50d-5a4c-4080-a867-58408599c2c5');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (14,1074,N'SEO',0,'eb91cdc0-00cc-449e-bca2-907355768652');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (25,1163,N'Animal',2,'9d823ccf-cf8e-468c-bfe0-8de8e1f83c5e');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (27,1223,N'Animal-gallery',0,'6671084c-982b-4bac-bc10-cf96e22e7181');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (19,1112,N'feature',0,'f7473b4f-2d24-4bbf-aae4-f5edd3f433e1');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (28,1163,N'Gallery',3,'7c49b90b-bbca-4460-8be6-b3f210c32c41');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (23,1076,N'Animal list',0,'82f75927-ec49-45f1-b963-91fe1ee4fe9b');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (35,1263,N'feature',0,'f65981e5-87b0-43e8-87ae-99c76c599575');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (31,1254,N'Data',0,'90228ad4-5664-4cdc-a3cf-56e31291e53d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (32,1258,N'Data',0,'a28912b3-ba7e-42d9-ba69-2aa02d83ad38');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (36,1264,N'Calendar content',0,'f8fdbb7f-5fa5-4dfa-a4f5-e857bea67195');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (37,1282,N'Map',0,'5a9db909-9186-4f63-ae95-d4545267a701');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (38,1061,N'Map',0,'3f1a953f-9343-4b39-a5ec-607e32019729');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (1,1060,N'Home',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Home>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}

');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (2,1065,N'ContentPage',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.ContentPage>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (3,1075,N'Animal',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Animal>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{


    Layout = "Master.cshtml";
    var animal = Model.Content;
}
<body class="page-animals">
    <section class="bg-light bg-lg-none mvh-100 p-0 py-lg-5 page-animals">
        <div class="container">
            <div class="content bg-none bg-lg-white-80 rounded">
                <div class="row no-gutters">
                    <div class="col-12 col-lg-7 col-xl-8">
                        <div class="card card-slide-bottom rounded-top rounded-left-lg shadow-3-top">
                            <img class="card-img-top rounded-left-lg" src="@animal.ImageAnimal.Url" alt="Alpaca" height="200px">
                            <div class="card-body p-lg-4">
                                <h1 class="text-center">@animal.AnimalName</h1>
                                <p>@Umbraco.Field("shortDescription")</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5 col-xl-4">
                        <div class="py-3 p-lg-4">
                            <h2>Facts</h2>
                            <dl class="row">
                                <dt class="col-sm-3">Height</dt>
                                <dd class="col-sm-9">@animal.AnimalHeight cm</dd>
                                <dt class="col-sm-3">Weight</dt>
                                <dd class="col-sm-9">@animal.AnimalName kg</dd>
                            </dl>
                            <h2>Gallery</h2>
                            <div class="grid-1">
                                <img class="img-fluid" src="../images/alpaka6.jpg" alt="Alpaca">
                                <img class="img-fluid" src="../images/alpaka6.jpg" alt="Alpaca">
                                <img class="img-fluid" src="../images/alpaka6.jpg" alt="Alpaca">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>
');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (4,1077,N'Calendar',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Calendar>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (5,1079,N'CalendarItem',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.CalendarItem>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (6,1081,N'AnimalPicture',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.AnimalPicture>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (7,1088,N'Master',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = null;
}

@* the fun starts here *@

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<script
		src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>
		<script
		src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"   integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
		crossorigin="anonymous"></script>
		<script src="script/script.js"></script>

		<script src="script/map.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<title>Givskud zoo</title>
	</head>
	<body>
		
		<nav class="navbar fixed-top-lg navbar-icons-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="#">
					<img src="images/logo_full-color.svg" height="50" alt="">
				</a>
		</nav>
		
	</body>
	</html>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (10,1128,N'Animals',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

@* the fun starts here *@

');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (11,1237,N'Category',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Category>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "Master.cshtml";
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (12,1253,N'AnimalCollection',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.AnimalCollection>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = null;
}');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (13,1281,N'Maps',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Maps>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = null;
}');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [umbracoAudit] ON;
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (1,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2018-11-23 13:19:05.957'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating TourData, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (2,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2018-11-23 13:19:06.173'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (3,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:28:54.880'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (4,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:28:55.000'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (5,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:29:40.107'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (6,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:29:40.230'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (7,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:30:31.943'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (8,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:30:32.070'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (9,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:44:07.050'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (10,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 13:44:07.183'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (11,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 14:27:38.587'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (12,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-23 14:27:38.790'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (13,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:04:58.490'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (14,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:04:58.680'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (15,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:16:58.890'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (16,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:16:59.023'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (17,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:24:49.423'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (18,0,N'User "SYSTEM" ',N'::1',{ts '2018-11-25 12:24:49.570'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (19,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 07:19:17.700'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (20,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 07:19:17.953'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (21,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 11:49:59.127'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (22,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 11:49:59.437'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (23,0,N'User "SYSTEM" ',N'127.0.0.1',{ts '2018-12-04 12:50:04.200'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (24,0,N'User "SYSTEM" ',N'127.0.0.1',{ts '2018-12-04 12:50:04.643'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (25,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 13:17:40.067'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (26,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 13:17:40.460'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (27,0,N'User "SYSTEM" ',N'127.0.0.1',{ts '2018-12-04 13:19:10.713'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (28,0,N'User "SYSTEM" ',N'127.0.0.1',{ts '2018-12-04 13:19:10.997'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (29,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 13:33:41.393'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (30,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-04 13:33:41.587'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (31,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-05 20:58:21.893'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (32,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-05 20:58:22.207'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (33,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-05 22:35:04.567'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (34,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-05 22:35:04.853'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (35,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-06 11:50:57.660'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (36,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-06 11:50:58.907'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (37,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-06 12:58:12.287'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (38,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-06 12:58:12.633'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (39,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 08:18:37.097'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (40,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 08:18:37.380'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (41,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 11:08:56.247'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (42,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 11:08:56.517'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (43,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 11:43:21.687'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (44,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 11:43:21.957'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (45,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 12:07:03.187'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (46,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 12:07:03.363'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (47,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 14:04:02.180'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (48,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-10 14:04:02.527'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (73,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-28 11:14:23.663'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (74,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-28 11:14:23.807'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (75,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-28 11:55:01.657'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (76,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-28 11:55:01.753'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (77,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-02 16:09:18.963'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (78,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-02 16:09:19.103'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (79,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 12:53:03.410'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (80,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 12:53:03.653'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (81,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 16:35:33.547'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (82,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 16:35:33.757'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (83,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 18:01:31.190'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (84,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 18:01:31.433'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (85,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:10.147'},1,N'User "Uffe" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id, HasIdentity');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (86,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:10.707'},1,N'User "Uffe" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (87,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:11.067'},1,N'User "Uffe" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: editor');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (88,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:52.740'},2,N'User "Uffe" <uffe0505@edu.eal.dk>',N'umbraco/user/save',N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id, HasIdentity');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (89,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:53.170'},2,N'User "Uffe" <uffe0505@edu.eal.dk>',N'umbraco/user/save',N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (90,0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'::1',{ts '2019-01-03 18:02:53.433'},2,N'User "Uffe" <uffe0505@edu.eal.dk>',N'umbraco/user/save',N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: admin');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (91,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 20:14:37.013'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (92,0,N'User "SYSTEM" ',N'::1',{ts '2019-01-03 20:14:37.357'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (49,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 08:42:50.250'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (50,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 08:42:50.523'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (51,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 09:27:06.833'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (52,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 09:27:07.107'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (53,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:00:43.513'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (54,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:00:43.793'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (55,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:24:40.177'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (56,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:24:40.433'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (57,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:55:47.177'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (58,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-11 11:55:47.450'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (59,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 07:51:37.967'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (60,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 07:51:38.217'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (61,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 08:30:14.683'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (62,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 08:30:14.920'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (63,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 09:50:24.930'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (64,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 09:50:25.450'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (65,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 10:31:42.090'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (66,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-12 10:31:42.280'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (67,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-15 17:30:34.177'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (68,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-15 17:30:34.503'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (69,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-17 09:27:25.197'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (70,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-17 09:27:25.380'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (71,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-17 11:01:38.273'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (72,0,N'User "SYSTEM" ',N'::1',{ts '2018-12-17 11:01:38.463'},0,N'User "Jonathan Pabst Klemensen" <jonathan.klemensen@gmail.com>',N'umbraco/user/sign-in/login',N'login success');
GO
SET IDENTITY_INSERT [umbracoAudit] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] ON;
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (520,{ts '2019-01-03 12:56:24.917'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"224e9394-afb4-4a03-ba1c-bbe67fe151fb\",\"Id\":1279}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D3] 6D4E7B03F5F44B278830ED9DBCD42963',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (521,{ts '2019-01-03 12:58:48.850'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"224e9394-afb4-4a03-ba1c-bbe67fe151fb\",\"Id\":1279}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D4] 18A65C4057E14E2DBB27F80A4505B8E3',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (522,{ts '2019-01-03 12:59:54.010'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a2114139-dd71-4c1c-aba8-964bc189ddc6\",\"Id\":1280}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D5] 2DF142622B9E4A34857B8E4FE2C8B888',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (523,{ts '2019-01-03 13:02:47.477'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1281]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"maps\",\"Id\":1282,\"PropertyTypeIds\":[121,122],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D8] 29DB1F75AA9844E89130C161A473EAB6',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (524,{ts '2019-01-03 13:03:15.600'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"maps\",\"Id\":1282,\"PropertyTypeIds\":[121,122],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":true,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D9] 3654D4AADE244D209DDD9DB62BC281D1',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (525,{ts '2019-01-03 13:04:50.480'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1ae72568-4988-4905-a9e3-7df713193f06\",\"Id\":1283}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D11] 06B45D8E1B3F412E932A9DACA948477D',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (526,{ts '2019-01-03 13:05:05.687'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"41298891-104c-4485-933c-0521c342b5d6\",\"Id\":1284}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D12] 00B5C397DE65460E9C1A70824F2CA8CC',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (527,{ts '2019-01-03 13:05:39.030'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"41298891-104c-4485-933c-0521c342b5d6\",\"Id\":1284}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D14] 1F16302C8F934123BE9613629319EA7A',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (528,{ts '2019-01-03 13:06:17.687'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"maps\",\"Id\":1282,\"PropertyTypeIds\":[121,122],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D15] 4B0B3829FC7845ADAD8C2988FC941129',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (529,{ts '2019-01-03 13:07:59.153'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a2114139-dd71-4c1c-aba8-964bc189ddc6\",\"Id\":1280}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D17] BD2C648A938243F0B926E34129E4E20B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (530,{ts '2019-01-03 13:10:47.237'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a2114139-dd71-4c1c-aba8-964bc189ddc6\",\"Id\":1280}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D19] D87D30EA9D6B4663B2D1BA9F706D1126',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (531,{ts '2019-01-03 13:10:48.837'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a2114139-dd71-4c1c-aba8-964bc189ddc6\",\"Id\":1280}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D19] D87D30EA9D6B4663B2D1BA9F706D1126',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (532,{ts '2019-01-03 13:11:28.827'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1061,\"PropertyTypeIds\":[123],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D21] 0E297868035D4CD5A9A7D230EC5A783F',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (533,{ts '2019-01-03 13:12:26.733'},N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D22] 56A09389A1FD47AAABC0CE928871C330',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (534,{ts '2019-01-03 13:12:45.907'},N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D22] 56A09389A1FD47AAABC0CE928871C330',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (535,{ts '2019-01-03 13:13:45.747'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"224e9394-afb4-4a03-ba1c-bbe67fe151fb\",\"Id\":1279}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D23] 6EC6FC3686C7460B9C14119BB8B88BB2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (536,{ts '2019-01-03 13:17:30.893'},N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D25] 759589C9B0854FAEA22E2FF04CE955DE',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (537,{ts '2019-01-03 13:18:33.673'},N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1062]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D26] D929657A9F1344449E21D3DECDD9F615',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (538,{ts '2019-01-03 13:21:46.330'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"224e9394-afb4-4a03-ba1c-bbe67fe151fb\",\"Id\":1279}]"}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P9548/D26] D929657A9F1344449E21D3DECDD9F615',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (539,{ts '2019-01-03 18:02:11.587'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P15368/D3] E602E5F6EDF2424D8220AE4B202734ED',3);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (540,{ts '2019-01-03 18:02:54.137'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[2]","JsonIdCount":1,"JsonPayload":null}]',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT [P15368/D3] E602E5F6EDF2424D8220AE4B202734ED',3);
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [umbracoConsent] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoLock] ON;
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (-331,-1,N'Servers');
GO
SET IDENTITY_INSERT [umbracoLock] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,0,{ts '2018-11-23 14:25:42.120'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (2,0,1061,{ts '2018-11-23 14:25:42.383'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (3,0,0,{ts '2018-11-23 14:26:50.727'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (4,0,0,{ts '2018-11-23 14:31:49.390'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (5,0,1066,{ts '2018-11-23 14:31:49.513'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (6,0,0,{ts '2018-11-23 14:32:36.907'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (7,0,1068,{ts '2018-11-23 14:34:28.800'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (8,0,0,{ts '2018-11-23 14:34:50.510'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (9,0,0,{ts '2018-11-23 14:35:13.367'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (10,0,1071,{ts '2018-11-23 14:35:17.103'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (11,0,1071,{ts '2018-11-23 14:44:32.860'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (12,0,0,{ts '2018-11-23 14:45:07.867'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (13,0,0,{ts '2018-11-23 14:45:27.970'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (14,0,1074,{ts '2018-11-23 14:45:30.177'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (15,0,-1,{ts '2018-11-23 14:51:26.077'},N'Delete',N'Delete Content of Types 1066 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (16,0,1066,{ts '2018-11-23 14:51:26.143'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (17,0,0,{ts '2018-11-23 14:51:36.357'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (18,0,1076,{ts '2018-11-23 14:51:36.590'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (19,0,0,{ts '2018-11-23 14:51:51.437'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (20,0,1078,{ts '2018-11-23 14:51:51.577'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (21,0,0,{ts '2018-11-23 14:52:03.937'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (22,0,1080,{ts '2018-11-23 14:52:04.070'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (23,0,0,{ts '2018-11-23 14:52:27.807'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (24,0,1082,{ts '2018-11-23 14:52:28.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (25,0,0,{ts '2018-11-23 14:55:57.523'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (26,0,1076,{ts '2018-11-23 14:56:54.780'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (27,0,0,{ts '2018-11-23 14:57:32.587'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (28,0,1082,{ts '2018-11-23 14:57:39.017'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (29,0,1078,{ts '2018-11-23 15:00:13.657'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (30,0,1080,{ts '2018-11-23 15:03:03.287'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (31,0,1068,{ts '2018-11-23 15:03:09.597'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (32,0,1068,{ts '2018-11-23 15:03:13.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (33,0,1062,{ts '2018-11-25 13:22:06.117'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (34,0,1060,{ts '2018-11-25 13:22:19.293'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (35,0,1060,{ts '2018-11-25 13:22:27.790'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (36,0,1068,{ts '2018-11-25 13:26:17.697'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (37,0,1071,{ts '2018-11-25 13:26:37.353'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (38,0,1061,{ts '2018-11-25 13:26:47.533'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (39,0,1078,{ts '2018-11-25 13:26:57.230'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (40,0,1080,{ts '2018-11-25 13:27:04.133'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (41,0,1082,{ts '2018-11-25 13:27:39.247'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (42,0,1061,{ts '2018-11-25 13:28:24.877'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (43,0,0,{ts '2018-11-25 13:29:01.397'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (44,0,1076,{ts '2018-11-25 13:30:29.537'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (45,0,0,{ts '2018-11-25 13:30:55.777'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (46,0,1076,{ts '2018-11-25 13:31:12.653'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (47,0,0,{ts '2018-11-25 13:31:53.213'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (48,0,1076,{ts '2018-11-25 13:36:28.167'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (49,0,0,{ts '2018-12-04 12:50:58.633'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (50,0,1060,{ts '2018-12-04 12:51:07.943'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (51,0,1065,{ts '2018-12-04 12:51:12.340'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (52,0,1079,{ts '2018-12-04 12:51:18.577'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (53,0,1077,{ts '2018-12-04 12:51:23.730'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (54,0,1081,{ts '2018-12-04 12:51:29.010'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (55,0,1075,{ts '2018-12-04 12:51:38.213'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (56,0,1088,{ts '2018-12-04 12:58:29.727'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (57,0,-1,{ts '2018-12-04 13:01:46.723'},N'Save',N'Save PartialView performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (58,0,1088,{ts '2018-12-04 13:04:16.217'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (59,0,-1,{ts '2018-12-04 14:34:01.403'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (60,0,1062,{ts '2018-12-04 14:39:11.687'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (61,0,1062,{ts '2018-12-05 22:01:04.007'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (62,0,-1,{ts '2018-12-05 22:19:25.357'},N'Save',N'Save PartialView performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (63,0,1062,{ts '2018-12-05 22:21:00.933'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (64,0,1062,{ts '2018-12-05 22:41:57.080'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (65,0,1086,{ts '2018-12-05 22:50:08.750'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (66,0,1086,{ts '2018-12-05 22:51:13.637'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (67,0,1062,{ts '2018-12-05 22:51:29.427'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (68,0,1062,{ts '2018-12-05 23:06:06.550'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (69,0,1062,{ts '2018-12-05 23:13:04.533'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (70,0,0,{ts '2018-12-05 23:36:10.040'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (71,0,0,{ts '2018-12-05 23:36:35.720'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (72,0,0,{ts '2018-12-05 23:37:10.673'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (73,0,0,{ts '2018-12-05 23:37:36.553'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (74,0,1076,{ts '2018-12-05 23:37:40.403'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (75,0,0,{ts '2018-12-05 23:38:23.410'},N'New',N'Media ''givskudzoo_alpaka.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (76,0,0,{ts '2018-12-05 23:38:23.823'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (77,0,1086,{ts '2018-12-05 23:38:40.677'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (78,0,1076,{ts '2018-12-05 23:48:18.523'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (79,0,1076,{ts '2018-12-05 23:48:24.960'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (80,0,1086,{ts '2018-12-05 23:51:43.203'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (81,0,1086,{ts '2018-12-05 23:51:54.390'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (82,0,1076,{ts '2018-12-05 23:53:04.127'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (83,0,1086,{ts '2018-12-05 23:55:12.660'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (84,0,0,{ts '2018-12-05 23:57:59.447'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (85,0,1095,{ts '2018-12-05 23:57:59.850'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (86,0,1095,{ts '2018-12-05 23:58:15.560'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (87,0,1095,{ts '2018-12-05 23:58:28.043'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (88,0,1076,{ts '2018-12-05 23:58:39.287'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (89,0,-1,{ts '2018-12-06 00:00:54.717'},N'Delete',N'Delete Content of Types 1095 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (90,0,1095,{ts '2018-12-06 00:00:54.813'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (91,0,1096,{ts '2018-12-06 00:01:23.660'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (92,0,1096,{ts '2018-12-06 00:01:28.623'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (93,0,-1,{ts '2018-12-06 00:03:14.673'},N'Delete',N'Delete Content of Types 1096 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (94,0,1096,{ts '2018-12-06 00:03:14.760'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (95,0,0,{ts '2018-12-06 00:05:36.810'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (96,0,1098,{ts '2018-12-06 00:05:37.977'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (97,0,1098,{ts '2018-12-06 00:06:12.073'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (98,0,0,{ts '2018-12-06 00:18:59.660'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (99,0,0,{ts '2018-12-06 00:21:22.827'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (100,0,1076,{ts '2018-12-06 00:21:29.957'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (101,0,0,{ts '2018-12-06 00:22:40.497'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (102,0,0,{ts '2018-12-06 00:22:55.017'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (103,0,0,{ts '2018-12-06 00:23:10.800'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (104,0,1076,{ts '2018-12-06 00:23:18.497'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (105,0,1086,{ts '2018-12-06 00:29:30.970'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (106,0,0,{ts '2018-12-06 00:31:15.127'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (208,0,0,{ts '2018-12-10 09:28:19.303'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (209,0,1121,{ts '2018-12-10 09:29:42.470'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (210,0,1123,{ts '2018-12-10 09:30:55.160'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (211,0,1123,{ts '2018-12-10 09:31:23.303'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (212,0,0,{ts '2018-12-10 09:39:55.300'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (213,0,1121,{ts '2018-12-10 09:40:26.153'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (214,0,1123,{ts '2018-12-10 09:47:25.340'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (215,0,0,{ts '2018-12-10 09:57:01.843'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (216,0,0,{ts '2018-12-10 09:57:24.373'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (217,0,0,{ts '2018-12-10 09:57:24.403'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (218,0,-1,{ts '2018-12-10 09:58:18.297'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (219,0,1121,{ts '2018-12-10 09:58:18.313'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (220,0,0,{ts '2018-12-10 09:59:04.897'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (221,0,0,{ts '2018-12-10 09:59:47.023'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (222,0,1121,{ts '2018-12-10 10:00:18.157'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (223,0,0,{ts '2018-12-10 10:00:50.530'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (224,0,0,{ts '2018-12-10 10:01:06.263'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (225,0,1121,{ts '2018-12-10 10:01:45.400'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (226,0,1123,{ts '2018-12-10 10:07:56.897'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (227,0,1123,{ts '2018-12-10 10:09:32.543'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (228,0,0,{ts '2018-12-10 10:13:32.613'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (229,0,0,{ts '2018-12-10 10:13:49.040'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (230,0,0,{ts '2018-12-10 10:13:49.070'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (231,0,0,{ts '2018-12-10 10:13:49.090'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (232,0,0,{ts '2018-12-10 10:13:49.137'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (233,0,0,{ts '2018-12-10 10:13:49.167'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (234,0,1121,{ts '2018-12-10 10:14:08.163'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (235,0,0,{ts '2018-12-10 10:16:17.220'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (236,0,1121,{ts '2018-12-10 10:17:01.587'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (237,0,1123,{ts '2018-12-10 10:18:07.757'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (238,0,1123,{ts '2018-12-10 10:22:26.863'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (239,0,0,{ts '2018-12-10 10:29:06.600'},N'New',N'Media ''alpaka6.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (240,0,0,{ts '2018-12-10 10:29:06.847'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (241,0,0,{ts '2018-12-10 10:30:10.107'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (242,0,1162,{ts '2018-12-10 10:30:35.593'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (243,0,1086,{ts '2018-12-10 10:33:34.173'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (244,0,1086,{ts '2018-12-10 10:33:36.593'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (245,0,1086,{ts '2018-12-10 10:34:01.987'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (246,0,1086,{ts '2018-12-10 10:34:05.563'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (247,0,1162,{ts '2018-12-10 10:35:10.387'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (248,0,1162,{ts '2018-12-10 10:35:12.980'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (249,0,1121,{ts '2018-12-10 11:03:09.080'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (250,0,1122,{ts '2018-12-10 11:04:58.923'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (251,0,1122,{ts '2018-12-10 11:04:58.973'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (252,0,1122,{ts '2018-12-10 11:04:59.083'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (253,0,1122,{ts '2018-12-10 11:04:59.133'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (254,0,1162,{ts '2018-12-10 11:21:13.253'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (255,0,1162,{ts '2018-12-10 11:21:13.267'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (256,0,1162,{ts '2018-12-10 11:21:13.980'},N'Delete',N'Trashed content with Id: 1162 related to original parent content with Id: 1086');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (257,0,1086,{ts '2018-12-10 11:31:46.823'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (258,0,1127,{ts '2018-12-10 11:32:32.597'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (654,0,1279,{ts '2019-01-03 14:21:46.127'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (655,0,-1,{ts '2019-01-03 21:15:24.267'},N'PackagerInstall',N'Package ''Export SQL Server Compact'' installed. Package guid: bf31305f-ae50-400c-9fdb-9ed19cae73be');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (656,0,-1,{ts '2019-01-03 21:15:37.457'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (604,0,1263,{ts '2018-12-28 13:25:09.060'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (605,0,1263,{ts '2018-12-28 13:25:23.460'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (606,0,0,{ts '2018-12-28 13:28:17.227'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (607,0,0,{ts '2018-12-28 13:30:46.777'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (608,0,1269,{ts '2018-12-28 13:30:51.910'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (609,0,1268,{ts '2018-12-28 13:31:15.057'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (610,0,1268,{ts '2018-12-28 13:31:19.263'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (611,0,1268,{ts '2018-12-28 13:32:13.650'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (612,0,1268,{ts '2018-12-28 13:34:44.843'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (613,0,1268,{ts '2018-12-28 13:36:12.027'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (614,0,0,{ts '2018-12-28 13:42:41.613'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (615,0,0,{ts '2018-12-28 13:42:52.893'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (616,0,0,{ts '2018-12-28 13:42:52.990'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (617,0,0,{ts '2018-12-28 13:42:53.047'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (618,0,0,{ts '2018-12-28 13:44:17.997'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (619,0,0,{ts '2018-12-28 13:44:18.067'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (620,0,0,{ts '2018-12-28 13:45:28.083'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (621,0,0,{ts '2018-12-28 13:45:39.097'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (622,0,1264,{ts '2018-12-28 13:45:52.477'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (623,0,-1,{ts '2018-12-28 13:51:23.933'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (624,0,1264,{ts '2018-12-28 13:51:23.947'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (625,0,1268,{ts '2018-12-28 13:52:17.363'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (626,0,1263,{ts '2018-12-28 14:02:25.213'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (627,0,0,{ts '2018-12-28 14:17:04.180'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (628,0,1269,{ts '2018-12-28 14:17:19.200'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (629,0,1269,{ts '2018-12-28 14:17:19.207'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (630,0,1269,{ts '2018-12-28 14:17:19.453'},N'Delete',N'Trashed content with Id: 1269 related to original parent content with Id: 1268');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (631,0,1268,{ts '2018-12-28 14:17:40.683'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (632,0,1268,{ts '2018-12-28 14:18:32.710'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (633,0,1268,{ts '2018-12-28 14:18:38.110'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (634,0,0,{ts '2019-01-03 13:56:24.750'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (635,0,1279,{ts '2019-01-03 13:58:48.643'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (636,0,0,{ts '2019-01-03 13:59:53.750'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (637,0,0,{ts '2019-01-03 14:02:46.293'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (638,0,1282,{ts '2019-01-03 14:02:46.887'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (639,0,-1,{ts '2019-01-03 14:03:14.803'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (640,0,1282,{ts '2019-01-03 14:03:14.817'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (641,0,0,{ts '2019-01-03 14:04:50.067'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (642,0,0,{ts '2019-01-03 14:05:05.307'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (643,0,1284,{ts '2019-01-03 14:05:38.767'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (644,0,1282,{ts '2019-01-03 14:06:16.983'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (645,0,1280,{ts '2019-01-03 14:07:58.730'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (646,0,1280,{ts '2019-01-03 14:10:46.967'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (647,0,1280,{ts '2019-01-03 14:10:48.650'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (648,0,1061,{ts '2019-01-03 14:11:28.217'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (649,0,1062,{ts '2019-01-03 14:12:26.210'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (650,0,1062,{ts '2019-01-03 14:12:45.403'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (651,0,1279,{ts '2019-01-03 14:13:45.450'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (652,0,1062,{ts '2019-01-03 14:17:30.220'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (653,0,1062,{ts '2019-01-03 14:18:32.463'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (107,0,0,{ts '2018-12-06 00:32:03.390'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (108,0,0,{ts '2018-12-06 00:32:15.273'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (109,0,1076,{ts '2018-12-06 00:32:27.663'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (110,0,0,{ts '2018-12-06 00:35:56.917'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (111,0,0,{ts '2018-12-06 00:36:22.930'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (112,0,0,{ts '2018-12-06 00:36:58.563'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (113,0,1076,{ts '2018-12-06 00:40:11.527'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (114,0,0,{ts '2018-12-06 00:41:01.300'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (115,0,0,{ts '2018-12-06 00:41:20.050'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (116,0,1112,{ts '2018-12-06 00:41:50.940'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (117,0,0,{ts '2018-12-06 00:43:38.903'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (118,0,1076,{ts '2018-12-06 00:43:45.927'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (119,0,1086,{ts '2018-12-06 00:45:38.397'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (120,0,1113,{ts '2018-12-06 00:49:03.270'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (121,0,1076,{ts '2018-12-06 00:49:22.690'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (122,0,1113,{ts '2018-12-06 00:49:49.907'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (123,0,1076,{ts '2018-12-06 00:49:58.533'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (124,0,1113,{ts '2018-12-06 00:51:48.147'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (125,0,1076,{ts '2018-12-06 00:51:52.577'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (126,0,1086,{ts '2018-12-06 00:52:20.403'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (127,0,1076,{ts '2018-12-06 01:06:05.537'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (128,0,0,{ts '2018-12-06 01:13:19.347'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (129,0,1114,{ts '2018-12-06 01:14:44.807'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (130,0,1076,{ts '2018-12-06 01:14:51.910'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (131,0,-1,{ts '2018-12-06 01:18:32.793'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (132,0,1076,{ts '2018-12-06 01:18:32.823'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (133,0,0,{ts '2018-12-06 01:20:10.583'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (134,0,0,{ts '2018-12-06 01:21:49.373'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (135,0,0,{ts '2018-12-06 01:21:49.930'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (136,0,0,{ts '2018-12-06 01:22:07.017'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (137,0,0,{ts '2018-12-06 01:23:22.870'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (138,0,0,{ts '2018-12-06 01:23:47.990'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (139,0,1121,{ts '2018-12-06 01:25:48.263'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (140,0,0,{ts '2018-12-06 01:27:12.923'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (141,0,1121,{ts '2018-12-06 01:27:22.290'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (142,0,1121,{ts '2018-12-06 01:27:28.450'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (143,0,1076,{ts '2018-12-06 01:28:33.647'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (144,0,0,{ts '2018-12-06 01:31:11.400'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (145,0,0,{ts '2018-12-06 01:36:51.183'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (146,0,0,{ts '2018-12-06 01:37:13.037'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (147,0,0,{ts '2018-12-06 01:37:52.893'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (148,0,0,{ts '2018-12-06 01:39:29.000'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (149,0,1076,{ts '2018-12-06 01:39:34.727'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (150,0,1086,{ts '2018-12-06 01:41:16.820'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (151,0,1094,{ts '2018-12-06 01:45:29.723'},N'Delete',N'Delete Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (152,0,1097,{ts '2018-12-06 01:45:34.743'},N'Delete',N'Delete Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (153,0,0,{ts '2018-12-06 01:45:56.390'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (154,0,1076,{ts '2018-12-06 02:11:19.493'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (155,0,1062,{ts '2018-12-06 02:14:52.937'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (156,0,1062,{ts '2018-12-06 02:26:08.467'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (157,0,-1,{ts '2018-12-06 02:27:44.290'},N'Delete',N'Delete Content of Types 1098 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (158,0,1098,{ts '2018-12-06 02:27:44.360'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (159,0,1076,{ts '2018-12-06 02:51:51.987'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (160,0,1076,{ts '2018-12-06 02:52:53.417'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (161,0,1127,{ts '2018-12-06 02:56:04.317'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (162,0,1127,{ts '2018-12-06 02:56:09.157'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (163,0,1127,{ts '2018-12-06 02:56:26.987'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (164,0,1061,{ts '2018-12-06 03:01:42.427'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (165,0,1086,{ts '2018-12-06 03:03:59.363'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (166,0,1086,{ts '2018-12-06 03:04:08.693'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (167,0,0,{ts '2018-12-06 03:05:14.447'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (168,0,1086,{ts '2018-12-06 03:06:11.173'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (169,0,-1,{ts '2018-12-06 03:13:34.070'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (170,0,1121,{ts '2018-12-06 03:13:34.080'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (171,0,0,{ts '2018-12-06 03:19:15.120'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (172,0,0,{ts '2018-12-06 03:19:36.000'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (173,0,0,{ts '2018-12-06 03:19:45.567'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (174,0,0,{ts '2018-12-06 03:19:46.713'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (175,0,0,{ts '2018-12-06 03:19:46.803'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (176,0,1134,{ts '2018-12-06 03:20:34.027'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (177,0,1134,{ts '2018-12-06 03:20:36.667'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (178,0,0,{ts '2018-12-06 12:52:04.113'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (179,0,0,{ts '2018-12-06 12:52:47.043'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (180,0,0,{ts '2018-12-06 12:53:05.317'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (181,0,0,{ts '2018-12-06 12:53:05.403'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (182,0,1076,{ts '2018-12-06 12:53:31.613'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (183,0,1123,{ts '2018-12-06 12:54:27.317'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (184,0,1123,{ts '2018-12-06 12:55:50.563'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (185,0,1086,{ts '2018-12-06 12:56:33.547'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (186,0,1076,{ts '2018-12-06 13:00:03.493'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (187,0,1086,{ts '2018-12-06 13:09:12.073'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (188,0,-1,{ts '2018-12-06 13:20:57.947'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (189,0,1086,{ts '2018-12-06 13:23:05.943'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (190,0,1086,{ts '2018-12-06 13:23:28.413'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (191,0,1062,{ts '2018-12-06 13:34:54.400'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (192,0,1085,{ts '2018-12-06 13:35:17.307'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (193,0,1085,{ts '2018-12-06 13:35:17.317'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (194,0,1085,{ts '2018-12-06 13:35:17.963'},N'Delete',N'Trashed content with Id: 1085 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (195,0,1087,{ts '2018-12-06 13:39:43.557'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (196,0,1087,{ts '2018-12-06 13:39:43.567'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (197,0,1087,{ts '2018-12-06 13:39:44.100'},N'Delete',N'Trashed content with Id: 1087 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (198,0,0,{ts '2018-12-06 13:59:44.933'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (199,0,0,{ts '2018-12-06 14:00:04.187'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (200,0,0,{ts '2018-12-06 14:00:36.043'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (201,0,0,{ts '2018-12-06 14:00:56.557'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (202,0,1080,{ts '2018-12-06 14:01:37.823'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (203,0,1080,{ts '2018-12-06 14:02:49.927'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (204,0,0,{ts '2018-12-06 14:03:55.163'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (205,0,1080,{ts '2018-12-06 14:20:51.103'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (206,0,1080,{ts '2018-12-06 14:21:55.640'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (207,0,0,{ts '2018-12-10 09:28:01.883'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (259,0,1076,{ts '2018-12-10 11:32:35.030'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (260,0,1076,{ts '2018-12-10 12:11:01.757'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (261,0,1076,{ts '2018-12-10 12:11:08.860'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (262,0,1162,{ts '2018-12-10 13:17:29.403'},N'Delete',N'Delete Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (263,0,1123,{ts '2018-12-10 13:17:29.537'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (264,0,1123,{ts '2018-12-10 13:17:29.553'},N'Delete',N'Delete Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (265,0,1129,{ts '2018-12-10 13:17:29.677'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (266,0,1129,{ts '2018-12-10 13:17:29.693'},N'Delete',N'Delete Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (267,0,-1,{ts '2018-12-10 13:17:29.693'},N'Delete',N'Delete Content of Types 1121 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (268,0,1121,{ts '2018-12-10 13:17:29.723'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (269,0,1163,{ts '2018-12-10 13:18:15.023'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (270,0,0,{ts '2018-12-10 13:20:43.427'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (271,0,0,{ts '2018-12-10 13:21:02.503'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (272,0,1163,{ts '2018-12-10 13:21:25.387'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (273,0,0,{ts '2018-12-10 13:22:15.107'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (274,0,0,{ts '2018-12-10 13:22:29.907'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (275,0,0,{ts '2018-12-10 13:23:17.460'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (276,0,0,{ts '2018-12-10 13:23:32.903'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (277,0,0,{ts '2018-12-10 13:23:33.050'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (278,0,1163,{ts '2018-12-10 13:24:22.093'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (279,0,1076,{ts '2018-12-10 13:27:04.343'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (280,0,1163,{ts '2018-12-10 13:29:05.503'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (281,0,0,{ts '2018-12-10 13:40:46.607'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (282,0,1086,{ts '2018-12-10 13:41:16.267'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (283,0,1076,{ts '2018-12-10 13:48:53.400'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (284,0,1076,{ts '2018-12-10 13:49:33.523'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (285,0,0,{ts '2018-12-10 13:58:48.410'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (286,0,1086,{ts '2018-12-10 13:59:11.500'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (287,0,0,{ts '2018-12-10 13:59:54.787'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (288,0,1086,{ts '2018-12-10 14:00:35.170'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (289,0,1086,{ts '2018-12-10 14:00:50.157'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (290,0,0,{ts '2018-12-10 14:01:14.277'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (291,0,1086,{ts '2018-12-10 14:01:31.943'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (292,0,1076,{ts '2018-12-10 14:04:32.447'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (293,0,1163,{ts '2018-12-10 14:12:12.213'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (294,0,0,{ts '2018-12-10 14:16:04.633'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (295,0,0,{ts '2018-12-10 14:16:05.717'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (296,0,1163,{ts '2018-12-10 14:17:08.407'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (297,0,1174,{ts '2018-12-10 14:18:03.983'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (298,0,1174,{ts '2018-12-10 14:19:13.063'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (299,0,0,{ts '2018-12-10 14:19:44.787'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (300,0,1163,{ts '2018-12-10 14:20:46.790'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (301,0,1174,{ts '2018-12-10 14:21:24.677'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (302,0,0,{ts '2018-12-10 14:21:44.393'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (303,0,1163,{ts '2018-12-10 14:22:38.320'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (304,0,1086,{ts '2018-12-10 14:29:10.203'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (305,0,1174,{ts '2018-12-10 14:31:28.597'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (306,0,1086,{ts '2018-12-10 14:33:00.827'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (307,0,1174,{ts '2018-12-10 14:33:01.017'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (308,0,1173,{ts '2018-12-10 14:33:01.143'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (309,0,1172,{ts '2018-12-10 14:33:01.233'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (310,0,1171,{ts '2018-12-10 14:33:01.320'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (555,0,1061,{ts '2018-12-12 11:48:49.157'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (556,0,1167,{ts '2018-12-17 10:33:29.137'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (557,0,1167,{ts '2018-12-17 10:33:30.983'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (558,0,1163,{ts '2018-12-17 10:34:00.507'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (559,0,1068,{ts '2018-12-17 10:34:33.670'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (560,0,1163,{ts '2018-12-17 10:35:08.347'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (561,0,1163,{ts '2018-12-17 10:36:02.860'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (562,0,1163,{ts '2018-12-17 10:38:00.743'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (563,0,1163,{ts '2018-12-17 10:38:14.317'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (564,0,1068,{ts '2018-12-17 10:39:46.403'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (565,0,1163,{ts '2018-12-17 10:42:30.967'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (566,0,1234,{ts '2018-12-17 10:45:20.197'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (567,0,1234,{ts '2018-12-17 10:45:20.210'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (568,0,1234,{ts '2018-12-17 10:45:20.637'},N'Delete',N'Trashed content with Id: 1234 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (569,0,1183,{ts '2018-12-17 10:45:24.723'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (570,0,0,{ts '2018-12-17 10:47:06.157'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (571,0,1183,{ts '2018-12-17 10:48:17.203'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (572,0,1062,{ts '2018-12-17 10:48:27.013'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (573,0,-1,{ts '2018-12-17 10:54:59.007'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (574,0,1068,{ts '2018-12-17 10:54:59.023'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (575,0,-1,{ts '2018-12-17 10:58:49.640'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (576,0,1068,{ts '2018-12-17 10:58:49.657'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (577,0,1143,{ts '2018-12-17 12:06:32.430'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (578,0,1143,{ts '2018-12-17 12:06:32.443'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (579,0,1143,{ts '2018-12-17 12:06:32.927'},N'Delete',N'Trashed content with Id: 1143 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (580,0,-1,{ts '2018-12-17 12:06:43.903'},N'Delete',N'Delete Content of Types 1078 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (581,0,1078,{ts '2018-12-17 12:06:43.953'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (582,0,1143,{ts '2018-12-17 12:07:09.193'},N'Delete',N'Delete Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (583,0,-1,{ts '2018-12-17 12:07:09.203'},N'Delete',N'Delete Content of Types 1080 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (584,0,1080,{ts '2018-12-17 12:07:09.233'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (585,0,0,{ts '2018-12-17 12:12:32.823'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (586,0,1261,{ts '2018-12-17 12:12:45.737'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (587,0,1261,{ts '2018-12-17 12:15:37.183'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (588,0,-1,{ts '2018-12-28 12:58:05.667'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (589,0,-1,{ts '2018-12-28 12:59:20.593'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (590,0,-1,{ts '2018-12-28 12:59:20.830'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (591,0,1062,{ts '2018-12-28 13:03:43.277'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (592,0,1061,{ts '2018-12-28 13:06:30.917'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (593,0,-1,{ts '2018-12-28 13:12:02.247'},N'Delete',N'Delete Content of Types 1262 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (594,0,1262,{ts '2018-12-28 13:12:02.293'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (595,0,-1,{ts '2018-12-28 13:12:21.817'},N'Delete',N'Delete Content of Types 1261 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (596,0,1261,{ts '2018-12-28 13:12:21.883'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (597,0,-1,{ts '2018-12-28 13:13:32.390'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (598,0,-1,{ts '2018-12-28 13:13:32.627'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (599,0,-1,{ts '2018-12-28 13:14:16.467'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (600,0,1061,{ts '2018-12-28 13:16:21.730'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (601,0,0,{ts '2018-12-28 13:24:46.560'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (602,0,0,{ts '2018-12-28 13:24:57.467'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (603,0,0,{ts '2018-12-28 13:24:57.523'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (311,0,1086,{ts '2018-12-10 14:33:01.360'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (312,0,1086,{ts '2018-12-10 14:33:02.430'},N'Delete',N'Trashed content with Id: 1086 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (313,0,1174,{ts '2018-12-10 14:33:02.743'},N'Delete',N'Trashed content with Id: 1174 related to original parent content with Id: 1086');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (314,0,1173,{ts '2018-12-10 14:33:03.020'},N'Delete',N'Trashed content with Id: 1173 related to original parent content with Id: 1086');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (315,0,1172,{ts '2018-12-10 14:33:03.273'},N'Delete',N'Trashed content with Id: 1172 related to original parent content with Id: 1086');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (316,0,1171,{ts '2018-12-10 14:33:03.533'},N'Delete',N'Trashed content with Id: 1171 related to original parent content with Id: 1086');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (317,0,0,{ts '2018-12-10 14:33:45.067'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (318,0,0,{ts '2018-12-10 14:33:57.527'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (319,0,1180,{ts '2018-12-10 14:36:05.817'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (320,0,1180,{ts '2018-12-10 14:37:40.580'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (321,0,1127,{ts '2018-12-10 14:43:09.353'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (322,0,1076,{ts '2018-12-10 14:52:42.007'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (323,0,1076,{ts '2018-12-10 14:53:43.037'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (324,0,1180,{ts '2018-12-10 15:00:30.347'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (325,0,1179,{ts '2018-12-10 15:04:13.787'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (326,0,0,{ts '2018-12-10 15:04:52.787'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (327,0,1181,{ts '2018-12-10 15:04:55.667'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (328,0,1181,{ts '2018-12-10 15:09:26.980'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (329,0,1181,{ts '2018-12-10 15:09:26.990'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (330,0,1181,{ts '2018-12-10 15:09:27.677'},N'Delete',N'Trashed content with Id: 1181 related to original parent content with Id: 1179');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (331,0,1180,{ts '2018-12-10 15:09:50.920'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (332,0,1061,{ts '2018-12-10 15:11:11.690'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (333,0,0,{ts '2018-12-10 15:13:05.013'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (334,0,1179,{ts '2018-12-10 15:14:59.687'},N'RollBack',N'Content rollback performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (335,0,1179,{ts '2018-12-10 15:14:59.903'},N'RollBack',N'Version rolled back to revision ''56af003d-1946-479f-96c8-a1a66bb07ec2''');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (336,0,1180,{ts '2018-12-10 15:15:21.797'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (337,0,1180,{ts '2018-12-10 15:15:21.807'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (338,0,1180,{ts '2018-12-10 15:15:21.867'},N'Delete',N'Trashed content with Id: 1180 related to original parent content with Id: 1179');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (339,0,1182,{ts '2018-12-10 15:22:14.357'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (340,0,1182,{ts '2018-12-10 15:22:14.370'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (341,0,1182,{ts '2018-12-10 15:22:14.390'},N'Delete',N'Trashed content with Id: 1182 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (342,0,1179,{ts '2018-12-10 15:22:19.600'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (343,0,1179,{ts '2018-12-10 15:22:19.607'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (344,0,1179,{ts '2018-12-10 15:22:19.620'},N'Delete',N'Trashed content with Id: 1179 related to original parent content with Id: 1062');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (345,0,0,{ts '2018-12-10 15:22:32.827'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (346,0,0,{ts '2018-12-10 15:23:40.817'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (347,0,1183,{ts '2018-12-10 15:27:35.623'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (348,0,0,{ts '2018-12-10 15:29:31.340'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (349,0,1183,{ts '2018-12-10 15:29:50.097'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (350,0,0,{ts '2018-12-10 15:30:25.020'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (351,0,1186,{ts '2018-12-10 15:31:02.607'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (352,0,1186,{ts '2018-12-10 15:31:02.613'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (353,0,1186,{ts '2018-12-10 15:31:02.637'},N'Delete',N'Trashed content with Id: 1186 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (354,0,1185,{ts '2018-12-10 15:31:06.603'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (355,0,1185,{ts '2018-12-10 15:31:06.613'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (356,0,1185,{ts '2018-12-10 15:31:06.640'},N'Delete',N'Trashed content with Id: 1185 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (357,0,1184,{ts '2018-12-10 15:31:06.967'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (358,0,1184,{ts '2018-12-10 15:31:06.977'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (359,0,1184,{ts '2018-12-10 15:31:07.003'},N'Delete',N'Trashed content with Id: 1184 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (360,0,1062,{ts '2018-12-10 15:31:23.797'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (361,0,1062,{ts '2018-12-10 15:31:26.020'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (362,0,-20,{ts '2018-12-10 15:32:12.183'},N'Delete',N'Empty Content Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (363,0,1076,{ts '2018-12-10 15:32:35.927'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (364,0,0,{ts '2018-12-10 15:33:34.110'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (365,0,0,{ts '2018-12-10 15:35:40.443'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (366,0,1188,{ts '2018-12-10 15:36:07.477'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (367,0,1188,{ts '2018-12-10 15:36:07.490'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (368,0,1188,{ts '2018-12-10 15:36:08.540'},N'Delete',N'Trashed content with Id: 1188 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (369,0,1183,{ts '2018-12-10 15:36:35.547'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (370,0,0,{ts '2018-12-11 09:46:08.573'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (371,0,1183,{ts '2018-12-11 09:46:22.053'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (372,0,0,{ts '2018-12-11 09:55:19.360'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (373,0,0,{ts '2018-12-11 09:55:35.860'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (374,0,0,{ts '2018-12-11 09:55:35.940'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (375,0,0,{ts '2018-12-11 09:55:35.973'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (376,0,1163,{ts '2018-12-11 09:56:32.143'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (377,0,1075,{ts '2018-12-11 09:57:32.880'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (378,0,1189,{ts '2018-12-11 09:58:23.853'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (379,0,1163,{ts '2018-12-11 10:04:00.833'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (380,0,1187,{ts '2018-12-11 10:04:53.723'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (381,0,0,{ts '2018-12-11 10:32:16.127'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (382,0,1183,{ts '2018-12-11 10:32:59.190'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (383,0,0,{ts '2018-12-11 10:33:52.813'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (384,0,1183,{ts '2018-12-11 10:34:07.673'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (385,0,1167,{ts '2018-12-11 12:01:23.973'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (386,0,1167,{ts '2018-12-11 12:01:25.660'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (387,0,1163,{ts '2018-12-11 12:02:16.017'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (388,0,1187,{ts '2018-12-11 12:03:19.533'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (389,0,1187,{ts '2018-12-11 12:03:23.847'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (390,0,0,{ts '2018-12-11 12:56:29.840'},N'New',N'Media ''blpandet-dvrgara.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (391,0,0,{ts '2018-12-11 12:56:30.077'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (392,0,0,{ts '2018-12-11 12:56:39.403'},N'New',N'Media ''alpaka4.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (393,0,0,{ts '2018-12-11 12:56:39.530'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (394,0,0,{ts '2018-12-11 12:56:40.247'},N'New',N'Media ''givskudzoo_flamingo.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (395,0,0,{ts '2018-12-11 12:56:40.377'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (396,0,0,{ts '2018-12-11 12:56:41.020'},N'New',N'Media ''givskudzoo_kamelflok_liggende_anlaeg_0769.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (397,0,0,{ts '2018-12-11 12:56:41.140'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (398,0,0,{ts '2018-12-11 12:56:41.833'},N'New',N'Media ''lion.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (399,0,0,{ts '2018-12-11 12:56:41.947'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (400,0,0,{ts '2018-12-11 12:56:42.767'},N'New',N'Media ''park-opening.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (401,0,0,{ts '2018-12-11 12:56:42.920'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (402,0,0,{ts '2018-12-11 12:56:43.620'},N'New',N'Media ''soldaterara.jpg'' was created');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (403,0,0,{ts '2018-12-11 12:56:43.763'},N'Save',N'Save Media performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (404,0,1195,{ts '2018-12-11 12:56:55.723'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (405,0,1195,{ts '2018-12-11 12:57:00.357'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (406,0,-1,{ts '2018-12-11 13:24:29.703'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (407,0,-1,{ts '2018-12-11 13:29:29.897'},N'Save',N'Save Macro performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (408,0,0,{ts '2018-12-11 13:37:27.817'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (409,0,0,{ts '2018-12-11 13:37:52.323'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (410,0,1163,{ts '2018-12-11 13:38:50.843'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (411,0,0,{ts '2018-12-11 13:40:00.147'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (412,0,0,{ts '2018-12-11 13:40:21.367'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (413,0,0,{ts '2018-12-11 13:41:00.997'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (414,0,0,{ts '2018-12-11 13:41:23.067'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (415,0,0,{ts '2018-12-11 13:42:22.413'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (416,0,0,{ts '2018-12-11 13:42:51.910'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (417,0,0,{ts '2018-12-11 13:42:51.950'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (418,0,0,{ts '2018-12-11 13:42:52.030'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (419,0,1213,{ts '2018-12-11 13:43:21.617'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (420,0,1163,{ts '2018-12-11 13:44:24.133'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (421,0,1163,{ts '2018-12-11 13:44:47.820'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (422,0,1206,{ts '2018-12-11 13:47:14.840'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (423,0,1206,{ts '2018-12-11 13:47:35.787'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (424,0,1206,{ts '2018-12-11 13:47:41.220'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (425,0,1206,{ts '2018-12-11 13:47:41.440'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (426,0,1208,{ts '2018-12-11 13:48:10.953'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (427,0,1208,{ts '2018-12-11 13:48:11.007'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (428,0,1212,{ts '2018-12-11 13:48:28.677'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (429,0,1212,{ts '2018-12-11 13:48:28.993'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (430,0,1212,{ts '2018-12-11 13:48:29.380'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (431,0,1213,{ts '2018-12-11 13:48:31.080'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (432,0,1163,{ts '2018-12-11 13:49:57.890'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (433,0,1213,{ts '2018-12-11 13:51:14.503'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (434,0,1163,{ts '2018-12-11 13:51:23.557'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (435,0,0,{ts '2018-12-11 13:52:49.670'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (436,0,0,{ts '2018-12-11 13:53:10.873'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (437,0,0,{ts '2018-12-11 13:53:58.510'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (438,0,0,{ts '2018-12-11 13:54:31.790'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (439,0,-1,{ts '2018-12-11 13:56:07.137'},N'Delete',N'Delete Content of Types 1082 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (440,0,1082,{ts '2018-12-11 13:56:07.183'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (441,0,1214,{ts '2018-12-11 13:57:01.627'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (442,0,1214,{ts '2018-12-11 13:57:01.643'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (443,0,1214,{ts '2018-12-11 13:57:02.470'},N'Delete',N'Trashed content with Id: 1214 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (444,0,1215,{ts '2018-12-11 13:57:09.670'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (445,0,1215,{ts '2018-12-11 13:57:09.703'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (446,0,1215,{ts '2018-12-11 13:57:10.550'},N'Delete',N'Trashed content with Id: 1215 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (447,0,1216,{ts '2018-12-11 13:57:16.247'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (448,0,1216,{ts '2018-12-11 13:57:16.260'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (449,0,1216,{ts '2018-12-11 13:57:16.870'},N'Delete',N'Trashed content with Id: 1216 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (450,0,1217,{ts '2018-12-11 13:57:21.963'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (451,0,1217,{ts '2018-12-11 13:57:21.980'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (452,0,1217,{ts '2018-12-11 13:57:22.480'},N'Delete',N'Trashed content with Id: 1217 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (453,0,1183,{ts '2018-12-11 13:57:28.317'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (454,0,0,{ts '2018-12-11 13:58:16.280'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (455,0,-1,{ts '2018-12-11 13:58:34.067'},N'Delete',N'Delete Content of Types 1213 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (456,0,1213,{ts '2018-12-11 13:58:34.167'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (457,0,-1,{ts '2018-12-11 13:58:35.437'},N'Delete',N'Delete Content of Types 1213 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (458,0,1213,{ts '2018-12-11 13:58:35.477'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (459,0,1183,{ts '2018-12-11 13:59:55.197'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (460,0,0,{ts '2018-12-11 14:02:26.370'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (461,0,0,{ts '2018-12-11 14:02:47.987'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (462,0,0,{ts '2018-12-11 14:03:36.773'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (463,0,0,{ts '2018-12-11 14:03:53.867'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (464,0,1223,{ts '2018-12-11 14:04:19.137'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (465,0,1163,{ts '2018-12-11 14:04:58.150'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (466,0,1163,{ts '2018-12-11 14:05:29.053'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (467,0,0,{ts '2018-12-11 14:06:33.600'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (468,0,1183,{ts '2018-12-11 14:07:21.617'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (469,0,1183,{ts '2018-12-11 14:07:54.027'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (470,0,1163,{ts '2018-12-11 14:10:59.957'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (471,0,0,{ts '2018-12-11 14:12:08.727'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (472,0,0,{ts '2018-12-11 14:12:28.683'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (473,0,0,{ts '2018-12-11 14:12:46.703'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (474,0,0,{ts '2018-12-11 14:13:59.507'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (475,0,0,{ts '2018-12-11 14:14:15.847'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (476,0,1163,{ts '2018-12-11 14:14:33.023'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (477,0,1224,{ts '2018-12-11 14:15:54.233'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (478,0,1224,{ts '2018-12-11 14:15:54.250'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (479,0,1224,{ts '2018-12-11 14:15:54.823'},N'Delete',N'Trashed content with Id: 1224 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (480,0,1183,{ts '2018-12-11 14:16:30.797'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (481,0,0,{ts '2018-12-11 14:17:49.730'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (482,0,1183,{ts '2018-12-11 14:18:10.167'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (483,0,1230,{ts '2018-12-11 14:18:36.460'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (484,0,1230,{ts '2018-12-11 14:19:49.613'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (485,0,0,{ts '2018-12-11 14:20:35.740'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (486,0,0,{ts '2018-12-11 14:20:57.640'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (487,0,0,{ts '2018-12-11 14:20:57.713'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (488,0,1163,{ts '2018-12-11 14:21:55.883'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (489,0,1163,{ts '2018-12-11 14:22:27.223'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (490,0,1163,{ts '2018-12-11 14:26:51.093'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (491,0,1187,{ts '2018-12-11 14:31:48.383'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (492,0,1187,{ts '2018-12-11 14:31:48.397'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (493,0,1187,{ts '2018-12-11 14:31:48.980'},N'Delete',N'Trashed content with Id: 1187 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (494,0,1189,{ts '2018-12-11 14:31:49.947'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (495,0,1189,{ts '2018-12-11 14:31:49.957'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (496,0,1189,{ts '2018-12-11 14:31:50.453'},N'Delete',N'Trashed content with Id: 1189 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (497,0,1194,{ts '2018-12-11 14:31:51.157'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (498,0,1194,{ts '2018-12-11 14:31:51.167'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (499,0,1194,{ts '2018-12-11 14:31:51.637'},N'Delete',N'Trashed content with Id: 1194 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (500,0,1195,{ts '2018-12-11 14:31:52.530'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (501,0,1195,{ts '2018-12-11 14:31:52.547'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (502,0,1195,{ts '2018-12-11 14:31:53.027'},N'Delete',N'Trashed content with Id: 1195 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (503,0,1218,{ts '2018-12-11 14:31:53.710'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (504,0,1218,{ts '2018-12-11 14:31:53.723'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (505,0,1218,{ts '2018-12-11 14:31:54.193'},N'Delete',N'Trashed content with Id: 1218 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (506,0,1230,{ts '2018-12-11 14:31:55.107'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (507,0,1230,{ts '2018-12-11 14:31:55.117'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (508,0,1230,{ts '2018-12-11 14:31:55.633'},N'Delete',N'Trashed content with Id: 1230 related to original parent content with Id: 1183');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (509,0,1183,{ts '2018-12-11 14:32:12.357'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (510,0,0,{ts '2018-12-11 14:33:51.350'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (511,0,1183,{ts '2018-12-11 14:34:32.733'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (512,0,1183,{ts '2018-12-11 14:34:43.427'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (513,0,1234,{ts '2018-12-11 14:37:37.863'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (514,0,1234,{ts '2018-12-11 14:42:43.187'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (515,0,1234,{ts '2018-12-11 14:43:14.153'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (516,0,0,{ts '2018-12-12 09:33:04.240'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (517,0,0,{ts '2018-12-12 09:41:09.617'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (518,0,0,{ts '2018-12-12 09:41:37.377'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (519,0,1238,{ts '2018-12-12 09:41:38.257'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (520,0,1163,{ts '2018-12-12 09:48:14.437'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (521,0,1237,{ts '2018-12-12 10:08:17.353'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (522,0,1061,{ts '2018-12-12 10:09:03.017'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (523,0,1061,{ts '2018-12-12 10:12:16.817'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (524,0,0,{ts '2018-12-12 10:18:10.200'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (525,0,1239,{ts '2018-12-12 10:20:56.090'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (526,0,1239,{ts '2018-12-12 10:20:56.133'},N'Delete',N'Delete Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (527,0,-1,{ts '2018-12-12 10:20:56.133'},N'Delete',N'Delete Content of Types 1238 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (528,0,1238,{ts '2018-12-12 10:20:56.167'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (529,0,0,{ts '2018-12-12 10:22:49.687'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (530,0,0,{ts '2018-12-12 10:23:05.043'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (531,0,0,{ts '2018-12-12 10:23:29.637'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (532,0,0,{ts '2018-12-12 10:23:45.493'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (533,0,1244,{ts '2018-12-12 10:24:02.767'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (534,0,1163,{ts '2018-12-12 10:27:03.103'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (535,0,1163,{ts '2018-12-12 10:28:17.337'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (536,0,1076,{ts '2018-12-12 10:29:27.877'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (537,0,1183,{ts '2018-12-12 10:30:04.763'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (538,0,-1,{ts '2018-12-12 11:32:05.227'},N'Delete',N'Delete Content of Types 1244 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (539,0,1244,{ts '2018-12-12 11:32:05.283'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (540,0,0,{ts '2018-12-12 11:34:23.180'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (541,0,0,{ts '2018-12-12 11:34:25.663'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (542,0,0,{ts '2018-12-12 11:36:05.117'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (543,0,0,{ts '2018-12-12 11:37:48.310'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (544,0,0,{ts '2018-12-12 11:37:48.357'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (545,0,0,{ts '2018-12-12 11:37:48.437'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (546,0,0,{ts '2018-12-12 11:37:58.047'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (547,0,0,{ts '2018-12-12 11:37:58.093'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (548,0,0,{ts '2018-12-12 11:38:36.150'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (549,0,1254,{ts '2018-12-12 11:38:37.053'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (550,0,0,{ts '2018-12-12 11:39:59.790'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (551,0,0,{ts '2018-12-12 11:40:15.040'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (552,0,0,{ts '2018-12-12 11:40:56.733'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (553,0,1258,{ts '2018-12-12 11:41:16.947'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (554,0,1258,{ts '2018-12-12 11:44:00.550'},N'Save',N'Save ContentType performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoMigration] ON;
GO
INSERT INTO [umbracoMigration] ([id],[name],[createDate],[version]) VALUES (1,N'Umbraco',{ts '2018-11-23 14:18:24.640'},N'7.12.4');
GO
SET IDENTITY_INSERT [umbracoMigration] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2018-11-23 14:18:19.097'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2018-11-23 14:18:19.110'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2018-11-23 14:18:19.110'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.110'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.113'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'Checkbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.120'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.120'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.120'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-95,0,-1,0,1,N'-1,-95',2,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-96,0,-1,0,1,N'-1,-96',2,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.123'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-97,0,-1,0,1,N'-1,-97',2,'aa2c52a0-ce87-4e65-a47c-7df09358585d',N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.127'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-11-23 14:18:19.127'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-11-23 14:18:19.130'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2018-11-23 14:18:19.133'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.133'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1044,0,-1,0,1,N'-1,1044',0,'d59be02f-1df9-4228-aa1e-01917d806cda',N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2018-11-23 14:18:19.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1046,0,-1,0,1,N'-1,1046',2,'fd1e0da5-5606-4862-b679-5d0cf3a52a59',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1047,0,-1,0,1,N'-1,1047',2,'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.140'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1048,0,-1,0,1,N'-1,1048',2,'135d60e0-64d9-49ed-ab08-893c9ba44ae5',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.140'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1049,0,-1,0,1,N'-1,1049',2,'9dbbcbbb-2327-434a-b355-af1b84e5010a',N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.143'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1050,0,-1,0,1,N'-1,1050',2,'b4e3535a-1753-47e2-8568-602cf8cfee6f',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:18:19.143'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1060,0,1088,NULL,1,N'-1,1088,1060',0,'c2f41d3e-3f22-4d6a-8beb-19953a5fafeb',N'Home','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:25:42.100'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1061,0,1064,0,2,N'-1,1064,1061',113,'84f61ba8-3749-4be9-b7d0-f070402cd66b',N'Home','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-11-23 14:25:42.277'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1062,0,-1,0,1,N'-1,1062',0,'8a593e06-83f0-477c-81b7-dc2af19a375e',N'Map','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-11-23 14:26:50.670'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1063,0,-1,0,1,N'-1,1063',0,'90537099-9e5b-4d3e-bded-57740c848381',N'Compositions','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2018-11-23 14:29:04.073'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1064,0,-1,0,1,N'-1,1064',0,'45097944-b9ae-410d-a778-62792e34656d',N'Pages','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2018-11-23 14:29:13.350'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1065,0,1088,NULL,1,N'-1,1088,1065',0,'4d6dc663-4715-4a23-a098-d2eae51f1e85',N'ContentPage','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:31:49.387'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1075,0,1088,NULL,1,N'-1,1088,1075',0,'5e41cf62-7c7b-4c7b-aede-9188331cb874',N'Animal','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:51:36.333'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1067,0,-1,0,1,N'-1,1067',24,'c4bea177-7246-411f-ab63-fe78a2532df3',N'Banner - Banner image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:32:36.833'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1068,0,1063,0,2,N'-1,1063,1068',10,'95a0bb82-0d65-4c74-99ce-80fb2f0c41c4',N'Banner','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-11-23 14:34:28.700'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1069,0,-1,0,1,N'-1,1069',25,'4865f977-6a74-487c-a103-c659499fe828',N'Content - Headline - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:34:50.453'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1076,0,1064,0,2,N'-1,1064,1076',95,'4d37aa80-1365-49cd-86c6-10694581eb48',N'Animals','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-11-23 14:51:36.497'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1070,0,-1,0,1,N'-1,1070',26,'cb46742b-1258-4e43-9194-9a86e68824db',N'Content - Body text - Rich Text Editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:35:13.307'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1071,0,1063,0,2,N'-1,1063,1071',6,'f55534db-0128-4d8e-a090-4942e14ee0e5',N'BaseContent','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-11-23 14:35:17.040'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1072,0,-1,0,1,N'-1,1072',27,'b0b53234-9620-40da-a07a-9285ca559c05',N'SEO - Meta title - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:45:07.807'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1073,0,-1,0,1,N'-1,1073',28,'bc2a8b1d-ccb7-40d6-baea-de79db74fab1',N'SEO - Meta description - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:45:27.917'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1074,0,1063,0,2,N'-1,1063,1074',2,'d294eb5b-bfad-4acd-b12d-ba16c8e5b00f',N'SEO','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-11-23 14:45:30.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1077,0,1088,NULL,1,N'-1,1088,1077',0,'30f6ff04-6f6a-4819-8c09-bea744b73d96',N'Calendar','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:51:51.430'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1260,0,-1,0,1,N'-1,1260',145,'bee5c73d-239f-49e2-a6c8-2066c4083725',N'Calendar - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-17 12:12:32.737'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1079,0,1088,NULL,1,N'-1,1088,1079',0,'a564e8e9-4890-42f4-b927-1e8ab3a61ce4',N'Calendar item','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:52:03.930'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1263,0,1064,0,2,N'-1,1064,1263',112,'5bf4531c-1b78-4680-a2cd-9d3c8dad2920',N'Calendar','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-28 13:13:32.327'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1081,0,1088,NULL,1,N'-1,1088,1081',0,'32daabaa-f4ac-4a08-a47e-68ed6112a847',N'Animal picture','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-11-23 14:52:27.797'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1218,1,-20,0,1,N'-1,-20,1218',11,'3829e12a-c42d-45a9-8c60-784cc25aa66d',N'adew','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 13:58:16.260'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1083,0,-1,0,1,N'-1,1083',29,'613cf89a-f5f3-4cf0-8423-8ecb2bf13559',N'Animal - Fact list - Repeatable textstrings','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:55:57.447'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1084,0,-1,0,1,N'-1,1084',30,'e02c5b09-d3e6-4b36-bde8-9dd889261516',N'Animal picture - Animal images - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-11-23 14:57:32.533'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1187,1,-20,0,1,N'-1,-20,1187',7,'b8058c7b-4ccb-4c42-a016-4474156a7908',N'Alpaca','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-10 15:33:34.040'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1188,1,-20,0,1,N'-1,-20,1188',1,'d6190b59-cc93-4137-962a-a87cc8b68ffb',N'Alpaca (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-10 15:35:40.393'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1189,1,-20,0,1,N'-1,-20,1189',8,'3bcb94db-0cdb-4d88-b41b-b2fda9cc3ff4',N'Jesper','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 09:46:08.520'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1088,0,-1,NULL,1,N'-1,1088',0,'05e018ec-6b7e-4b3b-bfa8-e335f93fe778',N'Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-12-04 12:50:58.610'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1089,0,-1,0,1,N'-1,1089',31,'fa4571a0-9968-4aec-9c9c-0c3b5a49773c',N'Animal - Animal-titel - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-05 23:36:09.937'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1090,0,-1,0,1,N'-1,1090',32,'8e5a98d3-8b84-4dc0-b713-3a25bc091aff',N'Animal - Animal-image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-05 23:36:35.630'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1091,0,-1,0,1,N'-1,1091',33,'75c78cfd-01a7-4250-8f58-89505428cac3',N'Animal - AnimalTitle - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-05 23:37:10.573'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1092,0,-1,0,1,N'-1,1092',34,'643fafbc-d307-4292-92a2-ad5ca451cfad',N'Animal - Animal-Text - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-05 23:37:36.447'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1093,0,-1,0,1,N'-1,1093',0,'abc48596-ab70-4865-8083-2a9fbf01a223',N'givskudzoo_alpaka.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-05 23:38:23.667'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1128,0,1088,NULL,1,N'-1,1088,1128',0,'4a0c3b5d-bdb2-41a6-b64b-90ed4358af8e',N'Animals','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-12-06 01:45:56.377'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1163,0,1064,0,2,N'-1,1064,1163',103,'6cc53dd7-c3f3-4762-972c-89e1b4ed2586',N'Animal','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-10 13:18:14.917'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1130,0,-1,0,1,N'-1,1130',61,'e2227fc8-c7cd-427d-a1c7-d6d3a820e3c7',N'Animals - image2 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 03:19:14.993'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1099,0,-1,0,1,N'-1,1099',35,'2179c8eb-3d2a-4ac6-b7e4-30f06cab2a67',N'Animal - Nested Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:18:59.467'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1100,0,-1,0,1,N'-1,1100',36,'af73af08-2ad0-45b1-ab2d-a75eda3781e2',N'Animal - New animal - Nested Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:21:22.683'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1101,0,-1,0,1,N'-1,1101',37,'b6ddde77-e714-40c5-9aaa-be85c76e8826',N'Animal - Animal picture - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:22:40.410'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1102,0,-1,0,1,N'-1,1102',38,'b7e68bfd-0707-4b14-be7e-fec1c37797e6',N'Animal - Animal title - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:22:54.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1103,0,-1,0,1,N'-1,1103',39,'f774fadb-3ad1-4753-8e93-2e9c8ae4567c',N'Animal - Animal descrip - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:23:10.677'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1104,0,-1,0,1,N'-1,1104',40,'d917e665-e6b2-4583-ab61-110109d4f5f8',N'Animal - Featured animals - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:31:14.717'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1105,0,-1,0,1,N'-1,1105',41,'56f82e4d-6a9e-4091-8418-3bf3f27ca770',N'Animal - Animal name - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:32:03.257'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1106,0,-1,0,1,N'-1,1106',42,'a7cd3db8-21c2-488d-97e2-5147e7f0b3e1',N'Animal - animal descrip - Textarea (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:32:15.157'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1107,0,-1,0,1,N'-1,1107',43,'6cf2d75d-b75a-46f1-9edc-e62ec1cca93c',N'Animal - animal name - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:35:56.820'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1108,0,-1,0,1,N'-1,1108',44,'9fa4876e-f998-476c-b70e-5399adc0c534',N'Animal - animal - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:36:22.757'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1109,0,-1,0,1,N'-1,1109',45,'1cbb7706-79e7-497a-bcd8-0ea5774ebe6b',N'Animal - animal image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:36:58.423'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1146,0,-1,0,1,N'-1,1146',76,'96e937c6-6065-4e47-b432-40a76b6c585d',N'Animal - Animal facts - Repeatable textstrings','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:39:55.200'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1147,0,-1,0,1,N'-1,1147',77,'56c842a3-b103-4a6c-81f8-a658ee7f2546',N'Animal - Animal height - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:57:01.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1148,0,-1,0,1,N'-1,1148',78,'14654987-548a-4f09-9926-27a101a98165',N'Animal - Animal height - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:57:24.187'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1149,0,-1,0,1,N'-1,1149',78,'16b2aebe-1730-4a48-a108-e6f93c1d0051',N'Animal - Animal height - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:57:24.197'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1150,0,-1,0,1,N'-1,1150',80,'c6f299e8-61ec-4218-9e65-0c6fa1a6aa1a',N'Animal - AnimalHeight - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:59:04.767'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1151,0,-1,0,1,N'-1,1151',81,'d8957826-eb6f-4e69-9a0a-333150a0872b',N'Animal - AnimalHeight - Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:59:46.900'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1152,0,-1,0,1,N'-1,1152',82,'1d9192e2-1592-4baf-a3ec-43978182e05e',N'Animal - Animal Weight - Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:00:50.407'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1153,0,-1,0,1,N'-1,1153',83,'8e388752-0994-40d9-b004-6dd18fb5591f',N'Animal - Animal Weight - Numeric (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:01:06.017'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1154,0,-1,0,1,N'-1,1154',84,'950a98bb-d173-4e35-8382-c2416d77e959',N'Animal - AnimalHeight - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:32.527'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1155,0,-1,0,1,N'-1,1155',85,'be57a5b6-9cb9-4128-88c1-bf9af0ea3ab1',N'Animal - AnimalHeight - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:48.847'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1156,0,-1,0,1,N'-1,1156',85,'45d1ecd6-143e-472a-8a7f-52f1c25d5556',N'Animal - AnimalHeight - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:48.840'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1157,0,-1,0,1,N'-1,1157',85,'9426baab-890f-4d46-86d1-c95c274e3b0f',N'Animal - AnimalHeight - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:48.840'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1158,0,-1,0,1,N'-1,1158',85,'19b69381-213d-4720-9edd-5634922bf585',N'Animal - AnimalHeight - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:48.863'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1159,0,-1,0,1,N'-1,1159',86,'f9db9d26-d66f-40ff-8739-76308cca57a5',N'Animal - AnimalHeight - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:13:48.840'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1160,0,-1,0,1,N'-1,1160',90,'589bf69f-c17d-4cda-b476-f855c18c4e2d',N'Animal - Animal Weight - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 10:16:17.107'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1161,0,-1,0,1,N'-1,1161',1,'7308629d-1a48-4327-9e9e-49d947682d06',N'alpaka6.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-10 10:29:06.713'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1164,0,-1,0,1,N'-1,1164',91,'9ad6f63c-f497-4fb4-9e00-89ed62a46b52',N'Animal - AnimalName - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:20:43.320'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1165,0,-1,0,1,N'-1,1165',92,'57e86f69-956a-40f4-9b74-326a42053c87',N'Animal - AnimalName - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:21:02.193'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1166,0,-1,0,1,N'-1,1166',93,'da9ef622-c240-4552-9b0f-9034805f9eea',N'Animal - Image animal - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:22:14.997'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1167,0,-1,0,1,N'-1,1167',94,'94760cdd-2d26-44e3-9720-78d8d00e17f2',N'Animal - Image animal - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:22:29.567'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1168,0,-1,0,1,N'-1,1168',95,'53837ff6-28c8-442d-9bbb-a38f8aaa4d2d',N'Animal - Animal Description - Rich Text Editor (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:23:17.263'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1169,0,-1,0,1,N'-1,1169',96,'ceb5f47e-b2fa-4b63-877c-28acc70179c5',N'Animal - Animal Description - Rich Text Editor (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:23:32.717'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1170,0,-1,0,1,N'-1,1170',96,'67dfcd5e-853a-47c5-9311-c8b22424b3e9',N'Animal - Animal Description - Rich Text Editor (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 13:23:32.717'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1190,0,-1,0,1,N'-1,1190',102,'c5b814f0-30b1-4a81-aa46-d3f9fe98e442',N'Animal - Short description - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 09:55:19.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1191,0,-1,0,1,N'-1,1191',103,'3fcb052e-28a6-4e05-9002-54549ad94cf8',N'Animal - Short description - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 09:55:35.700'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1192,0,-1,0,1,N'-1,1192',103,'401e6292-ccda-4115-9740-763949396e0f',N'Animal - Short description - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 09:55:35.700'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1193,0,-1,0,1,N'-1,1193',104,'2cf3b209-d0fd-40b3-96dd-9f449bc9a5b6',N'Animal - Short description - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 09:55:35.927'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1175,0,-1,0,1,N'-1,1175',98,'88fa676f-6d27-4213-8329-d07d2e9f6246',N'Animal - Animal height - Decimal','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 14:16:04.523'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1176,0,-1,0,1,N'-1,1176',99,'a1ceee4d-6cd6-4562-9ed4-7a23122363e1',N'Animal - Animal height - Decimal (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 14:16:05.707'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1177,0,-1,0,1,N'-1,1177',100,'d5bf5a5d-800a-4935-88b8-7419e651e65a',N'Animal - Animal height - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 14:19:44.670'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1178,0,-1,0,1,N'-1,1178',101,'61a2bfa6-6229-4629-9a63-772ac0fc1eb8',N'Animal - Animal weight - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 14:21:44.277'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1194,1,-20,0,1,N'-1,-20,1194',9,'b91067f8-d189-4a38-930e-e98f8677b1db',N'Uffe','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 10:32:16.067'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1195,1,-20,0,1,N'-1,-20,1195',10,'c24db2f8-1644-47f4-9144-3f6bc2a52217',N'jonathan','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 10:33:52.793'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1196,0,-1,0,1,N'-1,1196',2,'7266ed16-a35d-4afe-9c52-f53518c41902',N'blpandet-dvrgara.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:29.940'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1198,0,-1,0,1,N'-1,1198',4,'61af577e-573a-4824-be7f-36938628b75c',N'givskudzoo_flamingo.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:40.277'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1199,0,-1,0,1,N'-1,1199',5,'613f6245-7e1a-4a62-a909-75d68d62aff0',N'givskudzoo_kamelflok_liggende_anlaeg_0769.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:41.053'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1200,0,-1,0,1,N'-1,1200',6,'dca25b70-10ab-4ca9-93ba-c2ee48f55c87',N'lion.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:41.857'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1201,0,-1,0,1,N'-1,1201',7,'45fe8798-300d-4ff0-b7a8-4e2b813afbf2',N'park-opening.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:42.800'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1202,0,-1,0,1,N'-1,1202',8,'53850509-a4d0-4bcb-9793-017702c222a8',N'soldaterara.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:43.653'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1203,0,-1,0,1,N'-1,1203',106,'dc750855-67c9-4e19-a0e3-0ebaccb475c6',N'Animal - Gallery image-1 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:37:27.680'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1204,0,-1,0,1,N'-1,1204',107,'32daaeff-875f-4ebd-9218-265594712e44',N'Animal - Gallery image-1 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:37:52.120'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1205,0,-1,0,1,N'-1,1205',108,'730ca220-156f-4d70-b7d0-ab74a42eabac',N'Gallery - Gallery image-1 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:39:59.993'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1206,0,-1,0,1,N'-1,1206',109,'e91dee44-0723-473e-950e-bd1257e73b5f',N'Gallery - Gallery image-1 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:40:21.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1207,0,-1,0,1,N'-1,1207',110,'92548b71-cf00-4406-a3ec-f505f2bdf2b1',N'Gallery - Gallery image-2 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:41:00.827'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1208,0,-1,0,1,N'-1,1208',111,'26882bfa-4ae4-462d-958f-1ef5e0d03ba4',N'Gallery - Gallery image-2 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:41:22.860'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1209,0,-1,0,1,N'-1,1209',112,'67097dc9-00f6-4430-9afb-00914098b703',N'Gallery - Gallery image-3 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:42:22.243'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1210,0,-1,0,1,N'-1,1210',113,'0a4233eb-a050-414c-8aaf-98086d2ebc48',N'Gallery - Gallery image-3 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:42:51.673'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1211,0,-1,0,1,N'-1,1211',113,'393bc6ba-efee-49c7-888d-cdcb07ea84c8',N'Gallery - Gallery image-3 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:42:51.673'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1212,0,-1,0,1,N'-1,1212',113,'af2820e9-d384-4782-a73c-6385a0aae47c',N'Gallery - Gallery image-3 - Media Picker (1) (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 13:42:51.677'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1219,0,-1,0,1,N'-1,1219',116,'2a85abd3-7a12-4b43-a7ef-d9d7b70372b2',N'Gallery for animals - Gallery image one - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:02:26.247'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1214,1,-20,0,1,N'-1,-20,1214',2,'9e44e3c9-37fe-4a24-90e0-277d00e9bda4',N'Mogens','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 13:52:49.553'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1215,1,-20,0,1,N'-1,-20,1215',3,'c2a3e449-c4f5-40c0-915e-e849ca033f76',N'Mogens (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 13:53:10.853'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1216,1,-20,0,1,N'-1,-20,1216',4,'1d58f4ec-67f6-4c88-9ae2-7e9b8905f59c',N'Mogens (2)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 13:53:58.487'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1217,1,-20,0,1,N'-1,-20,1217',5,'082ff554-f5bb-4c99-8247-10e7dabd5a2c',N'Mogens (3)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 13:54:31.773'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1220,0,-1,0,1,N'-1,1220',117,'e05322d3-c6bc-4fa9-ace0-210d9bc083d8',N'Gallery for animals - Gallery image one - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:02:47.787'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1221,0,-1,0,1,N'-1,1221',118,'2dad4369-a54e-4db3-a618-bb73b193af41',N'Gallery for animals - Gallery image two - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:03:36.627'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1222,0,-1,0,1,N'-1,1222',119,'0d217458-d15c-4b7d-86f2-17804a5c6d45',N'Gallery for animals - Gallery image two - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:03:53.677'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1223,0,1063,0,2,N'-1,1063,1223',4,'3a0e2c33-b33a-4ecc-846f-53949d3afb43',N'Gallery for animals','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-11 14:04:18.993'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1224,1,-20,0,1,N'-1,-20,1224',6,'b00e3edf-fab1-4bea-ad6b-57185e329a36',N'lort','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 14:06:33.540'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1225,0,-1,0,1,N'-1,1225',120,'a52a39ea-0711-47b3-9fd6-0fe945f1f1ca',N'Animal - Gallery image-1 - Media Picker (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:12:08.587'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1226,0,-1,0,1,N'-1,1226',121,'344d33ef-d96b-4204-a9d3-81209262907c',N'Animal - Gallery image-1 - Media Picker (3)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:12:28.430'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1227,0,-1,0,1,N'-1,1227',122,'afa2d1a8-4562-43d9-a384-9c0a145a960a',N'Animal - Gallery image-1 - Media Picker (4)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:12:46.447'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1228,0,-1,0,1,N'-1,1228',123,'0152bb78-db9e-4e34-aef0-050f83f665f3',N'Animal - Gallery image-2 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:13:59.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1229,0,-1,0,1,N'-1,1229',124,'8527a101-8806-4099-a126-5b84e44160c8',N'Animal - Gallery image-2 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:14:15.627'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1230,1,-20,0,1,N'-1,-20,1230',12,'a62b12bb-181e-4772-bbf3-c7d9fa5a0d88',N'jens','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 14:17:49.703'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1231,0,-1,0,1,N'-1,1231',125,'06e7cfac-4c09-43d7-b1b4-24c17b8f06fb',N'Animal - Gallery image-3 - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:20:35.643'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1232,0,-1,0,1,N'-1,1232',126,'7cd9dc01-f4e8-452c-a979-2e1b148790f3',N'Animal - Gallery image-3 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:20:57.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1233,0,-1,0,1,N'-1,1233',126,'aa7f1bd6-38c0-447e-826f-7bb108e7e6ec',N'Animal - Gallery image-3 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-11 14:20:57.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1274,0,-1,0,1,N'-1,1274',153,'bd31126c-9013-4aac-8d81-ce5c3bff7e37',N'Calendar item - Image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:44:17.830'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1276,0,-1,0,1,N'-1,1276',155,'2ffa837e-ae7a-4206-875d-00a9c5726112',N'Calendar item - alt description - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:45:28.007'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1277,0,-1,0,1,N'-1,1277',156,'97a2c964-08ff-4f6d-8a29-904b2216deed',N'Calendar item - alt description - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:45:38.937'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1278,0,1268,0,3,N'-1,1062,1268,1278',1,'338d00d9-39f5-48f7-af7d-3f319c219c5d',N'Secoud try','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-28 14:17:04.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1279,0,-1,0,1,N'-1,1279',157,'224e9394-afb4-4a03-ba1c-bbe67fe151fb',N'Terratype Leaflet','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-01-03 13:56:24.550'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1280,0,-1,0,1,N'-1,1280',158,'a2114139-dd71-4c1c-aba8-964bc189ddc6',N'Nested Map','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-01-03 13:59:53.563'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1281,0,-1,NULL,1,N'-1,1281',0,'170484f2-f1a2-4116-b688-4d3bbeef0a10',N'Maps','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2019-01-03 14:02:46.253'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1282,0,-1,0,1,N'-1,1282',2,'43133c74-000d-4401-897d-a37bd11d2bec',N'Maps','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-01-03 14:02:46.807'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1283,0,-1,0,1,N'-1,1283',159,'1ae72568-4988-4905-a9e3-7df713193f06',N'Maps - Animal - Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-01-03 14:04:49.820'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1284,0,-1,0,1,N'-1,1284',160,'41298891-104c-4485-933c-0521c342b5d6',N'Animal Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-01-03 14:05:05.153'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1110,0,-1,0,1,N'-1,1110',46,'0cf7bf2b-cf85-4fab-89bb-cb2603fd9018',N'feature - Name - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:41:01.217'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1111,0,-1,0,1,N'-1,1111',47,'9bf18a96-8a46-4690-ab40-b18b776f8ab4',N'feature - Details - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:41:19.940'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1112,0,1063,0,2,N'-1,1063,1112',3,'6a30df5f-7530-4890-b7f3-42f765236782',N'feature','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-06 00:41:50.840'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1113,0,-1,0,1,N'-1,1113',48,'b4a20ecd-968a-4835-8c62-2a4c3195e18c',N'Animal - features - Nested Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 00:43:38.620'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1114,0,-1,0,1,N'-1,1114',49,'ad3d8ca8-771f-48f2-b356-021d2fdb0a16',N'List View - animal','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:13:19.187'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1115,0,-1,0,1,N'-1,1115',50,'2afb5deb-0152-4130-a975-975c29668d5b',N'Animal - Animal name - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:20:10.500'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1116,0,-1,0,1,N'-1,1116',51,'505b5091-ac1c-4c9b-96da-52252e7380e2',N'Animal - Animal name - Textsdsd','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:21:49.350'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1117,0,-1,0,1,N'-1,1117',52,'32c41a7d-779f-4d2e-b89a-def8f86fe892',N'Animal - Animal name - Textsdsd (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:21:49.823'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1118,0,-1,0,1,N'-1,1118',53,'7eb0fec6-b46c-428d-b60b-b3d2f26a1ef1',N'Animal - Animal name - Texttitle','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:22:06.937'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1119,0,-1,0,1,N'-1,1119',54,'1f9b5dc2-bd46-480f-bf3f-487a4dea3f7c',N'Animal - Animal Description - Rich Text Editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:23:22.777'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1120,0,-1,0,1,N'-1,1120',55,'039ff2cb-1d3d-42e0-84c2-d113d21d042b',N'Animal - Animal image - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:23:47.783'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1122,0,-1,0,1,N'-1,1122',56,'f221c54d-5590-49c2-b6fb-5d3433ac8b78',N'Animal - features - Nested Content (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:27:12.837'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1183,0,1062,0,2,N'-1,1062,1183',3,'abbcadf0-466d-48fc-86ba-27ff8c56b44e',N'Animals','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-10 15:22:32.817'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1124,0,-1,0,1,N'-1,1124',57,'92edc84f-6444-429b-98bc-72c028f6e702',N'Animals - Animal headline - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:36:51.077'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1125,0,-1,0,1,N'-1,1125',58,'97e49a0c-9bef-4ed6-97b7-9a66efb86aee',N'Animals - Animal descrip - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:37:12.953'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1126,0,-1,0,1,N'-1,1126',59,'c644dabb-bf7d-400b-80b0-3e095d414b3d',N'Animals - Animal description - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:37:52.800'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1127,0,-1,0,1,N'-1,1127',60,'0c6f4f60-32c6-47db-ab8b-79dceff05755',N'Animals - featured animals - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 01:39:28.913'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1131,0,-1,0,1,N'-1,1131',62,'de0895c8-74a9-483e-a66c-661b68a30f0d',N'Animals - image2 - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 03:19:35.700'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1132,0,-1,0,1,N'-1,1132',63,'7eee5a04-4ff2-4078-89b3-96a70a402369',N'Animals - image2 - Media Picker (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 03:19:45.487'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1133,0,-1,0,1,N'-1,1133',64,'bf80ecc8-df1e-47d6-975d-e9587940d9d3',N'Animals - image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 03:19:46.680'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1134,0,-1,0,1,N'-1,1134',64,'1a0efe3f-f129-499f-83dd-2a201d16d49b',N'Animals - image2 - Media Picker (3)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 03:19:46.673'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1135,0,-1,0,1,N'-1,1135',66,'f0f37c60-5578-4900-bf58-a623475541eb',N'Animals - Animal picture - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 12:52:04.010'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1136,0,-1,0,1,N'-1,1136',67,'ec04238c-d084-4030-bc64-071e4f8b8c57',N'Animals - Animal picture - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 12:52:46.927'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1137,0,-1,0,1,N'-1,1137',68,'490e525d-7f56-43ef-bdc5-fd2cb977d341',N'Animals - Animal picture - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 12:53:05.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1138,0,-1,0,1,N'-1,1138',68,'88a4ab6d-785b-456b-8f29-37d6b32aca96',N'Animals - Animal picture - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 12:53:05.117'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1139,0,-1,0,1,N'-1,1139',70,'4488bd08-513d-493f-b8a8-bf707da128c7',N'Calendar item - Event time - Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 13:59:44.827'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1140,0,-1,0,1,N'-1,1140',71,'820380d9-b27d-4c32-8f03-1ee030dd996b',N'Calendar item - Event time - Numeric (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 14:00:03.777'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1141,0,-1,0,1,N'-1,1141',72,'e610de53-77e4-4f63-a08c-73547c29d738',N'Calendar item - Event description - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 14:00:35.847'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1142,0,-1,0,1,N'-1,1142',73,'cf6c0d08-b439-445b-b65f-d6944ab95281',N'Calendar item - Event description - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-06 14:00:56.383'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1264,0,1064,0,2,N'-1,1064,1264',111,'be3626a6-2d0d-4f64-be53-82940aa8862c',N'Calendar item','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-28 13:14:16.397'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1144,0,-1,0,1,N'-1,1144',74,'9b55c471-e6dc-4499-a02d-9316eda823fc',N'Animal - Animal fact - Repeatable textstrings','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:28:01.787'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1145,0,-1,0,1,N'-1,1145',75,'37eccfce-7820-484a-93c4-ebf7acd0c3fc',N'Animal - Animal fact - Repeatable textstrings (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-10 09:28:19.017'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1197,0,-1,0,1,N'-1,1197',3,'8b93931a-369f-41f2-953b-ad86df5c2653',N'alpaka4.jpg','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2018-12-11 12:56:39.433'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1275,0,-1,0,1,N'-1,1275',153,'71699528-57f9-47b4-9caf-abcb33a04e0f',N'Calendar item - Image - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:44:17.830'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1234,1,-20,0,1,N'-1,-20,1234',13,'d1b3336e-ceba-4833-b440-f4919b06d0d9',N'Alpaca (2)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-11 14:33:51.333'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1235,0,-1,0,1,N'-1,1235',128,'d0da4afc-6c83-4d86-88f6-b62e37f82835',N'Category - CategoryName - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 09:33:04.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1236,0,-1,0,1,N'-1,1236',129,'e0d8d6dd-fce9-4ef2-97d0-4878215ef1f7',N'Category - ItemsIds - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 09:41:09.497'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1237,0,1088,NULL,1,N'-1,1088,1237',0,'c03bf7b5-b168-4b1b-a57f-07e2fe255085',N'Category','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-12-12 09:41:37.330'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1240,0,-1,0,1,N'-1,1240',130,'5b89f8b5-8524-4fa7-b089-71301d765520',N'Category - CategoryName - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 10:22:49.560'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1241,0,-1,0,1,N'-1,1241',131,'c094bb94-ffe8-4e78-870e-afd0687dad49',N'Category - CategoryName - Textbox (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 10:23:04.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1242,0,-1,0,1,N'-1,1242',132,'314dd23d-f140-44ac-aefa-2eb302578733',N'Category - ItemIds - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 10:23:29.510'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1243,0,-1,0,1,N'-1,1243',133,'2f6c0f22-e816-4199-a497-aafa51c70f8e',N'Category - ItemIds - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 10:23:45.247'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1245,0,-1,0,1,N'-1,1245',134,'95decb4f-bc7b-4ecd-9c3e-1260cc726b09',N'Animal-Collection - CollectionName - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:34:23.020'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1246,0,-1,0,1,N'-1,1246',135,'7ac8dfd5-8460-42a7-b060-67dce9194635',N'Animal-Collection - CollectionName - Textbox (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:34:25.503'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1247,0,-1,0,1,N'-1,1247',136,'bdaa62e2-5c78-4d83-94ce-1905230f8e5d',N'Animal-Collection - CategoryIds - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:36:04.853'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1248,0,-1,0,1,N'-1,1248',137,'8faba271-452b-4bdc-8b7f-6c2929d220f3',N'Animal-Collection - CategoryIds - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:37:48.213'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1249,0,-1,0,1,N'-1,1249',137,'7b462eb4-6c81-4b74-8816-b1dcdacc42ae',N'Animal-Collection - CategoryIds - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:37:48.213'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1250,0,-1,0,1,N'-1,1250',137,'29d07c65-c60a-4d13-8097-3f2f508ec689',N'Animal-Collection - CategoryIds - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:37:48.223'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1251,0,-1,0,1,N'-1,1251',140,'f1ea89dc-b0e6-44ea-a003-626be65df123',N'Animal-Collection - CategoryIds - Multinode Treepicker (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:37:57.833'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1252,0,-1,0,1,N'-1,1252',141,'f89e0ec5-e78d-46c3-b3f4-7df92ab3c7f7',N'Animal-Collection - CategoryIds - Multinode Treepicker (2)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:37:57.833'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1253,0,-1,NULL,1,N'-1,1253',0,'c22eda20-0ec8-4df1-90af-71694e42ca32',N'AnimalCollection','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2018-12-12 11:38:36.130'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1254,0,1064,0,2,N'-1,1064,1254',5,'565c19c4-6bce-47e2-988a-84deb41fcf67',N'AnimalCollection','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-12 11:38:36.940'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1255,0,-1,0,1,N'-1,1255',142,'f7934217-ce46-4639-8bca-06dc07e61a90',N'Category - CategoryName - Textbox (3)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:39:59.673'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1256,0,-1,0,1,N'-1,1256',143,'5cda1573-d642-4e70-88c4-a6f79275fe1c',N'Category - CategoryName - Textbox (4)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:40:14.820'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1257,0,-1,0,1,N'-1,1257',144,'ce923b34-ac20-459f-be50-bc5777c7945f',N'Category - CategoryIds - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-12 11:40:56.573'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1258,0,1064,0,2,N'-1,1064,1258',96,'8123f269-ef74-47c5-9ec7-9e05f499aa3a',N'Category','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2018-12-12 11:41:16.713'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1259,0,1183,0,3,N'-1,1062,1183,1259',0,'2bdc597d-a73c-4b6f-805a-02cc5663e5ab',N'Alpaca','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-17 10:47:06.130'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1265,0,-1,0,1,N'-1,1265',146,'ffa2bdff-2f2a-48fa-a88f-3edc3d2809b4',N'Calendar - feature Calendar - Multinode Treepicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:24:46.490'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1266,0,-1,0,1,N'-1,1266',147,'f9224986-4ee5-4f05-8c9c-a4310d631b66',N'Calendar - feature Calendar - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:24:57.337'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1267,0,-1,0,1,N'-1,1267',147,'ac56efc6-166a-47b3-afcf-fdd0b2f23caf',N'Calendar - feature Calendar - Multinode Treepicker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:24:57.343'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1268,0,1062,0,2,N'-1,1062,1268',4,'c6a64856-1361-48ed-ae5e-89bdbaec04b7',N'Calendar','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-28 13:28:17.183'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1269,1,-20,0,1,N'-1,-20,1269',14,'c6d8e430-c760-4f7a-97e3-d90078507c23',N'First event','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2018-12-28 13:30:46.760'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1270,0,-1,0,1,N'-1,1270',149,'8d5e9e4b-6bc2-438f-9695-666e68b8d7bc',N'Calendar item - Description - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:42:41.550'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1271,0,-1,0,1,N'-1,1271',150,'fb39812b-72b5-4bf4-b1d7-309874012668',N'Calendar item - Description - Textarea (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:42:52.770'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1272,0,-1,0,1,N'-1,1272',150,'bdcdbae2-d4e2-4530-a2b6-204c535ea968',N'Calendar item - Description - Textarea (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:42:52.770'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1273,0,-1,0,1,N'-1,1273',150,'5ced4d18-8caf-4593-b990-c1182be2bc04',N'Calendar item - Description - Textarea (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2018-12-28 13:42:52.770'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] ON;
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (16,1183,1188,2,{ts '2018-12-10 15:36:08.303'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (17,1183,1214,2,{ts '2018-12-11 13:57:02.203'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (18,1183,1215,2,{ts '2018-12-11 13:57:10.280'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (19,1183,1216,2,{ts '2018-12-11 13:57:16.697'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (20,1183,1217,2,{ts '2018-12-11 13:57:22.320'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (21,1183,1224,2,{ts '2018-12-11 14:15:54.810'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (22,1183,1187,2,{ts '2018-12-11 14:31:48.817'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (23,1183,1189,2,{ts '2018-12-11 14:31:50.280'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (24,1183,1194,2,{ts '2018-12-11 14:31:51.483'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (25,1183,1195,2,{ts '2018-12-11 14:31:52.867'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (26,1183,1218,2,{ts '2018-12-11 14:31:54.033'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (27,1183,1230,2,{ts '2018-12-11 14:31:55.467'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (28,1183,1234,2,{ts '2018-12-17 10:45:20.527'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (30,1268,1269,2,{ts '2018-12-28 14:17:19.377'},N'');
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,'4cbeb612-e689-3563-b755-bf3ede295433',1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (2,'0cc3507c-66ab-3091-8913-3d998148e423',0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (3,'8307994f-faf2-3844-bab9-72d34514edf2',0,'b796f64c-1f99-4ffb-b886-4bf4bc011a9c','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',N'Relate Parent Media Folder On Delete',N'relateParentMediaFolderOnDelete');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (1,N'http://localhost:64573/umbraco',N'LAPTOP-ONFDFAIE//LM/W3SVC/2/ROOT',{ts '2018-11-23 14:18:49.393'},{ts '2018-12-17 12:28:37.557'},0,0);
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (2,N'http://localhost:64573/umbraco',N'LAPTOP-K63ARUIJ//LM/W3SVC/2/ROOT',{ts '2018-12-28 12:13:11.183'},{ts '2019-01-02 18:43:35.277'},0,0);
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (3,N'http://localhost:64573/umbraco',N'DESKTOP-FR2L4NF//LM/W3SVC/2/ROOT',{ts '2019-01-03 13:44:51.250'},{ts '2019-01-03 21:19:24.110'},1,1);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (0,0,0,N'Jonathan Pabst Klemensen',N'jonathan.klemensen@gmail.com',N'GVkLwqz1UPEE33fKl6to2g==hXAnwoIIQDfSS2YdbWZj8e6WQQHp5/FzDJdfd4N28p0=',N'{"hashAlgorithm":"HMACSHA256"}',N'jonathan.klemensen@gmail.com',N'en-US',N'd1adc472-d077-4990-8411-50ddcc4bfc9e',NULL,NULL,{ts '2018-11-23 14:18:26.833'},{ts '2019-01-03 21:14:36.797'},NULL,NULL,{ts '2018-11-23 14:18:23.073'},{ts '2019-01-03 21:14:36.910'},NULL,N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]');
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (1,0,0,N'Uffe',N'uffechristiansen@live.com',N'wnbycE6nPBq2zR0QRDW2vw==G4FDpsOTzgZa3R8I5llJnoBZP6gr5dvZ6NvWhmPVZ5g=',N'{"hashAlgorithm":"HMACSHA256"}',N'uffechristiansen@live.com',N'en-US',N'72808bb4-87b9-4eee-a38b-fa4426321e13',0,NULL,{ts '2019-01-03 19:02:10.440'},NULL,NULL,NULL,{ts '2019-01-03 19:02:10.030'},{ts '2019-01-03 19:02:10.977'},NULL,NULL);
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (2,0,0,N'Uffe',N'uffe0505@edu.eal.dk',N'JRGIGj44E3Tg68fHhvzvbw==8OU/uG5LP+kTF8dxOhjQ+iduXUTwVSsb0FAXCs3hcJA=',N'{"hashAlgorithm":"HMACSHA256"}',N'uffe0505@edu.eal.dk',N'en-US',N'cb7db7dc-5b88-4e10-b1a8-5722112adad4',0,NULL,{ts '2019-01-03 19:02:52.983'},NULL,NULL,NULL,{ts '2019-01-03 19:02:52.673'},{ts '2019-01-03 19:02:53.357'},NULL,NULL);
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,1);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,5);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (1,3);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (2,1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] ON;
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7ï',{ts '2018-11-23 14:18:25.053'},{ts '2018-11-23 14:18:25.053'},N'icon-medal',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (2,N'writer',N'Writers',N'CAH:F',{ts '2018-11-23 14:18:25.053'},{ts '2018-11-23 14:18:25.053'},N'icon-edit',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5Fï',{ts '2018-11-23 14:18:25.053'},{ts '2018-11-23 14:18:25.053'},N'icon-tools',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (4,N'translator',N'Translators',N'AF',{ts '2018-11-23 14:18:25.057'},{ts '2018-11-23 14:18:25.057'},N'icon-globe',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (5,N'sensitiveData',N'Sensitive data',N'',{ts '2018-11-23 14:18:25.057'},{ts '2018-11-23 14:18:25.057'},N'icon-lock',-1,-1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] OFF;
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'developer');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'member');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'settings');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'users');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (2,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (4,N'translation');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('274af1f5-6960-474c-9e43-cb708c226e72',0,{ts '2018-11-23 13:18:28.460'},{ts '2018-11-23 13:26:42.383'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('6c06a919-4d27-4017-b361-cd863b1b9c17',0,{ts '2018-11-23 13:28:55.240'},{ts '2018-11-23 13:28:55.240'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('082bf0fb-b6b8-45a3-b5be-7ac6056c9fc5',0,{ts '2018-11-23 13:29:40.427'},{ts '2018-11-23 13:29:40.600'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('4b3b0506-8fca-4b4b-86fb-8e7b2431fb2a',0,{ts '2018-11-23 13:30:32.270'},{ts '2018-11-23 13:36:40.663'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('af105181-ecb0-40cb-82ec-36eee248bee6',0,{ts '2018-11-23 13:44:07.400'},{ts '2018-11-23 14:04:37.883'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('99f0c623-84a1-45ed-85fc-e3b2b60f0bbb',0,{ts '2018-11-23 14:27:39.043'},{ts '2018-11-23 14:27:39.193'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('b47f606e-1dae-49d6-8300-6709a7be4549',0,{ts '2018-11-25 12:04:59.350'},{ts '2018-11-25 12:13:54.463'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('c2d88613-d443-4ad2-93d0-95a1ced03de9',0,{ts '2018-11-25 12:16:59.270'},{ts '2018-11-25 12:23:17.073'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('8a0a4a73-d3eb-4f31-be23-e98a834206d4',0,{ts '2018-11-25 12:24:49.807'},{ts '2018-11-25 12:42:27.360'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('45a074be-fa09-4998-adde-808115825e64',0,{ts '2018-12-04 07:19:18.607'},{ts '2018-12-04 07:19:18.607'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('23e2488e-af8b-49ec-bca8-f18d526e905c',0,{ts '2018-12-04 11:50:00.237'},{ts '2018-12-04 12:15:18.467'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('612bf78b-35fa-44df-b333-93bfc2a44e2f',0,{ts '2018-12-04 12:50:05.580'},{ts '2018-12-04 12:56:48.997'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('2980fb9c-e393-442b-8c80-c492047f3bf1',0,{ts '2018-12-04 13:17:41.893'},{ts '2018-12-04 13:17:42.743'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('298ca146-efb0-4efa-a477-f4a4077ab77f',0,{ts '2018-12-04 13:19:13.527'},{ts '2018-12-04 13:26:13.313'},NULL,N'127.0.0.1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('904a74fb-f9a9-4743-bb25-d68fbc2ba541',0,{ts '2018-12-04 13:33:41.923'},{ts '2018-12-04 13:58:57.343'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('a5904ef8-e7e7-4bf6-b60d-2e0e99b239cc',0,{ts '2018-12-05 20:58:23.530'},{ts '2018-12-05 22:13:03.653'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('40e3dd3b-eefb-4169-b84a-49ec9844d257',0,{ts '2018-12-05 22:35:05.267'},{ts '2018-12-06 02:20:26.927'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('3a7bf080-e564-4bb8-bf0c-a45ace7709f6',0,{ts '2018-12-06 11:50:59.693'},{ts '2018-12-06 12:39:02.303'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('56ab78f1-2820-4f1c-9404-5cdf7ac9c12f',0,{ts '2018-12-06 12:58:13.037'},{ts '2018-12-06 13:22:54.910'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7ee3e11a-8eea-458a-8756-8f35a40d926b',0,{ts '2018-12-10 08:18:38.197'},{ts '2018-12-10 10:34:02.650'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('f52692ff-9b7d-46f9-92dd-a1b2cfeffe43',0,{ts '2018-12-10 11:08:56.870'},{ts '2018-12-10 11:17:31.783'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('bd61a981-522e-4ca8-9468-66e6a7f9d516',0,{ts '2018-12-10 11:43:22.643'},{ts '2018-12-10 11:43:22.857'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('5e99e03e-ad18-488b-844d-6750f5131c1b',0,{ts '2018-12-10 12:07:03.693'},{ts '2018-12-10 14:00:16.517'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('930f3638-8ab6-4aa3-bc9d-ab8e6a632f16',0,{ts '2018-12-10 14:04:03.230'},{ts '2018-12-10 14:35:47.100'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('d5ec67f6-14ce-4fa5-9848-66b7e86ee82a',0,{ts '2018-12-11 08:42:51.180'},{ts '2018-12-11 09:06:22.283'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('5eceeaf3-81f6-4b74-ae3b-9169bac78c26',0,{ts '2018-12-11 09:27:07.593'},{ts '2018-12-11 09:33:56.553'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('fe2bd0a9-2f50-45c8-bbbe-caa52a21c872',0,{ts '2018-12-11 11:00:44.563'},{ts '2018-12-11 11:02:57.493'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('9a169581-2b30-41b6-96a3-60f526a1e294',0,{ts '2018-12-11 11:24:40.997'},{ts '2018-12-11 11:25:48.687'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('1139357d-deee-4a05-bc2d-f343f4f8b6b1',0,{ts '2018-12-11 11:55:48.157'},{ts '2018-12-11 13:42:41.697'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('4b1a3cb9-9abc-41ad-bd6c-b39b9c88d3b9',0,{ts '2018-12-12 07:51:38.860'},{ts '2018-12-12 07:51:38.860'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('73943671-2735-41dd-a890-91765c26c351',0,{ts '2018-12-12 08:30:15.337'},{ts '2018-12-12 09:29:22.587'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('0c3a7964-4ab5-49d6-949e-10614d382f5a',0,{ts '2018-12-12 09:50:26.147'},{ts '2018-12-12 09:50:26.350'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7d955fb3-0139-46a8-8ed4-a7c4b2a5d839',0,{ts '2018-12-12 10:31:42.637'},{ts '2018-12-12 10:49:36.747'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('6cd1f3f4-7212-4c8c-9cca-d664dc92dd97',0,{ts '2018-12-15 17:30:35.360'},{ts '2018-12-15 17:33:25.273'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('2fa0a6b4-5518-4b39-89a3-148dbc5d7832',0,{ts '2018-12-17 09:27:25.997'},{ts '2018-12-17 10:20:12.910'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('38cab684-d91d-4b1a-ba35-fe640170e57f',0,{ts '2018-12-17 11:01:38.733'},{ts '2018-12-17 11:19:54.927'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('839d71a7-9d81-42a2-862b-f8e006db9eee',0,{ts '2018-12-28 11:14:24.430'},{ts '2018-12-28 11:14:24.553'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('e81405fe-9b01-4c7b-8928-e4ae45ddf790',0,{ts '2018-12-28 11:55:01.927'},{ts '2018-12-28 13:33:32.100'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('be035e2d-682d-4030-b1d3-58feee992eb2',0,{ts '2019-01-02 16:09:19.713'},{ts '2019-01-02 16:38:27.923'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('6d3dd294-1674-4e30-bd84-2243d1b12fb8',0,{ts '2019-01-03 12:53:04.480'},{ts '2019-01-03 13:21:45.887'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('b98792d0-fea7-449f-8035-caac3ac788eb',0,{ts '2019-01-03 16:35:34.397'},{ts '2019-01-03 16:35:34.637'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('08346723-27ea-4fa6-a9b3-49dd72d41fbd',0,{ts '2019-01-03 18:01:32.180'},{ts '2019-01-03 18:02:48.190'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('44a282aa-c1b0-45d5-aad7-ffe165675a02',0,{ts '2019-01-03 20:14:38.123'},{ts '2019-01-03 20:19:34.327'},NULL,N'::1');
GO
SET IDENTITY_INSERT [umbracoUserStartNode] OFF;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [PK_cmsMedia] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAudit] ADD CONSTRAINT [PK_umbracoAudit] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoConsent] ADD CONSTRAINT [PK_umbracoConsent] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLock] ADD CONSTRAINT [PK_umbracoLock] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMigration] ADD CONSTRAINT [PK_umbracoMigration] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [PK_user2userGroup] PRIMARY KEY ([userId],[userGroupId]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [PK_userGroup2App] PRIMARY KEY ([userGroupId],[app]);
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY ([userGroupId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY ([sessionId]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [PK_userStartNode] PRIMARY KEY ([id]);
GO
CREATE UNIQUE INDEX [IX_cmsContent] ON [cmsContent] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentType] ON [cmsContentType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE INDEX [IX_cmsContentVersion_ContentId] ON [cmsContentVersion] ([ContentId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentVersion_VersionId] ON [cmsContentVersion] ([VersionId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDataType_nodeId] ON [cmsDataType] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDictionary_id] ON [cmsDictionary] ([id] ASC);
GO
CREATE INDEX [IX_cmsDictionary_key] ON [cmsDictionary] ([key] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDocument] ON [cmsDocument] ([nodeId] ASC,[versionId] ASC);
GO
CREATE INDEX [IX_cmsDocument_newest] ON [cmsDocument] ([newest] ASC);
GO
CREATE INDEX [IX_cmsDocument_published] ON [cmsDocument] ([published] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacro_UniqueId] ON [cmsMacro] ([uniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroPropertyAlias] ON [cmsMacro] ([macroAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_Alias] ON [cmsMacroProperty] ([macro] ASC,[macroPropertyAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [cmsMacroProperty] ([uniquePropertyId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMedia] ON [cmsMedia] ([nodeId] ASC,[versionId] ASC,[mediaPath] ASC);
GO
CREATE INDEX [IX_cmsMember_LoginName] ON [cmsMember] ([LoginName] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyData_1] ON [cmsPropertyData] ([contentNodeId] ASC,[versionId] ASC,[propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyTypeAlias] ON [cmsPropertyType] ([Alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeUniqueID] ON [cmsPropertyType] ([UniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [cmsPropertyTypeGroup] ([uniqueID] ASC);
GO
CREATE INDEX [IX_cmsTags] ON [cmsTags] ([tag] ASC,[group] ASC);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId] ON [cmsTemplate] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccess_nodeId] ON [umbracoAccess] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccessRule] ON [umbracoAccessRule] ([ruleValue] ASC,[ruleType] ASC,[accessId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode] ON [umbracoLanguage] ([languageISOCode] ASC);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoMigration] ON [umbracoMigration] ([name] ASC,[version] ASC);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE INDEX [IX_umbracoNodePath] ON [umbracoNode] ([path] ASC);
GO
CREATE INDEX [IX_umbracoNodeTrashed] ON [umbracoNode] ([trashed] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoNodeUniqueID] ON [umbracoNode] ([uniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRedirectUrl] ON [umbracoRedirectUrl] ([urlHash] ASC,[contentKey] ASC,[createDateUtc] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelation_parentChildType] ON [umbracoRelation] ([parentId] ASC,[childId] ASC,[relType] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_alias] ON [umbracoRelationType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_name] ON [umbracoRelationType] ([name] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_UniqueId] ON [umbracoRelationType] ([typeUniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_computerName] ON [umbracoServer] ([computerName] ASC);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupAlias] ON [umbracoUserGroup] ([userGroupAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupName] ON [umbracoUserGroup] ([userGroupName] ASC);
GO
CREATE INDEX [IX_umbracoUser2NodePermission_nodeId] ON [umbracoUserGroup2NodePermission] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserStartNode_startNodeType] ON [umbracoUserStartNode] ([startNodeType] ASC,[startNode] ASC,[userId] ASC);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY ([ParentId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY ([startNode]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

