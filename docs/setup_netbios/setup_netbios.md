# Ubuntu の NetBIOS 設定方法

## NetBIOS とは

Windows ネットワークではコンピューター名 (NetBIOS 名) をブロードキャストして、受信した PC が自分の NetBIOS 名である場合に応答することで IP アドレスに変換される。これにより、DNS や hosts 以外での名前解決が可能になる。また、NetBIOS に対応したプロトコルには NetBIOS over TCP/IP (以降 NBT と表記) がある。

## Ubuntu で  NetBIOS over TCP/IP に対応する

Ubuntu で NBT に対応するには Samba の機能 (Winbind) を利用する。

### Winbind のインストール

次のコマンドで winbind をインストールする。また、Samba に依存しているらしく、Samba もインストールされてしまう。

```
sudo apt install winbind
```

### NBT に対応するための設定

/etc/nsswitch.conf の hosts に **wins** を追加する。

例．
```
...
hosts:          files mdns4_minimal [NOTFOUND=return] dns wins
...
```

### NBT のポートを開ける

```
sudo ufw allow 137
```

### Samba のサービスを止める

Samba が不要であれば次の手順でサービスを止める。

Samba のサービスを停止する。

```
sudo service smbd stop
```

Samba のサービスの自動起動を無効にする。

/etc/init/smbd.conf を編集し `start on ...` をコメントアウトする。

```
...
# start on (local-filesystems and net-device-up)
...
```

## 任意の NetBIOS 名の設定 (複数可)

/etc/samba/smb.conf を編集し、[global] セクションに `netbios aliases` の設定を追加する。複数の NetBIOS 名を設定する場合は、スペースまたはカンマ区切りで指定する。

例．
```
...
[global]
   netbios aliases = name1 name2 name3
...
```

/etc/samba/smb.conf の編集後、nmbd を再起動する。

```
sudo service nmbd restart
```

**注意事項**

* NetBIOS 名は最大15文字まで
* ネットワーク上で一意であること

## HTTP サーバーなどでサブドメインに対応する方法

「任意の NetBIOS 名の設定」のように `サブドメイン名.ドメイン名` を NetBIOS 名として設定する。

* `サブドメイン名.ドメイン名` = NetBIOS 名
* `サブドメイン名.ドメイン名` で15文字以内なので制限が厳しい。
