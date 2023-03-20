function feat=extract_feature(img,B)
feat=[];
img1=img;
[m,n]=size(img1);
% scale 1
feat_1=mscnfeat(img1,B);
w=fspecial('gaussian',[3 3]);
[logmeanparam1 logalpha1 logleftstd1 logrightstd1]=tmcfeat(img1,B);
feat=[feat feat_1 logmeanparam1 logalpha1 logleftstd1 logrightstd1];

% scale 2
img2=imresize(imfilter(img1,w),[m/2 n/2]);
B=imresize(imfilter(B,w),[m/2 n/2]);
feat_2=mscnfeat(img2,B);
[logmeanparam2 logalpha2 logleftstd2 logrightstd2]=tmcfeat(img2,B);
feat=[feat feat_2 logmeanparam2 logalpha2 logleftstd2 logrightstd2];

% scale 3
img3=imresize(imfilter(img2,w),[m/4 n/4]);
B=imresize(imfilter(B,w),[m/4 n/4]);
feat_3=mscnfeat(img3,B);
[logmeanparam3 logalpha3 logleftstd3 logrightstd3]=tmcfeat(img3,B);
feat=[feat feat_3 logmeanparam3 logalpha3 logleftstd3 logrightstd3];

% scale 4
img4=imresize(imfilter(img3,w),[m/8 n/8]);
B=imresize(imfilter(B,w),[m/8 n/8]);
feat_4=mscnfeat(img4,B);
[logmeanparam4 logalpha4 logleftstd4 logrightstd4]=tmcfeat(img4,B);
feat=[feat feat_4 logmeanparam4 logalpha4 logleftstd4 logrightstd4];

% scale 5
img5=imresize(imfilter(img4,w),[m/16 n/16]);
B=imresize(imfilter(B,w),[m/16 n/16]);
feat_5=mscnfeat(img5,B);
[logmeanparam5 logalpha5 logleftstd5 logrightstd5]=tmcfeat(img5,B);
feat=[feat feat_5 logmeanparam5 logalpha5 logleftstd5 logrightstd5];

