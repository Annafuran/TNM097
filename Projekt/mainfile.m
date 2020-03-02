clear 
clc

%Our lego color data. 
legodata = readtable('colors.csv');
colordata = legodata{:, 'rgb'}; %Contains only RGB data. 

%Generates an array of cells.
%(Storlek ska vara 32 enligt Sasan) 
legobox = createLegoBox(colordata, 32);

%Convert the cell to an array before displaying. (5 is the number on the
%legopiece. 
%org_image = imread('test_melon.p');

%testimage = matchLego(org_image, legobox, 32);

%Om man vill se en legobit. 
%testimage = cell2mat(legobox{30,1});
%imshow(testimage)
%grid on
%imwrite(testimage, 'testis.png');

testimage = {};

%Om man vill se alla legobitar. Kaos. 
 for i = 1:length(legobox)
    temp_image = (cell2mat(legobox{i}));
    testimage{i} = imtile(legobox{i});
 end
 montage(testimage)
