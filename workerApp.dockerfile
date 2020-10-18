#Build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /app
COPY workerApp ./
RUN dotnet restore
RUN dotnet publish -c Release -o out
#Runtime
FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT [ "dotnet","workerApp.dll" ]