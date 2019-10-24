namespace pegasus.Common.Contracts.Configuration
{
  public class DockerAuthServiceConfiguration 
  {
    /// <inheritdoc />
    public string CommandConnectionString { get; set; } =
      "Server=tcp:sqllinux,1433;Initial Catalog=ne-sql-auth-service-dev;Persist Security Info=False;User ID=ne-sql-auth-service-command;Password=P@s$$w00rD--**///***--;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;";

    /// <inheritdoc />
    public string QueryConnectionString { get; set; } =
      "Server=tcp:sqllinux,1433;Initial Catalog=ne-sql-auth-service-dev;Persist Security Info=False;User ID=ne-sql-auth-service-command;Password=P@s$$w00rD--**///***--;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;";

    /// <inheritdoc />
    public string MasterCommandConnectionString { get; set; } =
      "Server=sqllinux;Database=master;Persist Security Info=False;User ID=sa;Password=<YourStrong!Passw0rd>;";
  }
}