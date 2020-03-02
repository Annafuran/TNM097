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

%For bright and dark. 
beta_dark = -0.2;
beta_bright = 1;

%Diameter for a legopiece is 4.8  
radius = (4.8*2)/2;
theta_bright = linspace(-pi, -pi/2, round(4 * pi * radius));
theta_dark = linspace(0, pi/2, round(4 * pi * radius));
x1 = radius*cos(theta_bright)+xLeft;
y1 = radius*sin(theta_bright)+yTop;
x2 = radius*cos(theta_bright)+xRight;
y2 = radius*sin(theta_bright)+yBottom;

x1_dark = radius*cos(theta_dark)+xLeft;
y1_dark = radius*sin(theta_dark)+yTop;
x2_dark = radius*cos(theta_dark)+xRight;
y2_dark = radius*sin(theta_dark)+yBottom;

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
    
    %create a border
    for k=1:length(lenSide)
        rowSide = lenSide(k);   
        %upper edge
        tempLegopiece(k,:,:) = brighten(tempLegopiece(k,:,:), beta_bright);
        %left edge
        tempLegopiece(:,k,:) = brighten(tempLegopiece(:,k,:), beta_bright);
        %bottom edge
        tempLegopiece(rowSide,:,:) = brighten(tempLegopiece(rowSide,:,:), beta_dark);
        %right 
        tempLegopiece(:,rowSide,:) = brighten(tempLegopiece(:,rowSide,:), beta_dark);
    end
         
    %Where to put our plupps. 
    for k = 1:length(x1)   
        rowLeft = round(y1(k));
        colTop = round(x1(k));
        rowRight = round(y2(k));
        colBottom = round(x2(k));
        
        rowLeft_dark = round(y1_dark(k));
        colTop_dark = round(x1_dark(k));
        rowRight_dark = round(y2_dark(k));
        colBottom_dark = round(x2_dark(k));
        
        %Brigtness
        tempLegopiece(rowLeft, colTop, :) = brighten(tempLegopiece(rowLeft, colTop, :), beta_bright);
        tempLegopiece(rowLeft, colBottom, :) = brighten(tempLegopiece(rowLeft, colBottom, :), beta_bright);
        tempLegopiece(rowRight, colTop, :) = brighten(tempLegopiece(rowRight, colTop, :), beta_bright);
        tempLegopiece(rowRight, colBottom, :) = brighten(tempLegopiece(rowRight, colBottom, :), beta_bright);
        
        %Shadow
        tempLegopiece(rowLeft_dark, colTop_dark, :) = brighten(tempLegopiece(rowLeft_dark, colTop_dark, :), beta_dark);
        tempLegopiece(rowLeft_dark, colBottom_dark, :) = brighten(tempLegopiece(rowLeft_dark, colBottom_dark, :), beta_dark);
        tempLegopiece(rowRight_dark, colTop_dark, :) = brighten(tempLegopiece(rowRight_dark, colTop_dark, :), beta_dark);
        tempLegopiece(rowRight_dark, colBottom_dark, :) = brighten(tempLegopiece(rowRight_dark, colBottom_dark, :), beta_dark);
    
        %tempLegopiece(rowLeft+1, colTop+1, :) = 0;
        %tempLegopiece(rowLeft+2, colTop+2, :) = 0;    
        %tempLegopiece(rowLeft, colBottom, :) = 0;
        %tempLegopiece(rowRight, colTop, :) = 0;
        %tempLegopiece(rowRight, colBottom, :) = 0;
      
    end
    
    %Add the legopiece to our box. 
    legopieces{i} = {tempLegopiece};    
end

result = legopieces;

end

