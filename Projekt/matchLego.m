function [lego_image] = matchLego(org_image, legobox)
%Finding matching lego pieces and store them as an image

%Reference image
lego_image = cell(length(org_image), length(org_image));

[img_rows img_cols colrChn] = size(org_image);

    for j = 1:img_rows    
       j
       for k = 1:img_cols
           % Make orgiginal image into LAB
           L1 = rgb2lab(org_image);
           % temp variable for finding matching lego-piece
           
           tempis = 500;
           for i = 1:length(legobox)
               %Make lego image into LAB
               L2 = rgb2lab(legobox{i});
               
               % Find euclidean distence for the different images
               euclidean = sqrt((L2(:,:,1)-L1(j,k,1)).^2 + (L2(:,:,2)-L1(j,k,2)).^2+ (L2(:,:,3)-L1(j,k,3)).^2);
               
               % Find mean values
               val_mean = mean(mean(euclidean));
               mean_lego = mean(mean(mean(legobox{i})));
               
               if abs(val_mean - mean_lego) < tempis
                %rewrite new temporary value
                tempis = abs(val_mean - mean_lego);
                
                % Store matching lego as maching pixel
                lego_image{j,k} = legobox{i};
               end
            end
       end
    end

    disp("End of run.")
%end    
end

