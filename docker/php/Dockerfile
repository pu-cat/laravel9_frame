# 〇変更を加えて再build時に前回キャッシュが残って正しくbuildできない場合は「docker builder prune」でキャッシュ削除する!
# ■AlmaLinux8系統
FROM almalinux:8

#■累積アップデートの更新
RUN dnf -y upgrade

#■ EPELインストール
RUN dnf install -y epel-release

#■ RemiのRPMパッケージインストール(CentOS8 or almalinux8)
RUN dnf -y install http://rpms.famillecollet.com/enterprise/remi-release-8.rpm
RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

#■ PHPインストール
#◆現状のPHP設定を念のためリセットしておく
RUN dnf -y module reset php
#◆ php8をインストール有効にする(Ver指定の場合は都度変更する事！)
RUN dnf -y module enable php:remi-8.2
#※dnf module list phpで現状の有効設定確認可能(SSH接続している場合)
RUN dnf -y install php php-devel php-mbstring php-pdo php-xml php-gd php-fpm php-mysqlnd php-opcache php-pecl-zip

#■日本語localeのインストール + 環境設定
RUN dnf -y install glibc-langpack-ja
ENV localectl set-locale LANG=ja_JP.utf8
ENV localectl set-keymap jp106
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

#■ Apache インストール
RUN dnf install -y httpd
ADD httpd.conf /etc/httpd/conf/

#■ composer インストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install npm nodejs インストール
RUN dnf install -y nodejs npm

#▼ローカル環境構築後でないと通せない(SSH接続後に実行)
#RUN npm install webpack --save
#RUN npm install node-sass --save-dev

# Port
EXPOSE 80

#■systemctrl有効化
CMD ["/usr/sbin/init"]

#■Apache有効化
RUN systemctl enable httpd

#■作業ディレクトリ設定
WORKDIR /var/www/