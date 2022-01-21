mkdir build_py && pushd build_py

set "CMAKE_LIBRARY_PATH=%LIBRARY_LIB%"

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_LIBDIR="lib" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DENABLE_TESTING=OFF ^
    -DMIT=ON ^
    -DENABLE_PYTHON_INTERFACE=ON ^
    -DONLY_SIMPLE=ON ^
    ..

cmake --build . --target install --config RelWithDebInfo
