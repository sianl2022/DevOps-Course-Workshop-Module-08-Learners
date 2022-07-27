FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
COPY . /dotnetapp
WORKDIR /dotnetapp
RUN dotnet build
WORKDIR /dotnetapp/DotnetTemplate.Web
RUN apt-get update && apt-get install -y build-essential
RUN npm install
RUN npm run build
ENTRYPOINT ["dotnet", "run"]