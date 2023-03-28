# wsl.conf

```bash
# [automount]
# enabled=true                # Cドライブなどの DrvFs の自動マウント
# mountFsTab=true             # WSLの起動時に /etc/fstab を読み込んで自動的にマウント
# root="/mnt/"                # DrvFsのマウント先
# options=""                  # DrvFsのマウントオプション
#                             # 規定値: `uid=1000,gid=1000,umask=000,fmask=000,dmask=000,metadata=disabled,case=off`
# crossDistro=true            # ディストリビューションを跨いだマウントをサポートする (ver2004以降)

# [network]
# generateHosts=true          # /etc/hosts を自動生成
# generateResolvConf=true     # /etc/resolv.conf を自動生成
# hostname=<string>           # WSLディストリビューションのホスト名 規定値: Windowsのホスト名と同じ

# [interop]
# enabled=true                # WSL内からWindowsプログラムの起動をサポートする (ver1809以降)
# appendWindowsPath=true      # WSL内のPATH環境変数に、WindowsのPATH環境変数を追加する (ver1809以降)

# [user]
# default=<string>            # 規定のログインユーザ名を指定する (ver2004以降) 規定値: レジストリ値に従う

# [filesystem]
# umask=0022                  # デフォルトのパーミッションを指定 (ver2004以降)

# [boot]
# systemd=true                # Systemdを有効にする (WSLバージョン 0.67.6以降)
# command=""                  # WSLインスタンス開始時に実行するコマンド、rootユーザで実行 (Windows11およびWindows Server 2022以降)
```



# .wslconfig

```bash
# [wsl2]
# kernel=<path>               # カスタムLinuxカーネルの(Windows上の)パスを指定
# kernelCommandLine=<string>  # カーネルコマンド引数を指定
# memory=<size>               # WSL2の軽量仮想マシンで使用する最大メモリサイズを指定
# processors=<number>         # WSL2の軽量仮想マシンで使用するCPU数を指定
# swap=<size>                 # WSL2の軽量仮想マシンで使用するスワップファイルのサイズを指定
#                             # 0を指定した場合はスワップファイルを使用しない
# swapFile=<path>             # スワップファイルに使用するVHDファイルの(Windows上の)パスを指定
# localhostForwarding=true    # WSLのネットワークポート待ち受けを、ホストマシンにフォワーディング
# pageReporting=true          # WSL2仮想マシンに割り当てられた未使用のメモリを再利用
# guiApplications=true        # WSLgを利用してWSL上でGUIアプリケーションの実行サポートを有効化 (Windows11のみ)
# debugConsole=false          # WSL2ディストリビューションの起動時にdmesgの内容を表示
# nestedVirtualization=true   # WSL2ディストリビューション内でNested Virtualizationを有効化 (Windows11のみ)
# vmIdleTimeout               # WSL2仮想マシンがアイドル状態になってからシャットダウンされるまでの時間(ミリ秒) (Windows11のみ)

# # <path> entries must be absolute Windows paths with escaped backslashes,
# # for example C:\\Users\\Ben\\kernel
# # <size> entries must be size followed by unit, for example 8GB or 512MB
```