echo "linekd with www.processing.org/download...loading"

start chrome https://processing.org/download/

cd example

find . -name '*.pde' -exec mv {} ../../../../Desktop \;
find . -name '*.py' -exec mv {} ../../../../Desktop \;

echo "move pde and py files to Desktop Directory"

cd ../../../../Desktop
mkdir 01-Thresholding
mv 01-Thresholding.pde

mkdir example_python
find . -name '*.py' -exec mv {} example_python \;

:<<'END'
linked with www.processing.org/download

- windows -> https://download.processing.org/processing-3.5.4-windows64.zip
- linux -> https://download.processing.org/processing-3.5.4-linux64.tgz
- Mac OS -> https://download.processing.org/processing-3.5.4-macosx.zip
END
