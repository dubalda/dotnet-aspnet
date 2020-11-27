FROM mcr.microsoft.com/dotnet/core/aspnet:2.2

ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -yqq --no-install-recommends \
      apt-utils \
      git \
      libc6-dev \
      libgdiplus \
      tree \
      rsync && \
    apt-get clean && \
    ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    cat /etc/os-release && \
    dotnet --info
