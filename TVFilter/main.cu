//
// Total Variation Filter using CUDA
//
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <string>
#include <stdio.h>
#include "tvFilter.cu"

using namespace std;

// Program main
int main( int argc, char** argv ) {

   // name of image
   string image_name = "sample";

   // input & output file names
   string input_file =  image_name+".jpg";
   string output_file_cpu = image_name+"_cpu.jpg";
   string output_file_gpu = image_name+"_gpu.jpg";

   // Read input image 
   cv::Mat srcImage = cv::imread(input_file ,cv::IMREAD_UNCHANGED);
   if(srcImage.empty())
   {
      std::cout<<"Image Not Found: "<< input_file << std::endl;
      return -1;
   }
   cout <<"\ninput image size: "<<srcImage.cols<<" "<<srcImage.rows<<" "<<srcImage.channels()<<"\n";

   // convert RGB to gray scale
   cv::cvtColor(srcImage, srcImage, cv::COLOR_BGR2GRAY);
  
   // Declare the output image  
   cv::Mat dstImage_gpu (srcImage.size(), srcImage.type());
   // run total variation filter on GPU  
   tvFilter_GPU_wrapper(srcImage, dstImage_gpu);
   // normalization to 0-255
   dstImage_gpu.convertTo(dstImage_gpu, CV_32F, 1.0 / 255, 0);
   dstImage_gpu*=255;
   // Output image
   imwrite(output_file_gpu, dstImage_gpu);
      
   return 0;
}





