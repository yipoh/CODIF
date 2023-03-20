function feat  = mscnfeat(imdist,B)

if(size(imdist,3)==3)
    imdist = uint8(imdist);
    imdist = rgb2gray(imdist);
end

imdist = double(imdist);

if(nargin<3)
feat = brisque_feature(imdist,B);

end
