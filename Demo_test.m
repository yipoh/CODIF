clear;
clc;
close all

color_depth_path='test_image\read_distorted_texture_and_depth\' ;
HED_path='test_image\HED_images\' ;


dis_T1='balloon_t1_awn_1.bmp';
dis_T2='balloon_t2_awn_1.bmp';
dis_T3='balloon_t3_awn_1.bmp';

dis_D1='balloon_d1_awn_1.bmp';
dis_D2='balloon_d2_awn_1.bmp';
dis_D3='balloon_d3_awn_1.bmp';

Score_proposed=score_prediction(color_depth_path, HED_path, dis_T1,dis_T2,dis_T3, dis_D1, dis_D2, dis_D3)





