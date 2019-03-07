mkdir -p build_py && pushd build_py

cmake \
    -G "${CMAKE_GENERATOR}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DENABLE_TESTING=OFF \
    -DMIT=ON \
    -DENABLE_PYTHON_INTERFACE=ON \
    -DFORCE_PYTHON2="$( [[ $PY3K == 1 ]] && { echo OFF || : ; } || echo ON )" \
    -DONLY_SIMPLE=ON \
    ..

cmake --build . --target install --config RelWithDebInfo
