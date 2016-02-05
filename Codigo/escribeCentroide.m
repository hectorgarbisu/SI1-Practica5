function mapa = escribeCentroide(W,conjunto,nombre,dim1,dim2)
    [x,y,mapa] = calculaCentroide(W,conjunto,dim1,dim2);
    text(x,y,nombre);
end

function [x,y,mapa] = calculaCentroide(W,distro,dim1,dim2)
    xs = zeros(1,size(distro,2));
    ys = xs;
    mapa = zeros(dim1,dim2);
    for i=1:size(xs,2)
        distX = dist(W,distro(:,i));
        [~,minIdx] = min(distX);
        [xtemp,ytemp] = getXY(dim1,dim2,minIdx);
        xs(i) = xtemp;
        ys(i) = ytemp;
        mapa(xtemp+1,ytemp+1) = mapa(xtemp+1,ytemp+1)+1; 
    end    
    x = mean(xs);
    y = mean(ys);
end