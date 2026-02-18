pushd cadical
    export LDFLAGS="$LDFLAGS -Wl,-headerpad_max_install_names"
    ./configure
    make -j$CPU_COUNT
popd

pushd cadiback
    ./configure
    make -j$CPU_COUNT
    ${AR:-ar} rcs libcadiback.a cadiback.o
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

    cmake --build . --target install --config Release --parallel ${CPU_COUNT}
    popd
popd