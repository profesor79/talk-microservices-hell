FROM mcr.microsoft.com/dotnet/core/sdk:3.0

EXPOSE 80
EXPOSE 443
WORKDIR /publish
ENTRYPOINT ["dotnet", "service01.dll"]

COPY ./publish  publish
