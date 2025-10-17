# Configuración de latexmk para compilaciones incrementales y directorio de salida
# Usa build/ como directorio de salida para artefactos (sirve como "caché" persistente)
$aux_dir = 'build';
$out_dir = 'build';

# Usa xelatex por defecto; puedes cambiar a pdflatex o lualatex si lo prefieres
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$xelatex  = 'xelatex  -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$pdf_mode = 1;      # generar PDF
$bibtex_use = 2;    # usar biber si detecta .bcf

# Reglas de limpieza: conserva PDF pero limpia artefactos
$cleanup_includes_cusdeps = 1;
$clean_ext = 'acn acr alg aux bbl bcf blg fdb_latexmk fls glg glo gls idx ilg ind ist lof log lot nav out run.xml snm synctex.gz tdo thm toc vrb xdv auxlock tmp';

# Opción: compilación continua si se invoca con -pvc
$preview_continuous_mode = 1;
