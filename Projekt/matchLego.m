function [lego_image] = matchLego(org_image, legobox, colors)
%MATCHLEGO Summary of this function goes here
%   Detailed explanation goes here

%reference image
lego_image = cell(length(org_image), length(org_image));
%lego_image = zeros(length(org_image));

[img_rows img_cols colrChn] = size(org_image);

% Dela upp find mean och matching lego i Lab.
mean_lego_value = zeros(length(legobox),1, 3);

%for k = 1:length(legobox)
    %Gör mean för varje Lab-kanal
%end
%legopieces
val_mean_temp = 500;
 
    for j = 1:img_rows 
        j
       for k = 1:img_cols

           L1 = rgb2lab(org_image);
           
           for i = 1:length(legobox)
               L2 = rgb2lab(legobox{i});

               euclidean = sqrt((L2(:,:,1)-L1(j,k,1)).^2 + (L2(:,:,2)-L1(j,k,2)).^2+ (L2(:,:,3)-L1(j,k,3)).^2);
               %euclid(:,k) = euclidean;
               %fins shortest distence and get index min
               %[value, index] = min(euclidean);
               mean_lego_arr = zeros(length(legobox), 1);
               mean_lego_arr(i,1) = mean(mean(mean(legobox{i})));
               
               %min value?
               val_mean = mean(mean(euclidean));
               val_mean = val_mean/100;
               mean_lego = mean(mean(mean(legobox{i})));
               if (val_mean - 0.2) < mean_lego && (val_mean + 0.2) > mean_lego
               %storing lego in cells
               %tempLegopiece{k} = legobox{index};

              % val_mean = mean(mean(euclidean));
               %tempLegopiece = zeros(sizeImg, sizeImg, 3);

               %if val_mean <= val_mean_temp && val_mean ~= 0

                 %val_mean_temp = val_mean;
                lego_image{j,k} = legobox{:,i};
               end
            end
       end
    end

    disp("slut")
%end    
end
