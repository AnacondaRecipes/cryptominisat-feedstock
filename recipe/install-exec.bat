mkdir build_exec && pushd build_exec

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DENABLE_TESTING=OFF ^
    -DMIT=ON ^
    -DENABLE_PYTHON_INTERFACE=OFF ^
    -DONLY_SIMPLE=OFF ^
    ..

cmake --build . --target install --config RelWithDebInfo
