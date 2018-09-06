#!/bin/bash
set -eu -o pipefail

mkdir -p build && cd build

if [[ ${target_platform}  == osx-64 ]] && [[ $PY3K == 1 ]]; then
  export LDFLAGS="${LDFLAGS} -undefined dynamic_lookup"
fi

extra_opts=""
if [ "${gpl_ok}" == "True" ]; then
    extra_opts="-DMIT=ON "
fi

# * ENABLE_TESTING: Testing requires lit which is not packaged yet:
#   https://github.com/conda-forge/staged-recipes/issues/4630
cmake \
    -G "${CMAKE_GENERATOR}" \
  "-DCMAKE_INSTALL_PREFIX=$PREFIX" \
  -DENABLE_PYTHON_INTERFACE=OFF \
  -DENABLE_TESTING=OFF \
  -DONLY_SIMPLE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  ${extra_opts} \
  ..

make -j${CPU_COUNT}
