FROM microsoft/dotnet:2.2-sdk AS build-env


COPY ./publish /publish
WORKDIR /publish
EXPOSE 5000

ENTRYPOINT ["dotnet", "authService.IdentityServer.dll"]
