FROM mcr.microsoft.com/dotnet/core-nightly/sdk:3.1.100 as build
WORKDIR /app


COPY src/MyWeb/MyWeb.csproj .
RUN dotnet restore

COPY src src
RUN dotnet build src/MyWeb

FROM build as publish
WORKDIR /app
RUN dotnet publish src/MyWeb -c Release -o /app -r linux-x64

FROM mcr.microsoft.com/dotnet/core-nightly/runtime:3.1 AS runtime

ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV PORT=80
ENV ASPNETCORE_URLS=http://+:${PORT}

WORKDIR /app
COPY --from=publish /app .

CMD dotnet MyWeb.dll