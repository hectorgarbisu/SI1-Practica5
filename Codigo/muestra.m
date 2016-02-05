la = loadMNISTLabels('train-labels.idx1-ubyte');
s_0 = find(la==0);
s_1 = find(la==1);
s_2 = find(la==2);
s_3 = find(la==3);
s_4 = find(la==4);
s_5 = find(la==5);
s_6 = find(la==6);
s_7 = find(la==7);
s_8 = find(la==8);
s_9 = find(la==9);

mapas = zeros(10,10,10);
mapas(:,:,1) = escribeCentroide(W,X(:,s_0),'CERO',10,10);
mapas(:,:,2) = escribeCentroide(W,X(:,s_1),'UNO',10,10);
mapas(:,:,3) = escribeCentroide(W,X(:,s_2),'DOS',10,10);
mapas(:,:,4) = escribeCentroide(W,X(:,s_3),'TRES',10,10);
mapas(:,:,5) = escribeCentroide(W,X(:,s_4),'CUATRO',10,10);
mapas(:,:,6) = escribeCentroide(W,X(:,s_5),'CINCO',10,10);
mapas(:,:,7) = escribeCentroide(W,X(:,s_6),'SEIS',10,10);
mapas(:,:,8) = escribeCentroide(W,X(:,s_7),'SIETE',10,10);
mapas(:,:,9) = escribeCentroide(W,X(:,s_8),'OCHO',10,10);
mapas(:,:,10) = escribeCentroide(W,X(:,s_9),'NUEVE',10,10);
axis([-1 11 -1 11]);

winner = zeros(10,10);
for i=1:10
for j=1:10
    [~,winner(i,j)] = max(mapas(i,j,:));
end
end
winner = winner - 1;
%         Xrep = unos(:,1)*X(:,s_1(4200,:))';
%         diferencias cuadradas
%         difeX = (W-Xrep).^2;
%         distX = sqrt(sum(difeX,2)); 
% %         distX = dist(W,X(:,ci))
% distX = dist(W,X(:,s_6(420))); %equivalente a lo de arriba
% %%  buscar Best Matching Unit
% [~,minIdx] = min(distX);

