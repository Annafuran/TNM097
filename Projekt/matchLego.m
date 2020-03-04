function [lego_image] = matchLego(org_image, legobox, size)
%MATCHLEGO Summary of this function goes here
%   Detailed explanation goes here

%reference image

%lego_image = cell(length(org_image), 1);
lego_image = zeros(length(org_image));

%legopieces

%for i = 1:length(org_image)
    
   % [L1, a1, b1] = xyz2lab(org_image(i,:,1), org_image(i,:,2), org_image(i,:,3));
    
   for j = 1:length(org_image)
       val_mean_temp = 500;
       j
       for k = 1:length(org_image)
           
           L1 = rgb2lab(org_image);
           L2 = rgb2lab(legobox);
           
           %euclidean = sqrt(((L1-L2).^2) + ((a1-a2).^2)+((b1-b2).^2));
           euclidean = sqrt((L2(:,:,1)-L1(j,k,1)).^2 + (L2(:,:,2)-L1(j,k,2)).^2+ (L2(:,:,3)-L1(j,k,3)).^2);
           val_mean = mean(mean(euclidean));
           tempLegopiece = zeros(size, size, 3);
           
           if val_mean <= val_mean_temp
               
               val_mean_temp = val_mean;
               %tempLegopiece = legobox{:,k};
               tempLegopiece = legobox{k};
           end
           lego_image(j,k) = tempLegopiece;
           imshow(legobox(k))
           
       end
   end
    disp("sluttt")
%end    
end

