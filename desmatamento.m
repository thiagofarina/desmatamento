% Instruções:
%
% $ octave
% octave> source("desmatamento.m");
% octave> imgEntrada = imread("caminho/para/a/imagem.jpg");
% octave> imgSaida = CalculaDesmatamento(img);
% octave> imwrite(imgSaida, "caminho/para/salvar/a/imagem.jpg");

imgEntrada = imread("imagemTrab2.jpg");

% ALGORITMO BEGIN
numLinhas = rows(imgEntrada);
numColunas = columns(imgEntrada);

imgConvertida = rgb2hsv(imgEntrada);
colormap(hsv(64));

imgSaida = zeros(size(imgEntrada));
colormap(gray(64));

areaDesmatada = 0;

% Para cada pixel da imagem.
for linha = 1 : numLinhas
  for coluna = 1 : numColunas
    % comparar com o valor do desmatamento de acordo com o angulo
    % hue(primeira dimensão do hsv) se for igual somar 90 m²
    if ((imgConvertida(linha, coluna) < 0.2) ||
        (imgConvertida(linha, coluna) > 0.4))
      areaDesmatada = areaDesmatada(1) + 90;
    else
      imgSaida(linha, coluna) = 1;
    endif;
  endfor;
endfor;

printf("Área Desmatada: %d", areaDesmatada);
colormap(gray(64));

% ALGORITMO END

imwrite(imgSaida, "areaVerde.jpg");

% Parametros:
% imgEntrada:
% imgSaida:
%
function imgSaida = CalculaDesmatamento(imgEntrada)
  numLinhas = rows(imgEntrada);
  numColunas = columns(imgEntrada);

  imgConvertida = rgb2hsv(imgEntrada);
  colormap(hsv(64));

  imgSaida = zeros(size(imgEntrada));
  colormap(gray(64));

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

  printf("Área Desmatada: %d", areaDesmatada);
  colormap(gray(64));
endfunction;
