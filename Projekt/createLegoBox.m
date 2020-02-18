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
 

%Diametern på pluppen hos en legobit är 4.8. 
%Vi tar x4 för annars ser jag ingenting. 
radius = (4.8*4)/2;
theta = linspace(0, 2*pi, round(4 * pi * radius));
x1 = radius*cos(theta)+xLeft;
y1 = radius*sin(theta)+yTop;
x2 = radius*cos(theta)+xRight;
y2 = radius*sin(theta)+yBottom;


for i = 1:length(colors)                   
    %Temp legopiece that will be put in the array of cells. 
    tempLegopiece = zeros(size, size, 3);
    
    %Convert the hexcode to an rgb. 
    rgbLegoColor = hex2rgb(colors(i,1));          
    tempLegopiece(:,:,1) = rgbLegoColor(1);
    tempLegopiece(:,:,2) = rgbLegoColor(2);
    tempLegopiece(:,:,3) = rgbLegoColor(3);
    
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

