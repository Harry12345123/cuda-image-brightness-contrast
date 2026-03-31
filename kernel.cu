#include <cuda_runtime.h>
__device__ unsigned char clamp_uc(int x)
{
    return (unsigned char)(x < 0 ? 0 : (x > 255 ? 255 : x));
}
__global__ void bc_kernel(const unsigned char *in, unsigned char *out, int total, float alpha, int beta)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < total)
    {
        int v = (int)(alpha * in[idx] + beta);
        out[idx] = clamp_uc(v);
    }
}
void brightness_contrast_cuda(const unsigned char *in, unsigned char *out, int width, int height,
                              int channels, float alpha, int beta)
{
    int total = width * height * channels;
    unsigned char *d_in = nullptr, *d_out = nullptr;
    cudaMalloc(&d_in, total);
    cudaMalloc(&d_out, total);
    cudaMemcpy(d_in, in, total, cudaMemcpyHostToDevice);
    int block = 256;
    int grid = (total + block - 1) / block;
    bc_kernel<<<grid, block>>>(d_in, d_out, total, alpha, beta);
    cudaDeviceSynchronize();
    cudaMemcpy(out, d_out, total, cudaMemcpyDeviceToHost);
    cudaFree(d_in);
    cudaFree(d_out);
}