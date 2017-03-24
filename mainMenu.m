clc,clear,clear all;                      %clear all variable,figures
while (1==1)
    a=menu('ANPR Based Security System ',...
                'Identify Number',...
				'Display Number',...
                'Exit');
    if (a == 1)
         ocr;
    end
    
    if (a == 2)
        winopen('text.txt');    %Open 'text.txt' file
    end
    
    if (a == 3)
        clear all;
        clc;
        close all;
        return;
    end    
end