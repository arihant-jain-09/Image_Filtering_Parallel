## Requirements for this project:

- Make sure to have OpenCV installed with path variables set (this project uses OPENCV version 4.2.0)

- Make sure to have CUDA installed with path variables set (this project uses CUDA version 10.1)
 

## Steps To install OPENCV:

```
$ sudo apt install libopencv-dev python3-opencv
```
```
$ sudo apt install libopencv-dev python3-opencv
```
```
$ python3 -c "import cv2; print(cv2.__version__)"
```
Output
```4.2.0```
## Steps To install CUDA:
```
$ sudo apt update
```
```
$ sudo apt install nvidia-cuda-toolkit
```
```
$ nvcc --version

nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Sun_Jul_28_19:07:16_PDT_2019
Cuda compilation tools, release 10.1, V10.1.243
```

## Create a symbolic link for OpenCV:
```
$ sudo ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv2
```
## Steps to run this project:
```
$ cd <filter Name>
ex: cd BoxFilter
```
```
$ nvcc main.cu `pkg-config --cflags --libs opencv4`
```
```
$ export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
```
```
$ ./a.out
input image size: 600 298 3
Processing time for GPU (ms): 0.05088
```