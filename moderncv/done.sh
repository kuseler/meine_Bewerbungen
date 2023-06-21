#!/bin/bash
res=$(find . -maxdepth 1 -name '*.tex' ! -name 'template.tex' )
echo $res

cd Firmen;

dir_name=${res::-4}
mkdir $dir_name
cd ../
lualatex -interaction nonstopmode $res
mv "$dir_name.pdf" "Firmen/$dir_name/Lebenslauf.pdf"
mv "$dir_name.tex" "Firmen/$dir_name/Lebenslauf.tex"
cd Firmen/$dir_name
pdfjam Lebenslauf.pdf "2,3" --outfile lebenslauf.pdf
pdfjam Lebenslauf.pdf "1" --outfile anschreiben.pdf
cd ../../
removable="${res:2:-4}.*"
echo "removing $removable..."
rm $removable
