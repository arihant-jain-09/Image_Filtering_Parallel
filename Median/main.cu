#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <string>
#include <stdio.h>
#include "medianFilter.cu"
#include <opencv2/imgcodecs.hpp>
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
    
   // Declare the output image  
   cv::Mat dstImage (srcImage.size(), srcImage.type());

   // run median filter on GPU  
   medianFilter_GPU_wrapper(srcImage, dstImage);
   // Output image
   imwrite(output_file_gpu, dstImage);
       
   return 0;
}
