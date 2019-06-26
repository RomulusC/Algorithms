%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Interpolation Search Harness
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
clear all;
close all;
clc;   

maxArraySize = 1024;  
for N = 1:maxArraySize
    array = 1:N;          
    for searchTarget = 1:N                
        comparisons(searchTarget) = interpolation(array, searchTarget);         
    end % end for        
    best_comparisons(N)    = min(comparisons); 
    average_comparisons(N) = mean(comparisons); 
    worst_comparisons(N)   = max(comparisons);    
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
  plot([1:maxArraySize],  m2(1:maxArraySize), 'k:', 'LineWidth', 2); % best 
  plot([1:maxArraySize], log2(log2(1:maxArraySize)), 'k:', 'LineWidth', 2);       % average 
  plot([1:maxArraySize], 1:maxArraySize, 'k:', 'LineWidth', 2);     % worst  
  properties = legend('best','average','worst');
  % Annotate Chart   
  xlabel('Array Size (N)','FontSize',14); ylabel('Comparisons', 'FontSize', 14);   
  xlim([0 maxArraySize]); ylim([log2(log2(1)) log2(maxArraySize)]); axis square; 
 % Store High-resolution Image Suitable for use in Reports 
 print -f1 -r300 -dbmp interpolationSearchSuccessful.bmp
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Title:     Interpolation Search Algorithm Function
% Author:    Rommulluss Caraiman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
function [numComparisons, targetIndex] = interpolation(V, target)  
    numComparisons = 0;
    
    if(length(V)<=1)        
        targetIndex = length(V);
        return;
    end

    lo = 1;
    hi = length(V);
        
    while (lo<=hi)
        
        mid = lo + (((hi - lo) / (V(hi) - V(lo))) * (target - V(lo)));
        
        numComparisons = numComparisons +1;
        if(V(mid)==target)
            targetIndex = mid;
            return;
        else
            if(V(mid)<target)
                lo = mid +1;
            else
                hi = mid -1;
            end
        end
        
    end
    targetIndex = 0;
    end % end function