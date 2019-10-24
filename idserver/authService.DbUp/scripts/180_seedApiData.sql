 
  insert into [dbo].[ApiResources]
  (
  [Enabled] 
	,[Name] 
	,[Created] 
	,[NonEditable]
) values 
(
 -- [Enabled] [bit] NOT NULL,
1
--	[Name] [nvarchar](200) NOT NULL,
,'PegasusApplication'
--	[Created] [datetime2](7) NOT NULL,
,GETUTCDATE()
--	[NonEditable] [bit] NOT NULL
,0
)

declare @insertedId int 
set @insertedId = (SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]); 


insert into  [dbo].[ApiScopes](
	
	[Name] 
	,[Required] 
	,[Emphasize]
	,[ShowInDiscoveryDocument]
	,[ApiResourceId]
) values (
--[Name] [nvarchar](200) NOT NULL,
'PegasusApplication'
--[Required] [bit] NOT NULL,
,0
--[Emphasize] [bit] NOT NULL,
,0
--[ShowInDiscoveryDocument] [bit] NOT NULL,
,0
--[ApiResourceId] [int] NOT NULL
,@insertedId
)

 
  insert into [dbo].[ApiResources]
  (
  [Enabled] 
	,[Name] 
	,[Created] 
	,[NonEditable]
) values 
(
 -- [Enabled] [bit] NOT NULL,
1
--	[Name] [nvarchar](200) NOT NULL,
,'PegasusAdminApplication'
--	[Created] [datetime2](7) NOT NULL,
,GETUTCDATE()
--	[NonEditable] [bit] NOT NULL
,0
)


set @insertedId = (SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]); 


insert into  [dbo].[ApiScopes](
	
	[Name] 
	,[Required] 
	,[Emphasize]
	,[ShowInDiscoveryDocument]
	,[ApiResourceId]
) values (
--[Name] [nvarchar](200) NOT NULL,
'PegasusAdminApplication'
--[Required] [bit] NOT NULL,
,0
--[Emphasize] [bit] NOT NULL,
,0
--[ShowInDiscoveryDocument] [bit] NOT NULL,
,0
--[ApiResourceId] [int] NOT NULL
,@insertedId
)