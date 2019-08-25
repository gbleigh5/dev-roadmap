#!/bin/bash
if (( $# < 1 )); then
    echo "Usage: $(basename -- "$0") path" >&2
    exit 2
fi

if ! mkdir -p -- "$1"; then
    echo "Cannot create directory $1" >&2
    exit 1
fi

if ! cd -- "$1"; then
    echo "Cannot cd to directory $1" >&2
    exit 1
fi

# -----------

echo 'As soon as you are reading this, 6 files and 3 directories are being created'
touch .hidden.env index.html services.html services.old.html about.html about.old.html robot.txt debug.log error.log

mkdir assets dist trash
ls -ln

echo 'Three files are being created in the assets directory'
touch assets/logo.png assets/banner.png assets/styles.css
ls assets

rm *.log
mv *.old.html trash/
echo ".old files have been moved to the trash directory."

cp *.html robot.txt .hidden.env dist/
ls dist

rm -r trash
mkdir public_html
cp -r dist public_html

