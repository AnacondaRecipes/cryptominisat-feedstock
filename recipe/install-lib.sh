mkdir -p $PREFIX/lib $PREFIX/include
pushd cadical
    export LDFLAGS="$LDFLAGS -Wl,-headerpad_max_install_names"
    ./configure
    make -j8
popd

pushd cadiback
    ./configure
    make -j8
popd

pushd cryptominisat
mkdir -p build_lib && pushd build_lib

cmake \
    -G "${CMAKE_GENERATOR}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DENABLE_TESTING=OFF \
    -DMIT=ON \
    -DENABLE_PYTHON_INTERFACE=OFF \
    -DONLY_SIMPLE=ON \
    ..

cmake --build . --target install --config RelWithDebInfo
