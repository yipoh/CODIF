function Score_proposed=score_prediction(color_depth_path, HED_path, dis_T1,dis_T2,dis_T3, dis_D1, dis_D2, dis_D3)
         
% 读取图像
dis_T1_img=imread(fullfile(color_depth_path, dis_T1));
dis_T2_img=imread(fullfile(color_depth_path, dis_T2));
dis_T3_img=imread(fullfile(color_depth_path, dis_T3));
          
dis_D1_img=imread(fullfile(color_depth_path, dis_D1));
dis_D2_img=imread(fullfile(color_depth_path, dis_D2));
dis_D3_img=imread(fullfile(color_depth_path, dis_D3));
         
edge_mask1_img=imread(fullfile(HED_path, dis_T1));
edge_mask2_img=imread(fullfile(HED_path, dis_T2));
edge_mask3_img=imread(fullfile(HED_path, dis_T3));

% 纹理-深度图像融合
[out1,B1]=color_depth_fusion(edge_mask1_img,dis_T1_img,dis_D1_img);
[out2,B2]=color_depth_fusion(edge_mask2_img,dis_T2_img,dis_D2_img);
[out3,B3]=color_depth_fusion(edge_mask3_img,dis_T3_img,dis_D3_img);

% 特征提取
 feat_1=extract_feature(out1,B1);
 feat_2=extract_feature(out2,B2);
 feat_3=extract_feature(out3,B3);
 
 feat=[feat_1 feat_2 feat_3]; 

%% 加载在MLC_3D数据库上训练好的SVR模型进行测试

fid = fopen('test_ind.txt','w');
for jj = 1:size(feat,1)
fprintf(fid,'1 ');
for kk = 1:size(feat,2)
fprintf(fid,'%d:%f ',kk,feat(jj,kk));
end
fprintf(fid,'\n');
end
fclose(fid);

warning off all
delete output test_ind_scaled dump
system('svm-scale  -r range test_ind.txt >> test_ind_scaled');
system('svm-predict  -b 1  test_ind_scaled model output.txt>dump');
load output.txt;
Score_proposed= output;

end