FROM arm64v8/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    libudev-dev \
    libusb-1.0-0-dev \
    libboost-all-dev \
    libfuse2 \
    fuse3 \
    qt5-default \
    qttools5-dev \
    qtdeclarative5-dev \
    libqt5svg5-dev \
    libqt5opengl5-dev \
    cmake \
    qml-module-qtquick2 \
    qml-module-qtquick-extras \
    qml-module-qtquick-window2 \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-controls \
    qml-module-qtgraphicaleffects \
    qml-module-qtquick-dialogs \
    qml-module-qt-labs-settings \
    qml-module-qt-labs-folderlistmodel \
    qml-module-qtqml-models2 \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone and build libsmu
RUN git clone https://github.com/sounddrill31/libsmu.git && \
    cd libsmu && \
    mkdir build && cd build && \
    cmake -DBUILD_PYTHON=OFF -DCMAKE_INSTALL_PREFIX=/usr/ .. && \
    make && \
    make install && \
    cd ../..

# Create AppDir structure
RUN mkdir -p AppDir/usr/bin && \
    mkdir -p AppDir/usr/lib && \
    mkdir -p AppDir/usr/lib/aarch64-linux-gnu/ && \
    mkdir -p AppDir/usr/share/icons/hicolor/apps/scalable && \
    mkdir -p AppDir/usr/share/applications && \
    mkdir -p AppDir/usr/share/pixelpulse2/

# Copy libraries (adjusted for ARM64)
RUN  echo "Printing files inside /usr/lib/aarch64-linux-gnu" && \
     ls /usr/lib/aarch64-linux-gnu
     echo "Done"
    cp /usr/lib/aarch64-linux-gnu/libsmu.so.1.0.4 AppDir/usr/lib/aarch64-linux-gnu/ && \
    ln -s libsmu.so.1.0.4 AppDir/usr/lib/aarch64-linux-gnu/libsmu.so.1 && \
    ln -s libsmu.so.1.0.4 AppDir/usr/lib/aarch64-linux-gnu/libsmu.so

# Copy system libraries
RUN cp /usr/lib/aarch64-linux-gnu/libudev.so.1 AppDir/usr/lib/ && \
    cp /usr/lib/aarch64-linux-gnu/libusb-1.0.so.0 AppDir/usr/lib/

# Download and prepare AppImage tools
RUN wget -O linuxdeploy.AppImage https://github.com/linuxdeploy/linuxdeploy/releases/download/2.0.0-alpha-1-20241106/linuxdeploy-aarch64.AppImage && \
    wget -O linuxdeploy-plugin-qt.AppImage https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/2.0.0-alpha-1-20241106/linuxdeploy-plugin-qt-aarch64.AppImage && \
    chmod +x linuxdeploy*.AppImage

# Set environment variables for Qt modules
ENV EXTRA_QT_MODULES="quick graphicaleffects"

# Build AppImage 
RUN ARCH=aarch64 \
    VERSION=1.0 \
    ./linuxdeploy.AppImage \
    --appdir AppDir \
    --plugin qt \
    --output appimage -i debian/*.png

# Keep container running for file copy
CMD ["tail", "-f", "/dev/null"]