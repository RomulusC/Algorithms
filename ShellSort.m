%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Shell Sort 
% Author:    Rommulluss Caraiman
% Using Tokuda (1992) Shell Sort Gap Sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

k = 1; % k = Currernt gap iteration 
N = 16; % Length of array to be sorted 
V = N:-1:1; % Generate an array containing integers from N down to 1
comparisons = 0;
snapNumeber = 1;
arrayState(1:N,snapNumeber) = V;

% h = Array of gap length 
h(k) = ceil((1/5) * ( 9.* (9/4).^(k-1) -4 ));
% Comfiguring gaps for every iteration
while(h(k)<N)
k = k+1;
h(k) = ceil((1/5) * ( 9.* (9/4).^(k-1) -4 ));
end

% Iterate through all gaps of array h
for m = length(h):-1:1
    % Perform insertion sort with gap = h(m)
    for j = (h(m) + 1):N
        pivot = V(j);
        i = j;  
        while ((i > h(m)) && (V(i - h(m)) > pivot))
            comparisons = comparisons+1;
            V(i) = V(i - h(m));
            i = i - h(m);
            snapNumeber = snapNumeber + 1;
            arrayState(1:N,snapNumeber) = V;
        end % while
        comparisons = comparisons+1;
        V(i) = pivot;
        snapNumeber = snapNumeber + 1;
        arrayState(1:N,snapNumeber) = V;                 
    end % for 
end % for

%Plot Values
figure; imagesc(arrayState); 
axis square;
ylabel('Element Number','FontSize',14);
xlabel('Array Version','FontSize',14); 
colormap('jet'); % Change to jet colormap

 % Store High-resolution Image Suitable for use in Reports  
 print -f1 -r300 -dbmp shellSortVisualisation.bmp