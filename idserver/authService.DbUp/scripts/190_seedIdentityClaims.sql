

insert into [dbo].[IdentityResources](
       [Enabled]
      ,[Name]
      ,[Required]
      ,[Emphasize]
      ,[ShowInDiscoveryDocument]
      ,[Created]
      ,[NonEditable]
 )
  values (
--[Enabled] [bit] NOT NULL,
1
--[Name] [nvarchar](200) NOT NULL,
,'openid'
--[Required] [bit] NOT NULL,
,1
--[Emphasize] [bit] NOT NULL,
,0
--[ShowInDiscoveryDocument] [bit] NOT NULL,
,0
--[Created] [datetime2](7) NOT NULL,
,GETUTCDATE()
--[NonEditable] [bit] NOT NULL
,0
	)
	
declare @insertedId int 
set @insertedId = (SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]); 
INSERT INTO [dbo].[IdentityClaims](
	
	[Type]
	,[IdentityResourceId] 
	)
	VALUES (
  --[Type] [nvarchar](200) NOT NULL,
	'sub'
	--[IdentityResourceId] [int] NOT NULL
	,@insertedId
	), (
  --[Type] [nvarchar](200) NOT NULL,
	'email'
	--[IdentityResourceId] [int] NOT NULL
	,@insertedId
	) ,  ('aud', @insertedId );
	
	
--profile token definition

insert into [dbo].[IdentityResources](
       [Enabled]
      ,[Name]
      ,[Required]
      ,[Emphasize]
      ,[ShowInDiscoveryDocument]
      ,[Created]
      ,[NonEditable]
 )
  values (
--[Enabled] [bit] NOT NULL,
1
--[Name] [nvarchar](200) NOT NULL,
,'profile'
--[Required] [bit] NOT NULL,
,1
--[Emphasize] [bit] NOT NULL,
,0
--[ShowInDiscoveryDocument] [bit] NOT NULL,
,0
--[Created] [datetime2](7) NOT NULL,
,GETUTCDATE()
--[NonEditable] [bit] NOT NULL
,0
	)
	
/*

birthdate

family_name
gender
locale
middle_name
name
nickname
picture
preferred_username
profile
sub
updated_at
website
zoneinfo
 
 */
set @insertedId = (SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]); 
INSERT INTO [dbo].[IdentityClaims]([Type], [IdentityResourceId])
	VALUES ('email', @insertedId	), 
	       ('name', @insertedId ),
	       ('aud', @insertedId ),
	       ('sub', @insertedId ),
	       ('updated_at', @insertedId );
	       
	       