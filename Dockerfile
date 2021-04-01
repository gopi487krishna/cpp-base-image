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

#copy prebuilt installation ( you need to have the prebuilt installation with downloads and buildtrees deleted)
COPY vcpkg /
