FROM microsoft/dotnet:2.2-sdk AS build-env

WORKDIR /publish
ENTRYPOINT ["dotnet", "authService.DbUp.dll"]
COPY ./publish /publish
