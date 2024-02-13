# template from docs


#Instruction	    Description

#ADD	            Add local or remote files and directories.
#ARG	            Use build-time variables.
#CMD	            Specify default commands.
#COPY	            Copy files and directories.
#ENTRYPOINT	        Specify default executable.
#ENV	            Set environment variables.
#EXPOSE	            Describe which ports your application is listening on.
#FROM	            Create a new build stage from a base image.
#HEALTHCHECK	    Check a container's health on startup.
#LABEL	            Add metadata to an image.
#MAINTAINER	        Specify the author of an image.
#ONBUILD	        Specify instructions for when the image is used in a build.
#RUN	            Execute build commands.
#SHELL	            Set the default shell of an image.
#STOPSIGNAL	        Specify the system call signal for exiting a container.
#USER	            Set user and group ID.
#VOLUME	            Create volume mounts.
#WORKDIR	        Change working directory.



# used base-image
FROM debian:latest

LABEL Name=repo Version=0.0.1

# change directory within the container
WORKDIR /home/gmod

# update packages and install prerequisites for gmod
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y lib32gcc1 wget tar \
    && apt-get clean


# download SteamCMD and install gmod
RUN wget -O steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz

# port forwarding for the needed ports for steam server
EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27005/tcp
EXPOSE 27005/udp

CMD ["./home/gmod/srcds_run", "-game garrysmod", "-console", "+maxplayers 16", "+map gm_construct"]

