% Version : 5.0
% Date : MAY / 18 / 2007
% Author  : Omid Bonakdar Sakhi

close all;
clear all;
clc;

G = cell(5,8);
for s = 1:5
    for j = 1:8
        G{s,j}=zeros(32,32);
    end
end
for s = 1:5
    for j = 1:8
        G{s,9-j} = gabor([32 32],(s-1),j-1,4*pi/5,sqrt(2),3*pi/2);
    end
end

%figure;
for s = 1:5
    for j = 1:8        
%        subplot(5,8,(s-1)*8+j);        
%        imshow(real(G{s,j}),[]);
    end
end

for s = 1:5
    for j = 1:8        
        G{s,j}=fft2(G{s,j});
    end
end
save gabor G