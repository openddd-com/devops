FROM ubuntu:20.04
# https://github.com/kivy/python-for-android
# Dockerfile with:
#   - Android build environment
#   - python-for-android dependencies
#
# Build with:
#     docker build --tag=p4a  --file Dockerfile.kivy .
#
# Run with:
#     docker run -it --rm p4a /bin/sh -c '. venv/bin/activate && p4a apk --help'
#
# Or for interactive shell:
#     docker run -it --rm p4a
#
# Note:
#     Use 'docker run' without '--rm' flag for keeping the container and use
#     'docker commit <container hash> <new image>' to extend the original image

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# configure locale
RUN apt update -qq > /dev/null && apt install -qq --yes --no-install-recommends \
    locales && \
    locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

RUN apt -y update -qq > /dev/null && apt -y install -qq --no-install-recommends \
        #支持请求easy-to-use client-side URL transfer library (OpenSSL flavour)                
        libcurl4 curl wget \
        #支持https请求
        ca-certificates 

# retry helper script, refs:
# https://github.com/kivy/python-for-android/issues/1306
ENV RETRY="retry -t 3 --"
COPY ./.devcontainer/retry.sh /usr/local/bin/retry
RUN  chmod +x /usr/local/bin/retry

ENV USER="user"
ENV HOME_DIR="/home/${USER}"
ENV WORK_DIR="${HOME_DIR}/app" \
    PATH="${HOME_DIR}/.local/bin:${PATH}" \
    ANDROID_HOME="${HOME_DIR}/.android" \
    JAVA_HOME="/usr/lib/jvm/java-13-openjdk-amd64"

RUN dpkg --add-architecture i386 \
    && ${RETRY} apt -y update -qq > /dev/null \
    && ${RETRY} apt -y install -qq --no-install-recommends \    
        # (devel): automatic configure script builder
        autoconf \
        #(devel): Tool for generating GNU Standards-compliant Makefiles
        automake \
        #(devel): Informational list of build-essential packages
        build-essential \
        #(devel): Compiler cache for fast recompilation of C/C++ code
        ccache \
        #(devel): cross-platform, open-source make system
        cmake \
        #(devel): GNU Internationalization utilities
        gettext \
        #(vcs): fast, scalable, distributed revision control system
        git \
        # (utils): fast, multi-threaded bzip2 utility 
        lbzip2 \
        #(libdevel): Foreign Function Interface library (development files)
        libffi-dev \
        #(libs): GTK+ graphical user interface library
        libgtk2.0-0:i386 \
        #(libs): GNU Libidn library, implementation of IETF IDN specifications
        libidn11:i386 \
        #(libdevel): System independent dlopen wrapper for GNU libtool
        libltdl-dev \
        # (libs): shared libraries for terminal handling
        libncurses5:i386 \
        #(oldlibs): pango library X backend [universe]
        libpangox-1.0-0:i386 \
        #(libs): Layout and rendering of internationalized text
        libpangoxft-1.0-0:i386 \
        #(libs): GNU Standard C++ Library v3
        libstdc++6:i386 \
        #(devel): Generic library support script
        libtool \
        #(java): OpenJDK Development Kit (JDK),for android7+
        openjdk-13-jdk \
        # (utils): Apply a diff file to an original
        patch \
        # (devel): manage compile and link flags for libraries
        pkg-config \
        #(python): interactive high-level object-oriented language (default version)
        python3 \
        python3-dev \
        python3-pip \
        python3-venv \
        #(admin): Provide limited super user privileges to specific users
        sudo \
        #(utils): De-archiver for .zip files
        zip unzip \
        #(python): Python virtual environment creator
        virtualenv \
        #(libs): compression library - runtime &- development
        zlib1g-dev zlib1g:i386 \
        #自符串处理
        jq \
        git \
        #支持ping,tracepath,arping,tftpd,rarpd,clockdiff,rdisc
        iputils-ping \
        #library to determine the call-chain of a program - runtime
        libunwind8 \
        #TCP/IP swiss army knife -- transitional package
        netcat \       
        #GNU C compiler
        gcc \
        #package management related utility programs
        apt-utils \
        #tool for creating machine images for multiple platforms
        packer \
        awscli \
        # mysql-client
        mysql-client \
        libmysqlclient-dev  
      
# prepare non root env
# RUN useradd --create-home --shell /bin/bash ${USER}
      
# # manage the repositories that you install software from (common) \    
# RUN apt-get install -y --no-install-recommends software-properties-common \    
#     && add-apt-repository ppa:deadsnakes/ppa \
#     && apt-get update \
#     && apt-get install -y --no-install-recommends \
#         python3.7-dev \
#         python3-pip

RUN apt-get install -y --no-install-recommends \
    sudo \    
    && useradd --create-home --shell /bin/bash ${USER} \
    && usermod -append --groups sudo ${USER} \   
    && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 

WORKDIR ${WORK_DIR}
RUN mkdir ${ANDROID_HOME} && chown --recursive ${USER} ${HOME_DIR} ${ANDROID_HOME}

USER ${USER}

# COPY ./.devcontainer/android.mk /tmp/android.mk
# RUN make --file /tmp/android.mk target_os=linux \
#     && sudo rm /tmp/android.mk

# install python-for-android from current branch
# COPY --chown=user:user Makefile README.md setup.py pythonforandroid/__init__.py ${WORK_DIR}/
# RUN mkdir pythonforandroid \
#     && mv __init__.py pythonforandroid/ \
#     && make virtualenv \
#     && rm -rf ~/.cache/

# COPY --chown=user:user . ${WORK_DIR}