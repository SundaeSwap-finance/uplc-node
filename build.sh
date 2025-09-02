rm -rf pkg pkg-node pkg-web pkg-bundler
wasm-pack build --target nodejs
mv pkg pkg-node

wasm-pack build --release --target web
mv pkg pkg-web
jq '.name = "uplc-web"' pkg/package.json > pkgtemp.json && mv pkgtemp.json pkg/package.json

wasm-pack build --release --target bundler
jq '.name = "uplc-bundler"' pkg/package.json > pkgtemp.json && mv pkgtemp.json pkg/package.json
mv pkg pkg-bundler