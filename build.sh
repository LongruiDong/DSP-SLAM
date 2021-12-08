#!/bin/bash -e
# for my own to build DSP-SLAM

# builkd once ok uncomment when start from scratch
# echo "Configuring and building Thirdparty/DBoW2 ..."
# cd Thirdparty
# cd opencv
# cd build
# OpenCV_DIR=$(pwd)
# cd ../../DBoW2
# rm -r build
# mkdir build
# cd build
# cmake .. -DCMAKE_BUILD_TYPE=Release -DOpenCV_DIR=$OpenCV_DIR
# make -j16

# cd ../../g2o

# echo "Configuring and building Thirdparty/g2o ..."
# rm -r build
# mkdir build
# cd build
# cmake .. -Wno-dev -DCMAKE_BUILD_TYPE=Release -DEigen3_DIR="$(pwd)/../../eigen/install/share/eigen3/cmake"
# make -j16

# cd ../../../

# must need
echo "Configuring and building DSP-SLAM ..."

rm -r build
mkdir build
cd build
conda_python_bin=`which python`
conda_env_dir="$(dirname "$(dirname "$conda_python_bin")")"
#Release Debug
cmake \
  -Wno-dev \
  -DCMAKE_BUILD_TYPE=Release \
  -DOpenCV_DIR="$(pwd)/../Thirdparty/opencv/build" \
  -DEigen3_DIR="$(pwd)/../Thirdparty/eigen/install/share/eigen3/cmake" \
  -DPangolin_DIR="$(pwd)/../Thirdparty/Pangolin/build" \
  -DPYTHON_LIBRARIES="$conda_env_dir/lib/libpython3.7m.so" \
  -DPYTHON_INCLUDE_DIRS="$conda_env_dir/include/python3.7m" \
  -DPYTHON_EXECUTABLE="$conda_env_dir/bin/python3.7" \
  ..
# cmake .. -Wno-dev \
#         -DCMAKE_BUILD_TYPE=Debug \
#         -DEigen3_DIR="$(pwd)/../Thirdparty/eigen/install/share/eigen3/cmake" \
#         -DPYTHON_LIBRARIES="/home/dlr/3rdpack/anaconda3/envs/dsp-slam/lib/libpython3.7m.so" \
#         -DPYTHON_INCLUDE_DIRS="/home/dlr/3rdpack/anaconda3/envs/dsp-slam/include/python3.7m" \
#         -DPYTHON_EXECUTABLE="/home/dlr/3rdpack/anaconda3/envs/dsp-slam/bin/python3.7"
make -j20