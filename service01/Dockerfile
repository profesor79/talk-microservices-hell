FROM mcr.microsoft.com/dotnet/core/sdk:3.0

COPY ./publish  publish
EXPOSE 80
EXPOSE 5000
EXPOSE 5001
WORKDIR /publish
ENTRYPOINT ["dotnet", "service01.dll"]

