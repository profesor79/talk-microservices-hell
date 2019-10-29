insert  into 
 [dbo].[Clients] (	 
 [Enabled]
,[ClientId]
,[ProtocolType]
,[RequireClientSecret]
,[ClientName]
,[RequireConsent]
,[AllowRememberConsent] 
,[AlwaysIncludeUserClaimsInIdToken] 
,[RequirePkce]
,[AllowPlainTextPkce]
,[AllowAccessTokensViaBrowser]
,[FrontChannelLogoutSessionRequired]
,[BackChannelLogoutSessionRequired]
,[AllowOfflineAccess]
,[IdentityTokenLifetime]
,[AccessTokenLifetime] 
,[AuthorizationCodeLifetime]
,[AbsoluteRefreshTokenLifetime]
,[SlidingRefreshTokenLifetime]
,[RefreshTokenUsage]
,[UpdateAccessTokenClaimsOnRefresh]
,[RefreshTokenExpiration]
,[AccessTokenType]
,[EnableLocalLogin]
,[IncludeJwtId]
,[AlwaysSendClientClaims]
,[Created]
,[DeviceCodeLifetime]
,[NonEditable]
)
VALUES
(
--[Enabled]
1
--,[ClientId]
,'Next'
--,[ProtocolType]
,'oidc'
--,[RequireClientSecret]
,0 --insecure client
--,[ClientName]
,'Next'
--,[RequireConsent]
,0
--,[AllowRememberConsent] 
,1
--,[AlwaysIncludeUserClaimsInIdToken] 
,1
--,[RequirePkce] [bit] NOT NULL,
,0
--,[AllowPlainTextPkce] [bit] NOT NULL,
,0
--,[AllowAccessTokensViaBrowser] [bit] NOT NULL,
,1
--,[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
,1
--,[BackChannelLogoutSessionRequired] [bit] NOT NULL,
,1
--,[AllowOfflineAccess] [bit] NOT NULL,
,1
--,[IdentityTokenLifetime] [int] NOT NULL,
,300
--,[AccessTokenLifetime] [int] NOT NULL,
,3600
--,[AuthorizationCodeLifetime] [int] NOT NULL,
,300
--,[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
,2592000
--,[SlidingRefreshTokenLifetime] [int] NOT NULL,
,1296000
--,[RefreshTokenUsage] [int] NOT NULL,
,1
--,[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
,0
--,[RefreshTokenExpiration] [int] NOT NULL,
,1
--,[AccessTokenType] [int] NOT NULL,
,0
--,[EnableLocalLogin] [bit] NOT NULL,
,1
--,[IncludeJwtId] [bit] NOT NULL,
,0
--,[AlwaysSendClientClaims] [bit] NOT NULL,
,0
--,[Created] [datetime2](7) NOT NULL,
,GETUTCDATE()  
--,[DeviceCodeLifetime] [int] NOT NULL,
,300
--,[NonEditable] [bit] NOT NULL
,0
)
    
 -- get insterted client id and add claims to it
 
declare @insertedId int 
set @insertedId = (SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]);  
    
   insert into  [dbo].[ClientGrantTypes](
	[GrantType]
,	[ClientId]  
)
values (
--	[GrantType] [nvarchar](250) NOT NULL,
'implicit'
--	[ClientId] [int] NOT NULL 
 ,@insertedId)   
   , (
--	[GrantType] [nvarchar](250) NOT NULL,
'password'
--	[ClientId] [int] NOT NULL 
 ,@insertedId)   
    
  -- add redirect uri
 insert into  [dbo].[ClientPostLogoutRedirectUris](
	[PostLogoutRedirectUri]
	,[ClientId]
)
values(
--	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
'https://www.nosite.info'
--	[ClientId] [int] NOT NULL(
,@insertedId
);

insert into  [dbo].[ClientRedirectUris](
	[RedirectUri]
	,[ClientId]
)
values(
--	[RedirectUri] [nvarchar](2000) NOT NULL,
'https://www.nositenext.info'
--	[ClientId] [int] NOT NULL(
,@insertedId
);

insert into [dbo].[ClientScopes](
	 [Scope]
	,[ClientId]
)
values(
--	[Scope] [nvarchar](200) NOT NULL,
  'Application'
--	[ClientId] [int] NOT NULL
,@insertedId
),(
--	[Scope] [nvarchar](200) NOT NULL,
  'AdminApplication'
--	[ClientId] [int] NOT NULL
,@insertedId
),(
--	[Scope] [nvarchar](200) NOT NULL,
  'openid'
--	[ClientId] [int] NOT NULL
,@insertedId
),(
--	[Scope] [nvarchar](200) NOT NULL,
  'profile'
--	[ClientId] [int] NOT NULL
,@insertedId
);
