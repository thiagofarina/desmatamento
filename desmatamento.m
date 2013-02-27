% Instruções:
%
% $ octave
% octave> source("desmatamento.m");
% octave> img = imread("imagemTrab2.jpg");
% octave> img1 = CalculaDesmatamento(img);
% Output das variáveis:
% .....
% octave> imwrite(img1, "areaVerde.jpg");
%

% Parametros:
% ImgEntrada:
% ImgSaida:
%

caminhoImagemEntrada = "imagemTrab2.jpg";
imagemEntrada = imread(caminhoImagemEntrada);

imConvertida = rgb2hsv(imagemEntrada);
colormap(hsv(64));

% recuperar o tamanho da imagem
nrLinhas = rows(imagemEntrada);
nrColunas = columns(imagemEntrada);

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

function imgSaida = CalculaDesmatamento(imgEntrada)
  numLinhas = rows(imgEntrada);
  numColunas = columns(imgEntrada);

  imgConvertida = rgb2hsv(imgEntrada);
  imgSaida = zeros(size(imagemEntrada));

  areaDesmatada = 0;

  for linha = 1 : numLinhas
    for coluna = 1 : numColunas
      % Compara com o valor do desmatamento de acordo com o angulo
      % hue(primeira dimensão do hsv) se for igual somar 90 m².
      if ((imgConvertida(linha, coluna) < 0.2) ||
          (imgConvertida(linha, coluna) > 0.4))
        areaDesmatada = areaDesmatada(1) + 90;
      else
        imgSaida(v, w) = 1;
      endif;
    endfor
  endfor
endfunction;
