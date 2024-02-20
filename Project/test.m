shipA = []; %1x3
shipB = []; %1x4
shipC = []; %1x5
shipD = []; %1x4
shipE = []; %1x5

shipA = [shipA, positioning(1,3)];
shipB = [shipB, positioning(1,4)];
shipC = [shipC, positioning(1,5)];
shipD = [shipD, positioning(1,4)];
shipE = [shipE, positioning(1,5)];

%Add in shipC later
positionDatabase = [shipA;shipB;shipC;shipD;shipE];

disp(positionDatabase)


imageData = []; 
imSize = 10;
numRows = imSize;
numCols = imSize;

% MAKE SURE YOU REFERENCE THIS FROM THE PRACTICAL 
%populate using a nested loop


for row = 1:numRows
    imageRow = []; %empty vector for row
    for col = 1:numCols
        
            if row == positionDatabase(1,1) || positionDatabase(2,1)|| positionDatabase(3,1) || positionDatabase(4,1) || positionDatabase(5,1) || positionDatabase(6,1) || positionDatabase(7,1) || positionDatabase(8,1) || positionDatabase(9,1) || positionDatabase(10,1) || positionDatabase(11,1) || positionDatabase(12,1) || positionDatabase(13,1) || positionDatabase(14,1) || positionDatabase(15,1) || positionDatabase(16,1) || positionDatabase(17,1) || positionDatabase(18,1) || positionDatabase(19,1) || positionDatabase(20,1) || positionDatabase(21,1) && col == positionDatabase(1,2) || positionDatabase(2,2) || positionDatabase(3,2) || positionDatabase(4,2) || positionDatabase(5,2) || positionDatabase(6,2) || positionDatabase(7,2) || positionDatabase(8,2) || positionDatabase(9,2) || positionDatabase(10,2) || positionDatabase(11,2) || positionDatabase(12,2) || positionDatabase(13,2) || positionDatabase(14,2) || positionDatabase(15,2) || positionDatabase(16,2) || positionDatabase(17,2) || positionDatabase(18,2) || positionDatabase(19,2) || positionDatabase(20,2) || positionDatabase(21,2)
                shipLocation = 1;
            else
                shipLocation = 0;
            end

        if shipLocation == 1
            pixelVal = uint8(0);
            imageRow = [imageRow, pixelVal];  
        
        elseif shipLocation == 0
            pixelVal = uint8(255);
            imageRow = [imageRow, pixelVal];  
        end
    end
    imageData = [imageData; imageRow];
end
% Using the imresize function to make user's grid visible
resizedImage = imresize(imageData, 20);

% display as an image
imshow(resizedImage);
