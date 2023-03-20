If you find our work is useful, pleaes cite our papers
[1] L. Li, Y. Huang, J. Wu, K. Gu and Y. Fang, "Predicting the Quality of View Synthesis With Color-Depth Image Fusion," IEEE Transactions on Circuits and Systems for Video Technology, vol. 31, no. 7, pp. 2509-2521, 2021.
[2] Y. Huang, L. Li, H. Zhu and B. Hu, "Blind Quality Index of Depth Images Based on Structural Statistics for View Synthesis," IEEE Signal Processing Letters, vol. 27, pp. 685-689, 2020.

完整的CODIF算法需要两个部分：1、HED模型，2、CODIF Codes

>>>运行HED模型对合成前的纹理图像进行检测，得到对应的物体轮廓图，并保存到对应的文件夹中；
       HED模型下载地址：https://github.com/senliuy/Keras_HED_with_model
>>>CODIF Codes中我们提供了在MCL_3D数据库上训练好的SVR模型，可以打开Demo_test直接用合成前的图像对合成后的图像进行质量预测；
>>>如需重新训练，可以修改CODIF Codes中的代码进行特征提取，然后用SVR模型进行重新训练。

If you have additional questions, you can email huangyipo@hotmail.com.