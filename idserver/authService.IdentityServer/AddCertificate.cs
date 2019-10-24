using System;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using Microsoft.Extensions.DependencyInjection;

namespace authService.IdentityServer
{
    public static class AddCertificate
    {
        public static void AddCertificateFromFile(
            this IIdentityServerBuilder builder
            )
        {
            var keyFilePath = "certificate.pfx";
            var keyFilePassword = "pegasus";

            if (File.Exists(keyFilePath))
            {
                Console.WriteLine($"SigninCredentialExtension adding key from file {keyFilePath}");
                // You can simply add this line in the Startup.cs if you don't want an extension.
                // This is neater though ;)
                builder.AddSigningCredential(new X509Certificate2(keyFilePath, keyFilePassword));
            }
            else
            {
                Console.WriteLine($"SigninCredentialExtension cannot find key file {keyFilePath}");
            }
        }
    }
}
