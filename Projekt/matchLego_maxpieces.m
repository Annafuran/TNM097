function [lego_image] = matchLego_maxpieces(org_image, old_legobox, max_colors)
%MATCHLEGO_MAXPIECES Summary of this function goes here
%   Detailed explanation goes here

%Reference image
lego_image = cell(length(org_image), length(org_image));
[img_rows ,img_cols, colrChn] = size(org_image);

%New legobox 
new_legobox = cell(max_colors, 1);
counter_newlegobox = 1;

for j = 1:img_rows
    disp(j);
   for k = 1:img_cols
    % Make orgiginal image into LAB
    L1 = rgb2lab(org_image);
    % temp variable for finding matching lego-piece
    tempis = 500;   
    for i = 1:length(old_legobox)
        %Make lego image into LAB
    	L2 = rgb2lab(old_legobox{i});
                    
    	% Find euclidean distence for the different images
        euclidean = sqrt((L2(:,:,1)-L1(j,k,1)).^2 + (L2(:,:,2)-L1(j,k,2)).^2+ (L2(:,:,3)-L1(j,k,3)).^2);
               
        % Find mean values
        val_mean = mean(mean(euclidean));
        mean_lego = mean(mean(mean(old_legobox{i})));
               
        if abs(val_mean - mean_lego) < tempis
        %rewrite new temporary value
        tempis = abs(val_mean - mean_lego);     
        %Store matching lego as maching pixel
        lego_image{j,k} = old_legobox{i};
        
        temp_legopiece = old_legobox{i};
        %check if the legopiece already exists in our new legobox. 
        hasMatch = any(cellfun(@isequal, new_legobox, repmat({temp_legopiece}, size(new_legobox))));             
            if hasMatch ~= true
                %add legopiece to legobox if it does not exist. 
                new_legobox{counter_newlegobox} = old_legobox{i};
                counter_newlegobox = counter_newlegobox + 1;
            end       
        end     
     end      
    end
end

%If the number of used legopieces is above given max numbers of colors.
if counter_newlegobox > max_colors
    %An array with all of the euclidian distances
    euclidianarray = zeros(length(new_legobox));       
    for n = 1:length(new_legobox)
       tempis = 500;
       temp_legopiece = new_legobox{n};
       if n > 1 
            for m = 1:length(new_legobox)                
                
                L2 = rgb2lab(new_legobox{m});
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
    
    %Remove legopieces from the the box until reached number of max colors 
    while length(new_legobox) > max_colors
        [minval,ind] = min(euclidianarray(:));
        if ind <= length(new_legobox)
            new_legobox(ind) = [];
        end
        euclidianarray(ind) = 500;       
    end
    %Create a new image with new legobox
    lego_image = matchLego(org_image, new_legobox);    
end
end

