function [getLegoImg] = pixelsToLego(img, imgCol, legoDatabase, colors)
    
    colorLego = size(colors);
    colorImg = size(imgCol);
    
    %getLegoImg = zeros(length(img));
    legoImg = zeros(1, colorLego(1));
    image = zeros(1, colorImg(1));
    
    for i = 1:colorImg(1)
        for j = 1:colorLego(1)
            legoImg(1) = sqrt((imgCol(i,1) - colors(j,1)).^2 + (imgCol(i,2) - colors(j,2)).^2 + (imgCol(i,3) - colors(j,3)).^2);
        end
        [~, I] = min(legoImg);
        image(i) = I;
    end
    
    testImg = size(img);
    getLegoImg = zeros(testImg(1)*32, testImg(2)*32, 3);
    
    for i = 1:testImg(1)
        for j = 1:testImg(2)
            col = img(i,j,:);
            list = find(imgCol==col);
            findl = image(list(1));
            
            x = 1+32*(i-1);
            y = 1+32*(j-1);
            
            getLegoImg(x:x+31, y:y+31, :) = legoDatabase{1,findl};
        end
    end
    
    
end