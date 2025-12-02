pushd cryptominisat
mkdir -p build_exec && pushd build_exec

cmake \
    -G "${CMAKE_GENERATOR}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DENABLE_TESTING=OFF \
    -DMIT=ON \
    -DENABLE_PYTHON_INTERFACE=OFF \
    -DONLY_SIMPLE=OFF \
    ..

cmake --build . --target install --config Release --parallel ${CPU_COUNT}
popd
popd