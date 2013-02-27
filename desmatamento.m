% Instruções:
%
% $ octave
% octave> source("desmatamento.m");
% octave> imgEntrada = imread("caminho/para/a/imagem.jpg");
% octave> imgSaida = CalculaDesmatamento(img);
% octave> imwrite(imgSaida, "caminho/para/salvar/a/imagem.jpg");

% Parametros:
% imgEntrada:
% imgSaida:
%
function imgSaida = CalculaDesmatamento(imgEntrada)
  numLinhas = rows(imgEntrada);
  numColunas = columns(imgEntrada);

  imgConvertida = rgb2hsv(imgEntrada);
  imgSaida = zeros(size(imgEntrada));

  for linha = 1 : numLinhas
    for coluna = 1 : numColunas
      H(1) = imgConvertida(linha, coluna, 1);
      S(2) = imgConvertida(linha, coluna, 2);
      V(3) = imgConvertida(linha, coluna, 3);

      if ((H(1) > 0.40300) && (H(1) < 0.51000))
        imgSaida(linha, coluna, 2) = 255;
        imgSaida(linha, coluna, 3) = 255;
      endif

      if ((H(1) > 0.900000) && (H(1) < 0.963110))
        if (S(2) > 0.5020000)
          if (V(3) > 0.75686)
            imgSaida(linha, coluna, 1) = 255;
            imgSaida(linha, coluna, 3) = 255;
          endif
        endif
      endif
    endfor
  endfor
endfunction;
