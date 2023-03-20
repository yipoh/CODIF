function feat = brisque_feature(imdist,B)

%------------------------------------------------
% Feature Computation
%-------------------------------------------------
scalenum = 1;
window = fspecial('gaussian',7,7/6);
window = window/sum(sum(window));

feat = [];

for itr_scale = 1:scalenum

mu            = filter2(window, imdist, 'same');
mu_sq         = mu.*mu;
sigma         = sqrt(abs(filter2(window, imdist.*imdist, 'same') - mu_sq));
structdis     = (imdist-mu)./(sigma+1);

G =~B;
mscn_im=structdis.*G;
mscn_im(mscn_im==0)=[];

[alpha leftstd rightstd] = estimateaggdparam(mscn_im);
const                    =(sqrt(gamma(1/alpha))/sqrt(gamma(3/alpha)));
logmeanparam                =(rightstd-leftstd)*(gamma(2/alpha)/gamma(1/alpha))*const;
logleftstd=(leftstd)^2;
logrightstd=(rightstd)^2;
logalpha=alpha;

feat                     = [feat logmeanparam logleftstd logrightstd logalpha]; 
end
% 
% shifts                   = [ 0 1;1 0 ; 1 1; -1 1];
%  
% for itr_shift =1:4
%  
% shifted_structdis        = circshift(structdis,shifts(itr_shift,:));
% pair                     = structdis(:).*shifted_structdis(:);
% [alpha leftstd rightstd] = estimateaggdparam(pair);
% const                    =(sqrt(gamma(1/alpha))/sqrt(gamma(3/alpha)));
% meanparam                =(rightstd-leftstd)*(gamma(2/alpha)/gamma(1/alpha))*const;
% feat                     =[feat alpha meanparam leftstd^2 rightstd^2];
% 
% end
% 
% 
% imdist                   = imresize(imdist,0.5);


end
