function [x,y] = getXY(val,~,dim2)
    y = floor((val-1)/dim2);
    x = mod((val-1),dim2);
end