caminhoImagemEntrada = "imagemTrab2.jpg";

% ler imagem de entrada
imagemEntrada = imread(caminhoImagemEntrada);
imConvertida = rgb2hsv(imagemEntrada);

colormap(hsv(64));

% recuperar o tamanho da imagem
tamanho = iminfo("imagemTrab2.jpg");
nrLinhas = tamanho(1);
nrColunas = tamanho(2);

imagemSaida = zeros(size(imConvertida));
imagemVerde = zeros(size(imagemEntrada));
map = gray(64);
colormap(map);
areaDesmatada = 0;

% para cada pixel da imagem
for v = 1 : nrLinhas
  for w = 1 : nrColunas
    % comparar com o valor do desmatamento de acordo com o angulo
    % hue(primeira dimensão do hsv) se for igual somar 90 m²
    if ((imConvertida(v, w) < 0.2) || (imConvertida(v, w) > 0.4))
    % area desmatada.
      areaDesmatada = areaDesmatada(1) + 90;
    else
      imagemVerde(v, w) = 1;
    endif;
  endfor;
endfor;

printf("Área Desmatada: %d", areaDesmatada);
map = gray(64);
colormap(map);
imwrite(imagemVerde, "areaVerde.jpg");
imshow(ind2gray(imagemVerde));
