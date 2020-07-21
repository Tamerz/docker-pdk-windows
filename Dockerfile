FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

ARG PDK_VERSION=1.18.1.0
ARG GIT_VERSION=2.27.0

RUN choco install git --version %GIT_VERSION% -y
RUN choco install pdk --version %PDK_VERSION% -y

# Disable PDK analytics
COPY analytics.yml C:/Users/ContainerAdministrator/AppData/Local/puppet/
