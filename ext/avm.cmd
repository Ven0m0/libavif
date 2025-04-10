: # If you want to use a local build of libavm, you must clone the avm repo in this directory first, then set CMake's AVIF_CODEC_AVM to LOCAL.
: # The git SHA below is known to work, and will occasionally be updated. Feel free to use a more recent commit.

: # The odd choice of comment style in this file is to try to share this script between *nix and win32.

: # cmake and ninja must be in your PATH.

: # If you're running this on Windows, be sure you've already run this (from your VC2019 install dir):
: #     "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat"

git clone -b research-v9.0.0 --depth 1 https://gitlab.com/AOMediaCodec/avm.git

cmake -G Ninja -S avm -B avm/build.libavif -DBUILD_SHARED_LIBS=OFF -DCONFIG_PIC=1 -DCMAKE_BUILD_TYPE=Release -DENABLE_DOCS=0 -DENABLE_EXAMPLES=0 -DENABLE_TESTS=0 -DENABLE_TOOLS=0
cmake --build avm/build.libavif --config Release --parallel
