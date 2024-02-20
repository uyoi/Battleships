%This function takes the width and length of ship and gives said ship a
%random coordinate on the game board.

function coords = positioning(width,length)
%Allowing for the ship to be randomly horizontal or vertical
orientation = round(rand()*1);
% random row and column starting points for the ship
startPointRow = round(rand()*9)+1; %as round(rand()*10) would include 0
startPointCol = round(rand()*9)+1;
coords = [];


% Positioning of ships with a dimension of specifically 1
if width == 1
startPoint = [startPointRow, startPointCol];
    if orientation == 1 % vertical
        %Ensuring that the ship does not impose on board boundaries,
        %flipping direction if it does
        if startPointRow <= length
            for i = 0:length 
                newCoord = [startPointRow+i,startPointCol];
                coords = [coords; newCoord];
            end
        else 
            for j = 0:length 
                newCoord = [startPointRow-j,startPointCol];
                coords = [coords; newCoord];
            end
        end
    else %horizontal
        %All processes for vertical ships are repeated for horizontal ships
        if startPointCol <= length
            for i = 0:length 
                newCoord = [startPointRow,startPointCol+i];
                coords = [coords; newCoord];
            end
        else 
            for j = 0:length 
                newCoord = [startPointRow,startPointCol-j];
                coords = [coords; newCoord];
            end
        end
    end
% This elseif function allows for the program to execute additional
% operations specific to ship with a width of 2
elseif width > 1
    if orientation == 1 % vertical
        % Ensuring the ship does not exceed boundaries in either length of
        % width
        if startPointRow <= length && startPointCol <= width
            for k = 0:width
                for i = 0:length
                     
                    if startPointRow <= length && startPointCol <= width
                        newCoord = [startPointRow + i, startPointCol + k];
                        coords = [coords, newCoord];
                   %Ensuring ship doesn't exceed boundaries in length
                    elseif startPointRow <= length 
                        newCoord = [startPointRow + i, startPointRow - k];
                        coords = [coords, newCoord];
                    %Ensuring ship doesn't exceed boundaries in width
                    elseif startPointCol <= width
                        newCoord = [startPointRow - i, startPointCol + k];
                        coords = [coords, newCoord];
                    end
                end
            end
        end

    else %horizontal
        if startPointRow <= width && startPointCol <= length
            for k = 0:length
                for i = 0:width
                    if startPointRow <= width && startPointCol <= length
                        newCoord = [startPointRow + i, startPointCol + k];
                        coords = [coords, newCoord];
                   
                    elseif startPointRow <= width 
                        newCoord = [startPointRow + i, startPointRow - k];
                        coords = [coords, newCoord];
                    
                    elseif startPointCol <= length
                        newCoord = [startPointRow - i, startPointCol + k];
                        coords = [coords, newCoord];
                    end
                end
            end
        end
    end
end


