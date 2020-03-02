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

%Om man vill se en legobit. 
testimage = cell2mat(legobox{30,1});
imshow(testimage)
grid on
imwrite(testimage, 'testis.png');

%Om man vill se alla legobitar. Kaos. 
% for i = 1:length(legobox)
% testimage = cell2mat(legobox{i,1});
% subplot(1,length(legobox),i)
% imshow(testimage);
% end