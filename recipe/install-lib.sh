mkdir -p $PREFIX/lib $PREFIX/include
pushd cadical
    export LDFLAGS="$LDFLAGS -Wl,-headerpad_max_install_names"
    ./configure
    make -j8
    if [ -f build/libcadical.so ]; then
        cp build/libcadical.so $PREFIX/lib/
    fi
    if [ -f build/libcadical.dylib ]; then
        cp build/libcadical.dylib $PREFIX/lib/
    fi

    # Copy headers
    cp src/cadical.hpp $PREFIX/include/
    cp src/ccadical.h $PREFIX/include/
    cp src/ipasir.h $PREFIX/include/
popd

pushd cadiback
    ./configure
    make -j8
    cp libcadiback.so $PREFIX/lib/
	cp cadiback.h $PREFIX/include/
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
