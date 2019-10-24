using System;
using System.IO;
using System.Reflection;
using System.Threading;
using DbUp;
using Microsoft.Extensions.Configuration;
using pegasus.Common.Contracts.Configuration;
using Serilog;


namespace Pegasus.DbUp
{
    public static class Program
    {
        public static int Main(string[] args)
        {
            var servicName = "auth-service-db-up";
            DockerAuthServiceConfiguration configuration;
                configuration = new DockerAuthServiceConfiguration();
                var masterConnectionString = configuration.MasterCommandConnectionString;
                DeployChanges.To.SqlDatabase(masterConnectionString)
                    .JournalToSqlTable("dbo",servicName)
                    .WithScriptsFromFileSystem(@"localInit", s => s.Contains($"sql")).LogToConsole().Build()
                    .PerformUpgrade();
            
            var connectionString = configuration.CommandConnectionString;
            Log.Information(connectionString);

            var upgrader = DeployChanges.To.SqlDatabase(connectionString).JournalToSqlTable("dbo", "Migrations")
                .WithScriptsAndCodeEmbeddedInAssembly(
                    Assembly.GetExecutingAssembly(), s => s.Contains($"sql"))
                .WithTransactionPerScript()
                .LogToConsole().WithExecutionTimeout(new TimeSpan(0, 0, 90)).Build();

            upgrader.TryConnect(out var message);
            Log.Information(message);
            var result = upgrader.PerformUpgrade();
            Log.Information(result?.Error?.Message);
            Log.Information("finished");
            
            return result?.Error == null ? 0 : 1;
        }
    }
}
