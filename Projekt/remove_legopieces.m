function [new_legodatabase] = remove_legopieces(old_legodatabase, nmbr_of_pieces)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%If the number of used legopieces is above given max numbers of colors.
if length(old_legodatabase) > nmbr_of_pieces
    %An array with all of the euclidian distances
    euclidianarray = zeros(length(old_legodatabase)); 
    
    for n = 1:length(old_legodatabase)
       tempis = 500;
       temp_legopiece = old_legodatabase{n};
       if n > 1 
            for m = 1:length(old_legodatabase)                                
                L2 = rgb2lab(old_legodatabase{m});
                euclidean = sqrt((L2(:,:,1)-temp_legopiece(:,:,1)).^2 + (L2(:,:,2)-temp_legopiece(:,:,2)).^2+ (L2(:,:,3)-temp_legopiece(:,:,3)).^2);
                
                % Find mean values
                val_mean = mean(mean(euclidean));
                mean_lego = mean(mean(mean(temp_legopiece)));
                
                %Store the minimum 
                if abs(val_mean - mean_lego) < tempis
                  tempis = abs(val_mean - mean_lego);
                  euclidianarray(n) = tempis;
                end
            end           
        end
    end
    
    while length(old_legodatabase) > nmbr_of_pieces
        disp("hej1");
        [minval,ind] = min(euclidianarray(:));
        disp(ind);
        disp(length(euclidianarray));
        disp(length(old_legodatabase));
        if ind <= length(old_legodatabase)
            old_legodatabase(ind) = [];
            disp(length(old_legodatabase));
        end
        
        euclidianarray(ind) = 500;
        
    end
    
    new_legodatabase = old_legodatabase;
    
end
end

