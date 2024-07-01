
```shell
sudo apt update
sudo apt install lz4 -y
```

```shell
sudo systemctl stop initiad
```


```shell
cp $HOME/.initia/data/priv_validator_state.json $HOME/.initia/priv_validator_state.json.backup
```


```shell
initiad tendermint unsafe-reset-all --home $HOME/.initia --keep-addr-book
curl https://snapshots-testnet.nodejumper.io/initia-testnet/initia-testnet_latest.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.initia
```


```shell
mv $HOME/.initia/priv_validator_state.json.backup $HOME/.initia/data/priv_validator_state.json
```


```shell
sudo systemctl restart initiad
sudo journalctl -u initiad -f --no-hostname -o cat
```