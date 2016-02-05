function [d] = distancia(dim1,dim2,idx)
    dist1 = 0:dim1-1;
    dist2 = 0:dim2-1;
    dist1 = dist1-floor(idx/dim2);
    dist2 = dist2-mod(idx,dim2);
    dist1 = ones(dim1,1)*dist1;
    dist2 = ones(dim2,1)*dist2;
    if(dim1==dim2)
        d = sqrt(dist1'.^2+dist2.^2);
    end
    d = reshape(d',100,1);
end