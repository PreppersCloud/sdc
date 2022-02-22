FROM debian:bullseye-slim
LABEL maintainer "Preppers Cloud Team <team@preppers.cloud>"
ENV TZ UTC
ARG DEBIAN_FRONTEND=noninteractive
#-------------------------------------------------
# Application packages
#-------------------------------------------------
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
        apt-utils locales curl software-properties-common zip unzip gnupg2 wget mc htop jq
#-------------------------------------------------
# Set locale
#-------------------------------------------------
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
#-------------------------------------------------
# Clean image
#-------------------------------------------------
USER root
RUN apt-get clean autoclean && apt-get purge -y --auto-remove && rm -rf /var/lib/{apt,dpkg,cache,log}/
CMD bash
