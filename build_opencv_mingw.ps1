function BuildForWindows($platform, $build_type, $generate_flag) {
    $build_dir = "build"
    mkdir $build_dir -Force -ErrorAction Stop | Out-Null
    cd $build_dir
    pwd

    $msmf_flag = "OFF"
    $platform_flag = "-m32"
    
    if ($generate_flag -eq "world") {
        $world_flag = "ON"
    }
    else {
        $world_flag = "OFF"
    }

    if ($platform -eq "x64") {
        $platform_flag = "-m64"
    }


    cmake -G "MinGW Makefiles" `
        -D CMAKE_C_FLAGS=$platform_flag `
        -D CMAKE_CXX_FLAGS=$platform_flag `
        -D CMAKE_BUILD_TYPE=${build_type} `
        -D CMAKE_INSTALL_PREFIX=install `
        -D INSTALL_C_EXAMPLES=ON `
        -D INSTALL_PYTHON_EXAMPLES=OFF `
        -D BUILD_ANDROID_PROJECTS=OFF `
        -D BUILD_ANDROID_EXAMPLES=OFF `
        -D BUILD_DOCS=OFF `
        -D BUILD_WITH_DEBUG_INFO=OFF `
        -D BUILD_EXAMPLES=OFF `
        -D BUILD_TESTS=OFF `
        -D BUILD_PERF_TESTS=OFF `
        -D BUILD_JAVA=OFF `
        -D BUILD_opencv_apps=OFF `
        -D BUILD_opencv_datasets=OFF `
        -D BUILD_opencv_freetype=OFF `
        -D BUILD_opencv_gapi=OFF `
        -D BUILD_opencv_java_bindings_generator=OFF `
        -D BUILD_opencv_js=OFF `
        -D BUILD_opencv_js_bindings_generator=OFF `
        -D BUILD_opencv_objc_bindings_generator=OFF `
        -D BUILD_opencv_python_bindings_generator=OFF `
        -D BUILD_opencv_python_tests=OFF `
        -D BUILD_opencv_ts=OFF `
        -D BUILD_opencv_world=$world_flag `
        -D WITH_MSMF=${msmf_flag} `
        -D WITH_MSMF_DXVA=${msmf_flag} `
        -D WITH_QT=OFF `
        -D WITH_FREETYPE=OFF `
        -D ENABLE_CXX11=1 `
        -D OPENCV_ENABLE_NONFREE=ON `
        -D OPENCV_ENABLE_ALLOCATOR_STATS=OFF `
        -D WITH_GSTREAMER=ON `
        -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules `
        -D BUILD_SHARED_LIBS=ON ../opencv

    mingw32-make -j 4
    mingw32-make install
    ls
    cd ..
}