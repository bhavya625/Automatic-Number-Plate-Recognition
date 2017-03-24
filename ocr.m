warning off
prompt={'Enter image name:'};
% Create all your text fields with the questions specified by the variable prompt.
title='IMAGE'; 
% The main title of your input dialog interface.
answer=inputdlg(prompt,title);
name = answer{1};
img = imread(name);
img = rgb2gray(img);
%converting into grayscale
level = graythresh(img);
imagen = im2bw(img,level);
%converting into binary format
imagen = ~imagen;
imagen = bwareaopen(imagen,70);
imagen = ~imagen;
imshow(imagen);title='INPUT IMAGE WITH NOISE';
%*-*-*Filter Image Noise*-*-*-*
if length(size(imagen))==3 %RGB image
    imagen=rgb2gray(imagen);
end
imagen = medfilt2(imagen);
[f c]=size(imagen);
imagen (1,1)=255;
imagen (f,1)=255;
imagen (1,c)=255;
imagen (f,c)=255;
%*-*-*END Filter Image Noise*-*-*-*
word=[];%Storage matrix word from image
re=imagen;
fid = fopen('text.txt', 'at');%Opens text.txt as file for write
while 1
    [fl re]=lines(re);
    imgn=~fl;
    L = bwlabel(imgn);
    mx=max(max(L));
    BW = edge(double(imgn),'sobel');
	%filtering
    [imx,imy]=size(BW);
    for n=1:mx
        [r,c] = find(L==n);
        rc = [r c];
        [sx sy]=size(rc);
        n1=zeros(imx,imy);
        for i=1:sx
            x1=rc(i,1);
            y1=rc(i,2);
            n1(x1,y1)=255;
        end
		%segmentation
        %*-*-*-*-*-END Calculating connected components*-*-*-*-*
        n1=~n1;
        n1=~clip(n1);
        img_r=same_dim(n1);%Transf. to size 42 X 24
        letter=read_letter(img_r);%img to text
        word=[word letter];
    end
    %fprintf(fid,'%s\n',lower(word));%Write 'word' in text file (lower)
    fprintf(fid,'Number Plate:-%s\nDate:-%s\n',word,date);%Write 'word' in text file (upper)
    if isempty(re)  
        break
    end
    %*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
end
fclose(fid);