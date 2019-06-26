%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Exponential Search Harness
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

maxArraySize = 1024;  
for N = 1:maxArraySize
    array = 1:N;          
    for searchTarget = 1:N                
        [numComparisons targetIndex]= exponentialSearch(array, searchTarget); 
        comparisons(searchTarget) =  numComparisons;
        targetIn(N) = targetIndex;
        
    end % end for        
    best_comparisons(N)    = min(comparisons); 
    average_comparisons(N) = mean(comparisons); 
    worst_comparisons(N)   = max(comparisons);  
    
    best_targetIndex(N) = min(targetIn); 
    mean_targetIndex(N) = mean(targetIn); 
    max_targetIndex(N)  = max(targetIn); 
    clear comparisons;         
end % end for

  figure;   
  
  % Plot Observed  
  
  plot([1:maxArraySize], best_comparisons,'g','LineWidth',3); hold on; 
  plot([1:maxArraySize], average_comparisons,'y','LineWidth',3);
  plot([1:maxArraySize], worst_comparisons,'r','LineWidth',3);
  
  properties.FontSize = 14;   
  % Plot Expected   
  m2(1:maxArraySize) = 1;
  plot([1:maxArraySize], 2*best_targetIndex, 'k:', 'LineWidth', 2); % best 
  plot([1:maxArraySize], 2*log2(mean_targetIndex), 'k:', 'LineWidth', 2);       % average 
  plot([1:maxArraySize], 2*log2(max_targetIndex), 'k:', 'LineWidth', 2);     % worst  
  properties = legend('best','average','worst');
  % Annotate Chart   
  xlabel('Array Size (N)','FontSize',14); ylabel('Comparisons', 'FontSize', 14);   
  xlim([0 maxArraySize]); ylim([0 max(worst_comparisons)]); axis square; 
 % Store High-resolution Image Suitable for use in Reports 
 print -f1 -r300 -dbmp exponentialSearchSuccessful.bmp
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Exponential Search Algorithm Function
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
function [numComparisons, targetIndex] = exponentialSearch(V, target)   
    numComparisons=0;  
    arrayLength    = length(V);    
    if(arrayLength<=1)        
        targetIndex = arrayLength;
        return;
    end % if
    i = 1;
    while(i<length(V) && V(i)<=target)
         numComparisons= numComparisons+1;
        i = i*2;
    end % while

    indexStart     = (i/2);
    indexEnd       = min(i,length(V));

    while(indexStart <= indexEnd)
        indexMiddle = floor((indexStart+indexEnd)/2);

        numComparisons = numComparisons + 1;
        if(V(indexMiddle) == target)
            targetIndex  = indexMiddle;
            break;
        elseif(V(indexMiddle) < target)
            indexStart = indexMiddle + 1;
        else
            indexEnd = indexMiddle - 1;
        end % if
    end % while

    if(V(indexMiddle)~=target)
        targetIndex = -1;
    end % if
      
    end % end function     