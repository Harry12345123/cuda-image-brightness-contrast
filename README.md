# CUDA Image Brightness Contrast

A CUDA C++ project for brightness and contrast adjustment on the GPU.

This is a clean and practical example for learning pixel-wise enhancement with CUDA.

## Features

- brightness adjustment with CUDA
- contrast adjustment with CUDA
- GPU-based pixel enhancement
- easy-to-understand code structure

## Tech Stack

- C++
- CUDA
- OpenCV

## Project Goal

This repository helps learners understand:

- how brightness and contrast are adjusted per pixel
- how CUDA accelerates image enhancement
- how to build small but practical GPU projects

## Future Improvements

- real-time parameter control
- batch enhancement
- video processing support
- Jetson optimization

## Related Topics

CUDA, Brightness, Contrast, GPU Image Processing, C++, OpenCV

## Author

Harry12345123

## More

This project is part of my CUDA beginner project matrix for developers learning practical GPU programming.

## Requirements

Before building this project, make sure your system has:

- CUDA Toolkit
- OpenCV
- CMake 3.18 or later
- C++17 compatible compiler

## Build

Use the following commands to compile the project:

```bash
mkdir build
cd build
cmake ..
make -j

## Run

After building, run the program with:

./cuda_image_brightness_contrast input.jpg

