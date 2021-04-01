FROM ubuntu:20.10

# To prevent tzdata from hanging the container
# Modify this as per your timezon if needed
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Basic C++ Development tools -- cmake, g++, gcc, make, git, curl, zip, unzip etc.
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    zip \
    unzip \
    pkg-config \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# vcpkg installation script
COPY vcpkg_install_script.sh /tmp/

RUN chmod +x /tmp/vcpkg_install_script.sh \
    && /tmp/vcpkg_install_script.sh && rm /tmp/vcpkg_install_script.sh

# Boost Installation (x64-triplet)
RUN /vcpkg/vcpkg install boost:x64-linux

COPY vcpkg_clean_script.sh /tmp/
# Remove the unnecessary downloads and build trees (clears out about 2gigs)
RUN chmod +x /tmp/vcpkg_clean_script.sh && /tmp/vcpkg_clean_script.sh && rm /tmp/vcpkg_clean_script.sh
