# cpp-base-image
A docker file to generate an image with all the basic C++ development tools along with vcpkg and boost library.

> Edit the dockerfile as per your need if you want only some of the development tools from the list

## Base Image & Package Details:
- Base-Image : Ubuntu 20.10
## Packages:
- build-essential ( gcc,g++,make etc)
- cmake
- git
- curl
- zip unzip
- vcpkg
## Libraries
- boost (x64 triplet)


## Image URL
Run the following command
`docker pull gk487/cpp-base-image`


> Note : If you are using the container as a development environment for VS-Code run `/vcpkg/vcpkg integrate install`. This will apply a user-wide integrate of the libraries