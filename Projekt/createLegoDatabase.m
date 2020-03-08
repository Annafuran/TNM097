
%% CREATE DATABASE OF LEGOS
images = dir(fullfile('/Users/FannyBanny/Documents/TNM097/TNM097/TNM097/Projekt/Images/*.png'));
%images = dir(fullfile(folder, '*.png'));
%images = {images.name};
images = images';

for i = 1:length(images)
    currFileName = images(i).name;
    imageDB = imread(currFileName(:,:));
    imageDB = double(imageDB)/255;
    legoDatabase{i} = imageDB;
end

save('legoDatabase.mat', 'legoDatabase');

%% CREATE DATABASE OF COLORS
legodata = readtable('colors.csv');
colorrgb = legodata{:, 'rgb'};

legocolors = cell(length(colorrgb), 1);
colors = zeros(105, 3);

for i = 1:length(legocolors)                   
    
    rgbColor = hex2rgb(colorrgb{i});
    rgbColor = rgb2lab(rgbColor);
   
    colors(i,1) = rgbColor(1);
    colors(i,2) = rgbColor(2);
    colors(i,3) = rgbColor(3);
      
    red(:) = colors(i,1);
    green(:) = colors(i,2);
    blue(:) = colors(i,3);
    
end

save('colors.mat', 'colors');

%% TEST
      
% legodata2 = readtable('colors.csv');
% colorrgb2 = legodata2{:, 'rgb'};
% 
% legocolors2 = cell(length(colorrgb2), 1);
% test = zeros(105, 3);
% 
% for i = 1:length(legocolors2)                   
%     
%     rgbColor2 = hex2rgb(colorrgb2{i});
%     rgbColor2 = rgb2lab(rgbColor2);
%    
%     test(i,1) = rgbColor2(1);
%     test(i,2) = rgbColor2(2);
%     test(i,3) = rgbColor2(3);
%       
%     red2(:) = test(i,1);
%     green2(:) = test(i,2);
%     blue2(:) = test(i,3);
%     
% end
% 
% save('test.mat', 'test');
%        
     