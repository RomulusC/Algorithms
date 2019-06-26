%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Insertion Sort 
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

N = 16; % Length of array to be sorted 
V = N:-1:1; % Generate an array containing integers from N down to 1
comparisons = 0;

snapNumeber = 1;
arrayState(1:N,snapNumeber) = V;

for j = 2:N
    pivot = V(j);
    i = j;
    while ((i > 1) && (V(i - 1) > pivot))
        comparisons = comparisons+1;
        V(i) = V(i - 1);
        i = i - 1;
        snapNumeber = snapNumeber + 1;
        arrayState(1:N,snapNumeber) = V;
    end % while
    
    V(i) = pivot;
   snapNumeber = snapNumeber + 1;
        arrayState(1:N,snapNumeber) = V;
    
end % for

%Plot
figure; imagesc(arrayState); 
axis square;
ylabel('Element Number','FontSize',14);
xlabel('Array Version','FontSize',14); 
colormap('jet');% Change to jet colormap

 % Store High-resolution Image Suitable for use in Reports  
print -f1 -r300 -dbmp insertionSortVisualisation.bmp