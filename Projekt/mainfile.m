clear 
clc

%Our lego color data. 
legodata = readtable('colors.csv');
colordata = legodata{:, 'rgb'}; %Contains only RGB data. 

%Generates an array of cells.
%En legobit �r 15.8x15.8 --> 16x16
%Vi f�rstorar x4 f�r annars s�g jag ingenting. 
%ändra till 32 sa Sasan
legobox = createLegoBox(colordata, 32);

%Convert the cell to an array before displaying. (5 is the number on the
%legopiece. 

%Om man vill se en legobit. 
testimage = cell2mat(legobox{30,1});
imshow(testimage)
imwrite(testimage, 'testis.png');

%Om man vill se alla legobitar. Kaos. 
% for i = 1:length(legobox)
% testimage = cell2mat(legobox{i,1});
% subplot(1,length(legobox),i)
% imshow(testimage);
% end