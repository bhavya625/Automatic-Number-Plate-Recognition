function imgn=clip(imagen)
%Crops a black letter with white background.
if ~islogical(imagen)
    imagen=im2bw(imagen,0.99);
end
a=~imagen;
[f c]=find(a);
lmaxc=max(c);lminc=min(c);
lmaxf=max(f);lminf=min(f);
imgn=a(lminf:lmaxf,lminc:lmaxc);%Crops image

