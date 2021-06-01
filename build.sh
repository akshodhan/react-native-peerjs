#!/bin/bash

exec 2>&1

rm -rf dist/ peerjs/
mkdir dist
git clone https://github.com/peers/peerjs peerjs
cd peerjs
git apply ../decoupling.diff
../node_modules/.bin/parcel build --no-source-maps lib/exports.ts -d ../dist --out-file peerjs.min.js
cd ../
cat imports.js peerjs/dist/peerjs.min.js > dist/react-native-peerjs.js
rm peerjs/dist/peerjs.min.js

echo "Done. dist/react-native-peerjs.js"