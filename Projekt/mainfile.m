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

colors = load('colors');
legoDatabase = load('legoDatabase');
refImg = imread('minicat.png');
refImg = im2double(refImg);
legoDatabase = struct2cell(legoDatabase);
legoDatabase = legoDatabase{1,1};

%legoData = cell2mat(legoDatabase(1))/255;
%legoData = mat2cell(legoData(1),105, 1);
%Om man vill se alla legobitar. Kaos. 
% for i = 1:length(legoDatabase)
%     l
%     subplot(1,length(legoDatabase),i)
%     legoData = cell2mat(legoDatabase{:})/255;
% end
% imshow(testimage)

[legoImg] = matchLego(refImg, legoDatabase, 32);

lego_img = cell2mat(legoImg);
imshow(lego_img);

%% -----
img = imread('refImg.png');
org_img_lab = rgb2lab(img);
org_length = length(org_img_lab);

%myfolder = dir('/Users/FannyBanny/Documents/TNM097/TNM097/TNM097/Projekt/images/*.png');
legoData = load('legodatabase.mat');
legoData = struct2cell(legoData);

numImg = length(legoData);

%for i = 1:length(legobox)
%    temp_image = (cell2mat(legobox{i}));
%    testimage{i} = imtile(legobox{i});
%end
% montage(testimage)

for i = 1:numImg
    %Load file
    legoData = cell2mat(legoData{i});
       
    test_img = matchLego(img, legoData, 32);
    
end


% FIXA EGEN DATABAS
%create folder with lego images
% for i = 1:length(legobox)
   %  lego_list = cell2mat(legobox{i,1});
   %  imwrite(lego_list, sprintf('Images/%d.png',i));
% end



