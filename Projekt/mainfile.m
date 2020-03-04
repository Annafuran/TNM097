clear 
clc

%Our lego color data. 
legodata = readtable('colors.csv');
colordata = legodata{:, 'rgb'}; %Contains only HEX data (rgb is wrong label). 

%Generates an array of cells.
%En legobit �r 15.8x15.8 --> 16x16
%Vi f�rstorar x4 f�r annars s�g jag ingenting.
legosize = 32;
legobox = createLegoBox(colordata, legosize);
%createDatabase(legoBox);
%Convert the cell to an array before displaying. (5 is the number on the
%legopiece. 


%Om man vill se en legobit. 
testimage = cell2mat(legobox{10,1});
%imshow(testimage)
imwrite(testimage, 'testis.png');

%Om man vill se alla legobitar. Kaos. 
%for i = 1:length(legobox)
%    testimage = cell2mat(legobox{i,1});
%    subplot(1,length(legobox),i)
%    imshow(testimage);
%end

% FIXA EGEN DATABAS
%create folder with lego images
 %for i = 1:length(legobox)
 %    lego_list = cell2mat(legobox{i,1});
 %    imwrite(lego_list, sprintf('Images/%d.png',i));
 %end

img = imread('watermelon.png');
org_img_lab = rgb2lab(img);
org_length = length(org_img_lab);

myfolder = dir('/Users/FannyBanny/Documents/TNM097/TNM097/Projekt/images/*.png');
numImg = length(myfolder);

for i = 1:length(legobox)
    temp_image = (cell2mat(legobox{i}));
    testimage{i} = imtile(legobox{i});
end
 montage(testimage)

for i = 1:numImg
    %Load file
    currFileName = myfolder(i).name;
    % Color Correlation
    currImage = imread(currFileName(:,:));
    %test_img = matchLego(img, currImage, 32);
    lego_img_lab = rgb2lab(currImage);
end
%Convert to LAB
img_lab = rgb2lab(img);



