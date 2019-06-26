%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Shaker Sort
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
clear all; close all; clc; 
N = 16; % Length of array to be sorted 
V = N:-1:1; % Generate an array containing integers from N down to 1
comparisons = 0;
snapNumeber = 1;
arrayState(1:N,snapNumeber) = V; 
lLock = 0; hLock = N+1; 
isSorted = false;
shakerDirection =true; %true = -> , false = <-
while(~isSorted)
    if(abs(lLock-hLock)==2)
        isSorted = true;    
    else
        if(shakerDirection==true)
           pos = lLock +1;
           shakerDirection = ~shakerDirection;
            while(pos+1~=hLock)
                comparisons = comparisons+1;
                if(V(pos)>V(pos+1))
                temp = V(pos);
                V(pos) = V(pos+1);
                V(pos+1) = temp;
                snapNumeber = snapNumeber + 1;
                arrayState(1:N,snapNumeber) = V; 
                end % if
                pos = pos +1; 
                
            end % while
            hLock = hLock-1;    
        
        else
            pos = hLock -1;
            shakerDirection = ~shakerDirection;
            while(pos-1~=lLock)
                comparisons = comparisons+1;
                if(V(pos)<V(pos-1))
                    temp = V(pos);
                    V(pos) = V(pos-1);
                    V(pos-1) = temp;  
                    snapNumeber = snapNumeber + 1;
                    arrayState(1:N,snapNumeber) = V; 
                end % if
                pos = pos-1;
            end % while
             lLock = lLock+1; 
        end  % if            
        
    end % if
        
end % while

%Plot Values
figure; imagesc(arrayState); 
axis square;
ylabel('Element Number','FontSize',14);
xlabel('Array Version','FontSize',14); 
colormap('jet'); % Change to jet colormap

% Store High-resolution Image Suitable for use in Reports  
 print -f1 -r300 -dbmp shackerSortVisualisation.bmp