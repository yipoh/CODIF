function [out,B]=color_depth_fusion(edge_mask_img,dis_T_img,dis_D_img)

B=edge_mask_img*0;
B(find(edge_mask_img>120))=1;
B(find(edge_mask_img<=120))=0;

t=rgb2gray(dis_T_img);
d=rgb2gray(dis_D_img);
out = uint8(wtfusion(t,d,2,'haar',B));
end