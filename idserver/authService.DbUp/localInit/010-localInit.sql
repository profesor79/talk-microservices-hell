If not Exists (select loginname  from master.dbo.syslogins
    where name = 'ne-sql-auth-service-query' )
Begin

create LOGIN  [ne-sql-auth-service-query] WITH PASSWORD = 'P@s$$w00rD--**///***--'


EXEC master..sp_addsrvrolemember @loginame = N'ne-sql-auth-service-query', @rolename = N'datareader'


End

If not Exists (select loginname  from master.dbo.syslogins
    where name = 'ne-sql-auth-service-command' )
Begin
create LOGIN  [ne-sql-auth-service-command] WITH PASSWORD = 'P@s$$w00rD--**///***--'
EXEC master..sp_addsrvrolemember @loginame = N'ne-sql-auth-service-command', @rolename = N'sysadmin'
End

