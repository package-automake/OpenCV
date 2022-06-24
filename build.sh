mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=$2 \
    -D CMAKE_INSTALL_PREFIX=./install \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D BUILD_ANDROID_PROJECTS=OFF \
    -D BUILD_ANDROID_EXAMPLES=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_WITH_DEBUG_INFO=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_JAVA=OFF \
    -D BUILD_opencv_apps=OFF \
    -D BUILD_opencv_datasets=OFF \
    -D BUILD_opencv_freetype=OFF \
    -D BUILD_opencv_gapi=OFF \
    -D BUILD_opencv_java_bindings_generator=OFF \
    -D BUILD_opencv_js=OFF \
    -D BUILD_opencv_js_bindings_generator=OFF \
    -D BUILD_opencv_objc_bindings_generator=OFF \
    -D BUILD_opencv_python_bindings_generator=OFF \
    -D BUILD_opencv_python_tests=OFF \
    -D BUILD_opencv_ts=OFF \
    -D WITH_QT=OFF \
    -D WITH_FREETYPE=OFF \
    -D ENABLE_CXX11=1 \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D WITH_GSTREAMER=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
    -D BUILD_SHARED_LIBS=ON ../opencv

make -j4 && make install && cd ..