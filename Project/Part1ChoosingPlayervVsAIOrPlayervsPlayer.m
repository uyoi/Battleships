% This is PART 1 of the Battleship game development project. The player is
% prompted to provide whether they wish to play against an AI or another
% player

% Player is prompted to determine whether versing AI or player
gameMode = input("\nTo battle AI, enter AI. To battle another player, enter Player: ", "s");

% If statement is used for the calling the function initialising the game
% based on whether the player is versing AI or another player
if gameMode == "AI"
       fprintf("\nGamemode selected: Player vs AI.\n");
       fprintf("Player ships have been randomly distributed\n");
       fprintf("6 ships remaining\n");
    
else
    fprintf("\nGamemode selected: Player vs Player.\n");
    fprintf("Player ships have been randomly distributed\n");
    fprintf("6 ships remaining\n");
end

