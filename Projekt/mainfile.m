
% - - - - - - - - - - -
% Before you start you need to create "legoDatabase" in 
% file: createLegoDatabase.m
% 
% Then build your image database below
% - - - - - - - - - - -

clear 
clc

% Load Lego Database
%colors = load('colors');
legoDatabase = load('legoDatabase');
% Read reference image
refImg = imread('mr_char.png');
refImg = im2double(refImg);
% Make database readable
legoDatabase = struct2cell(legoDatabase);
legoDatabase = legoDatabase{1,1};

% Match legopieces with image pixels
[legoImg] = matchLego(refImg, legoDatabase);

% Convert cell to array and then plot image
lego_img = cell2mat(legoImg);
imshow(lego_img);

%% - - - Image database - - -

%Create lego pieces 
legodata = readtable('colors.csv');
colordata = legodata{:, 'rgb'}; %Contains HEX data (rgb is wrong label). 

legobox = createLegoBox(colordata, 32);

for i = 1:length(legobox)
     lego_list = cell2mat(legobox{i});
     lego_list = double(lego_list);    
     if(all(lego_list(:) == lego_list(1)))
     else
        imwrite(lego_list, sprintf('Images/%d.png',i));
     end
 end


%Display a single Legopiece 
%testimage = cell2mat(legobox{10,1});
%imshow(testimage)
%imwrite(testimage, 'testis.png');


