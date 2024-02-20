%The fourth and final iteration integrates the taking of turns between
%player and AI, in addition to scoring and the ability for either player to
%win.

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

% Random positioning for each ship, both player and bot ships
shipA = [shipA, positioning(1,3)];
shipB = [shipB, positioning(1,4)];
shipC = [shipC, positioning(1,5)];
shipD = [shipD, positioning(1,4)];
shipE = [shipE, positioning(1,5)];

shipABot = [shipABot, positioning(1,3)];
shipBBot = [shipBBot, positioning(1,4)];
shipCBot = [shipCBot, positioning(1,5)];
shipDBot = [shipDBot, positioning(1,4)];
shipEBot = [shipEBot, positioning(1,5)];

%Add in shipC later
positionDatabase = [shipA;shipB;shipC;shipD;shipE];
positionDatabaseBot = [shipABot;shipBBot;shipCBot;shipDBot;shipEBot];



imSize = 10;
% Creating blank board
board = zeros(imSize);
% Creating board which shows the hits and misses upon the enemy's board
hitBoard = zeros(imSize);
%Blank board for enemy
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


hitsPlayer = 0; % variable used to record the number of hits, whereby 26 hits will correspond to a game over
hitsBot = 0; % variable used to record the number of hits, whereby 26 hits will correspond to a game over
fprintf("Rules of the game:\nTwo Players take turns firing at one another. A missed shot will\nbe displayed as an 8 and a hit displayed as a 9. All ships\nare displayed with 1s and empty space with 0s\n\n");
% Now that both the player's and the enemy's ships have been positioned,
% the player and bot attacking rounds must be programmed
gameOver = false;

while gameOver == false



disp("Player's Turn!")
attackRow = input("Row of Attack: \n");
attackCol = input("Column of Attack: \n");
fprintf("Shot fired at (%d, %d)!\n", attackRow, attackCol)
    % Assessing whether the target coordinate is a coordinate of an enemy
    % ship sing the positionDatabaseBot
    for w = 1:26
            if (attackRow == positionDatabaseBot(w,1)) && (attackCol == positionDatabaseBot(w,2))
                fprintf("\nEnemy Hit!\n\n");
                hitsBot = hitsBot + 1;
                hitBoard(attackRow,attackCol) = 9;
                disp(hitBoard)
                disp(board)
                break;
            else
                fprintf("\nEnemy Missed!\n\n");
                hitBoard(attackRow,attackCol) = 8;
                disp(hitBoard)
                break; %break; stops the for loop from continually printing "Enemy Missed!"
            end
    end

    


% Bot's turn

disp("Enemy's Turn")

% Randomly generated positions
attackRowBot = round(rand()*9)+1;
attackColBot = round(rand()*9)+1;

for g = 1:26
    %Same processes repeated for bot as seem for player
            if (attackRowBot == positionDatabase(g,1)) && (attackColBot == positionDatabase(g,2))
                fprintf("\nFriendly Ship Hit!\n\n");
                hitsPlayer = hitsPlayer + 1;
                board(attackRowBot, attackColBot) = 9;
                disp(board)
                break;
            else
                fprintf("\nEnemy Missed Our Ships!\n\n");
                break; %break; stops the for loop from continually printing "Enemy Missed Our Ships!"
            end
end

% if statement assesses whether all the coordinates for either players have
% been hit, thus ending the game
if hitsPlayer == 26 || hitsBot == 26
    if hitsPlayer > hitsBot 
        gameOver = true;
        disp("GAME OVER, AI WINS")
    elseif hitsBot > hitsPlayer
        disp("GAME OVER, PLAYER WINS")
    end
else
    gameOver = false;
    
end
    
end

