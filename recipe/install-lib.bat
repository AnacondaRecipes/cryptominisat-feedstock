mkdir build_lib && pushd build_lib

ECHO %CD%

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_LIBDIR="lib" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DENABLE_TESTING=OFF ^
    -DMIT=ON ^
    -DENABLE_PYTHON_INTERFACE=OFF ^
    -DONLY_SIMPLE=ON ^
    ..

cmake --build . --target install --config RelWithDebInfo
