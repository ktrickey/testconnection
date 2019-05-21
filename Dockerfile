FROM mcr.microsoft.com/dotnet/core/sdk:2.2-bionic AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-bionic AS build
WORKDIR /src

#ideally these should be changed to nuget packages which would enable them to be pulled via the dotnet restore command for Barnacle.net.csproj
COPY ["TestConnection/TestConnection.csproj", "TestConnection/"]

RUN dotnet restore "TestConnection/TestConnection.csproj"

COPY . .

WORKDIR /src/TestConnection

FROM build AS publish
RUN dotnet publish "TestConnection.csproj" -c Release -o /app

FROM base AS final

WORKDIR /app
COPY --from=publish /app .

ENTRYPOINT ["dotnet","TestConnection.dll"]