%% Constantes
% La cantidad de nodos que se actualizan tras cada muestra
% se reduce. La fuerza con la que se actualizan tambien
% disminuye. Ambas variables, sigma y eta, varían respecto
% a sus respectivas constantes.
iteraciones = 10;
sigma_ = 10; %Tamaño del vecindario en el tiempo
tau1 = 10000000000/log(sigma_); %Constante de actualizacion de sigma
% tau1 = 10000000000/log(sigma_); %Constante de actualizacion de sigma
eta = 1; %Learning rate
tau2 = 1000000; %Constante de actualización de eta
% A partir de 100k se empieza a levantar la cosa
% tau2 = 1000000; %Constante de actualización de eta
%% Carga e Inicialización
X = loadMNISTImages('train-images.idx3-ubyte');
[ninputs,sujetos] = size(X);
nnodos = 100;
W = rand(nnodos,ninputs);
%% Variables auxiliares
unos = ones(nnodos,ninputs);
progress_steps = 40;
%% Entrenamiento
tic
fprintf('iter |progreso%32s|\n',' ')
for iter=1:iteraciones
    fprintf('  %3d|',iter)
    for ci=1:sujetos % current individual
    %%  calcular distancias
        %La matriz de entrada se expande para poder restarse
        % % repmat parece mas lento que multiplicar por unos
    %     Xrep = repmat(X(:,ci),nnodos,1);
%         Xrep = unos(:,1)*X(:,ci)';
%     %     %diferencias cuadradas
%         difeX = (W-Xrep).^2;
%         distX = sum(difeX,2); 
        distX = dist(W,X(:,ci));
    %%  buscar Best Matching Unit
        [minVal,minIdx] = min(distX);
    %%  actualizar pesos
        % distancias a BMU
        % distancia grafica o distancia politica?
%         distBMU = dist(W,W(minIdx,:)'); % politica
        distBMU = distancia(10,10,minIdx);% grafica
        % relevancia segun distancia
        h_ = exp(-(distBMU.^2)/(2*(sigma_^2)));
        % vecindad ponderada,
        v_p = eta.*(h_*unos(1,:)).*((unos(:,1)*(X(:,ci)')-W));
        W = W + v_p;
    %%  actualizar variables
        eta = eta*exp(-(ci/tau2));
        sigma_ = sigma_*exp(-(ci/tau1));
    %%  control
        if mod(ci,round(sujetos/progress_steps))==0
            fprintf('#')
        end
    end
    fprintf('|\n')
end
toc
%% Detectar neuronas ganadoras para cada categoria
%% mostrar resultados
muestra