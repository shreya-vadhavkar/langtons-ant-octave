function Langton()
    board_size = 100;
    screen_board = ones(board_size, board_size);
    dirc = 1;
    map = containers.Map;
    ant_pos = [50, 50];
    x = 50;
    y = 50;
    i=1;
    while i<=1000000
        if ~isKey(map, mat2str(ant_pos)) || strcmp(map(mat2str(ant_pos)), "white")
            screen_board(ant_pos(1), ant_pos(2)) = 0;
            map(mat2str(ant_pos)) = "black";
            if dirc == 1
                y=y+1;
                dirc = 2;
                ant_pos = [x, y];
            elseif dirc == 2
                x=x+1;
                dirc = 3;
                ant_pos = [x, y];
            elseif dirc == 3
                y=y-1;
                dirc = 4;
                ant_pos = [x, y];
            else
                dirc = 1;
                x=x-1;
                ant_pos = [x, y];
            end
        else
            screen_board(ant_pos(1), ant_pos(2)) = 1;
            map(mat2str(ant_pos)) = "white";
            if dirc == 1
                y=y-1;
                dirc = 4;
                ant_pos = [x, y];
            elseif dirc == 4
                x=x+1;
                ant_pos = [x, y];
                dirc = 3;
            elseif dirc == 3
                y=y+1;
                ant_pos = [x, y];
                dirc = 2;
            else
                x=x-1;
                ant_pos = [x, y];
                dirc = 1;
            end
        end
        
        imagesc(screen_board); 
        colormap(gray); 
        axis equal;
        axis on;
        drawnow; 
        i=i+1;
    end
end

Langton() 
