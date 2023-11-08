FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["FTL_attendance_server.csproj", "."]
RUN dotnet restore "FTL_attendance_server.csproj"
COPY . .
RUN dotnet build "FTL_attendance_server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "FTL_attendance_server.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FTL_attendance_server.dll"]