#Build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /app
COPY webApp ./
RUN dotnet restore
RUN dotnet publish -c Release -o out
#Runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80
ENTRYPOINT ["dotnet","webApp.dll"]