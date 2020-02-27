function [result] = createLegoBox(colors, size)
%   Creates a box full of legos. 
%   colors = possible colors in the database.  
%   size = size on lego pieces. 

%Our legopieces. An array of cells in the same length as color data. 
%1 piece/color. 
legopieces = cell(length(colors), 1);

%FOR THE PLUPP
xLeft   = (size/4+0.5);
xRight  = (size/4*3+0.5);
yTop    = (size/4+0.5);
yBottom = (size/4*3+0.5);
 

%Diametern p� pluppen hos en legobit �r 4.8. 
%Vi tar x4 f�r annars ser jag ingenting. 
radius = (4.8*2)/2;
theta = linspace(0, 2*pi, round(4 * pi * radius));
x1 = radius*cos(theta)+xLeft;
y1 = radius*sin(theta)+yTop;
x2 = radius*cos(theta)+xRight;
y2 = radius*sin(theta)+yBottom;

%length of one side 16x2 (32)
lenSide = (16*2);

for i = 1:length(colors)                   
    %Temp legopiece that will be put in the array of cells. 
    tempLegopiece = zeros(size, size, 3);
    
    %Convert the hexcode to an rgb. 
    rgbLegoColor = hex2rgb(colors(i,1));          
    tempLegopiece(:,:,1) = rgbLegoColor(1);
    tempLegopiece(:,:,2) = rgbLegoColor(2);
    tempLegopiece(:,:,3) = rgbLegoColor(3);
    
    %create a grey border
    for k=1:length(lenSide)
        rowSide = lenSide(k);
        tempLegopiece(k,:,:) = 0.4;
        tempLegopiece(:,k,:) = 0.4;
        tempLegopiece(rowSide,:,:) = 0.4;
        tempLegopiece(:,rowSide,:) = 0.4;
    end
         
    %Where to put our plupps. 
    for k = 1:length(x1)   
        rowLeft = round(y1(k));
        colTop = round(x1(k));
        rowRight = round(y2(k));
        colBottom = round(x2(k));
        tempLegopiece(rowLeft, colTop, :) = 0;
        tempLegopiece(rowLeft, colBottom, :) = 0;
        tempLegopiece(rowRight, colTop, :) = 0;
        tempLegopiece(rowRight, colBottom, :) = 0;   
     
    end
    
    %Add the legopiece to our box. 
    legopieces{i} = {tempLegopiece};    
end

result = legopieces;

end

