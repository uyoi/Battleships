%The third iteration produces coordinates and positions for the AI
%opponent's ships

% Empty vectors for each ship's coordinates
shipA = []; %1x3
shipB = []; %1x4
shipC = []; %1x5
shipD = []; %1x4
shipE = []; %1x5

shipABot = []; %1x3
shipBBot = []; %1x4
shipCBot = []; %1x5
shipDBot = []; %1x4
shipEBot = []; %1x5

% Using the position function to give each ship specific coordinates on the
% game's map given the length and width
shipA = [shipA, positioning(1,3)];
shipB = [shipB, positioning(1,4)];
shipC = [shipC, positioning(1,5)];
shipD = [shipD, positioning(1,4)];
shipE = [shipE, positioning(1,5)];

% Using the position function to give each ship specific coordinates on the
% game's map given the length and width for the AI
shipABot = [shipABot, positioning(1,3)];
shipBBot = [shipBBot, positioning(1,4)];
shipCBot = [shipCBot, positioning(1,5)];
shipDBot = [shipDBot, positioning(1,4)];
shipEBot = [shipEBot, positioning(1,5)];

% Storing all ship coordinate values in a matrix for later recall
positionDatabase = [shipA;shipB;shipC;shipD;shipE];
% Storing all ship coordinate values in a matrix for later recall for AI
positionDatabaseBot = [shipABot;shipBBot;shipCBot;shipDBot;shipEBot];

% Defining the dimensions of the game map
imSize = 10;

% Creating a canvas for the game's map using zeros
board = zeros(imSize);
% Creating a canvas for the game's map using zeros for AI
boardBot = zeros(imSize);
numRows = imSize;
numCols = imSize;

% Using a for loop to cycle through each coordinate on board
for row = 1:numRows
    for col = 1:numCols
        % z is used to cycle through each row of the positionDatabase to
        % see if the for loops iteration matches that of a ships
        % coordinate, so that coordinate can be manipulated to graphically
        % represent the position of a ship
        for z = 1:26
            % If statement determines which coordinates on the board align
            % with the designated positions of the ships
            if (row == positionDatabase(z,1)) && (col == positionDatabase(z,2))
                % Denoting the coordinates of the ships on the board with a
                % 1
                board(row,col) = 1;
            end              
        end
    end
end

% Replication of the processes with the for loops above, however, for the
% purpose of populating the AI's 
for rowBot = 1:numRows
    for colBot = 1:numCols
        for q = 1:26
            if (rowBot == positionDatabaseBot(q,1)) && (colBot == positionDatabaseBot(q,2))
                boardBot(rowBot,colBot) = 1;
            end              
        end
    end
end

disp(board)
disp(boardBot)



