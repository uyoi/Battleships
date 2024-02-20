% This is the first iteration of the ship position program. This iteration
% was discarded due to the difficulty of using graphical representations to
% denote the battleship board and ship layout.

% Empty vectors for each ship's coordinates
shipA = []; %1x3
shipB = []; %1x4
shipC = []; %1x5
shipD = []; %1x4
shipE = []; %1x5

% Using the position function to give each ship specific coordinates on the
% game's map given the length and width
shipA = [shipA, positioning(1,3)];
shipB = [shipB, positioning(1,4)];
shipC = [shipC, positioning(1,5)];
shipD = [shipD, positioning(1,4)];
shipE = [shipE, positioning(1,5)];

% Storing all ship coordinate values in a matrix for later recall
positionDatabase = [shipA;shipB;shipC;shipD;shipE];

% Empty vector for image pixel values
imageData = []; 
% Defining the dimensions of the game map
imSize =  10;
numRows = imSize;
numCols = imSize;


% Image creation using for loops from image processes of practical 3
for row = 1:numRows
    imageRow = []; %empty vector for row
    for col = 1:numCols
        % z is used to cycle through each row of the positionDatabase to
        % see if the for loops iteration matches that of a ships
        % coordinate, so that coordinate can be manipulated to graphically
        % represent the position of a ship
        for z = 1:26
            if (row == positionDatabase(z,1)) && (col == positionDatabase(z,2))
                %if ship location is 1, then it is known that a row and
                %column have aligned with a point in the positionDatabase
                shipLocation = 1;
                
            else
                shipLocation = 0;
           end
        end

        if shipLocation == 1
            % If shiplocation is 1, then the pixel value is 0, which is
            % black, hence the ship is defined as black at that point
            pixelVal=uint8(0);
            imageRow = [imageRow, pixelVal];  
            
        elseif shipLocation == 0
            
            pixelVal = uint8(255);
            imageRow = [imageRow, pixelVal];  
            
        end
        %The key issue with this program is the inability for it to display
        %each coordinate as a pixel value of 0. In this case, only one
        %pixel showed any sign of functionality - actively changing
        %positions with the change in coordinates given by the
        %positioning() function
    end
    imageData = [imageData; imageRow];
end

resizedImage = imresize(imageData, 1);

% display as an image
imshow(resizedImage);

%Used to zoom in on the final image
set(gca,'units','normalized','position',[0 0 1 1]);
