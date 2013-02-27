% Instruções:
%
% $ octave
% octave> source("desmatamento.m");
% octave> imgEntrada = imread("imagemTrab2.jpg");
% octave> imgSaida = CalculaDesmatamento(img);
% octave> imwrite(img1, "areaVerde.jpg");

imagemEntrada = imread("imagemTrab2.jpg");

imConvertida = rgb2hsv(imagemEntrada);
colormap(hsv(64));

nrLinhas = rows(imagemEntrada);
nrColunas = columns(imagemEntrada);

imagemSaida = zeros(size(imagemEntrada));
colormap(gray(64));
areaDesmatada = 0;

% Para cada pixel da imagem.
for v = 1 : nrLinhas
  for w = 1 : nrColunas
    % comparar com o valor do desmatamento de acordo com o angulo
    % hue(primeira dimensão do hsv) se for igual somar 90 m²
    if ((imConvertida(v, w) < 0.2) || (imConvertida(v, w) > 0.4))
    % area desmatada.
      areaDesmatada = areaDesmatada(1) + 90;
    else
      imagemSaida(v, w) = 1;
    endif;
  endfor;
endfor;

printf("Área Desmatada: %d", areaDesmatada);
colormap(gray(64));
imwrite(imagemSaida, "areaVerde.jpg");

% Parametros:
% ImgEntrada:
% ImgSaida:
%
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
