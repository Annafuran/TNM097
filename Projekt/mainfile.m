clear 
clc

%Our lego color data. 
legodata = readtable('colors.csv');
colordata = legodata{:, 'rgb'}; %Contains only RGB data. 

%Generates an array of cells.
%En legobit är 15.8x15.8 --> 16x16
%Vi förstorar x4 för annars såg jag ingenting. 
legobox = createLegoBox(colordata, 64);

%Convert the cell to an array before displaying. (5 is the number on the
%legopiece. 

%Om man vill se en legobit. 
testimage = cell2mat(legobox{5,1});
imshow(testimage)
imwrite(testimage, 'testis.png');

%Om man vill se alla legobitar. Kaos. 
%for i = 1:length(legobox)
%testimage = cell2mat(legobox{i,1});
%subplot(1,length(legobox),i)
%imshow(testimage);
%end