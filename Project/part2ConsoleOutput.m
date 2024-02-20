%The second iteration of the positioning system uses the console to output
%ship locations and graphically represent the progress of the game

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

disp(positionDatabase) %displaying the position database allows a comparison between the graphical and matrix representation of coordinates.

% Defining the dimensions of the game map
imSize = 10;
% Creating a canvas for the game's map using zeros
board = zeros(imSize);
numRows = imSize;
numCols = imSize;

% Using a for loop to cycle through each coordinate 
for row = 1:numRows
    for col = 1:numCols
        % z is used to cycle through each row of the positionDatabase to
        % see if the for loops iteration matches that of a ships
        % coordinate, so that coordinate can be manipulated to graphically
        % represent the position of a ship
        for z = 1:26
            if (row == positionDatabase(z,1)) && (col == positionDatabase(z,2))
                % Denoting the coordinates of the ships on the board with a
                % 1
                board(row,col) = 1;
            end % if statement end             
        end % inner inner for loop end
    end % inner for loop end
end % for loop end

disp(board)




