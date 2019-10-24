/*

CREATE TABLE [__schema__].[__table__](
	[RowId] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[PublicId] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[VersionId] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[UtcTimeCreated] [datetime2](7) NOT NULL DEFAULT GETUTCDATE(),
	[CreatedBy] [nvarchar](150) NOT NULL,
	[CreatedById] [nvarchar](150) NULL,
	[BrowserData] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[ExtendedDataInJson] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


 */
