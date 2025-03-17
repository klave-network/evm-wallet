echo building multiple apps.wasm from Rust...
rm -f config/wasm/*.b64
cd rust
rm Cargo.lock
rm -rf target
cargo clean

rm -f apps/rust-wallet/src/bindings.rs

cargo component build --target wasm32-unknown-unknown --release
base64 -w 0 target/wasm32-unknown-unknown/release/rust_wallet.wasm > ./rust_wallet.b64

cd -
echo done