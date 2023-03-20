# Predicting the Quality of View Synthesis With Color-Depth Image Fusion

Paper download: https://ieeexplore.ieee.org/document/9201056/


If you find our work is useful, pleaes cite our papers:

[1] L. Li, Y. Huang, J. Wu, K. Gu and Y. Fang, "Predicting the Quality of View Synthesis With Color-Depth Image Fusion," IEEE Transactions on Circuits and Systems for Video Technology, vol. 31, no. 7, pp. 2509-2521, 2021.

[2] Y. Huang, L. Li, H. Zhu and B. Hu, "Blind Quality Index of Depth Images Based on Structural Statistics for View Synthesis," IEEE Signal Processing Letters, vol. 27, pp. 685-689, 2020.

The complete CODIF metric includes two parts: 1. HED model, 2. CODIF Codes.

>>>Running the HED model to detect the color image, and obtaining the corresponding object contour map, then saving it in the corresponding folder, e.g. test_image\HED_images;
        HED model download address: https://github.com/senliuy/Keras_HED_with_model

>>>In CODIF Codes, we provided the SVR model trained on the MCL_3D database, and you can run Demo_test.m to directly predict the quality of the synthesized image from the color and depth images；

>>>If you need to retrain in other database, you can modify the code in CODIF Codes for feature extraction, and then use the SVR model for retraining.

If you have additional questions, you can email huangyipo@hotmail.com.
