# �Z�ύX�������č�build���ɑO��L���b�V�����c���Đ�����build�ł��Ȃ��ꍇ�́udocker builder prune�v�ŃL���b�V���폜����!
# ��AlmaLinux8�n��
FROM almalinux:8

#���ݐσA�b�v�f�[�g�̍X�V
RUN dnf -y upgrade

#�� EPEL�C���X�g�[��
RUN dnf install -y epel-release

#�� Remi��RPM�p�b�P�[�W�C���X�g�[��(CentOS8 or almalinux8)
RUN dnf -y install http://rpms.famillecollet.com/enterprise/remi-release-8.rpm
RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

#�� PHP�C���X�g�[��
#�������PHP�ݒ��O�̂��߃��Z�b�g���Ă���
RUN dnf -y module reset php
#�� php8���C���X�g�[���L���ɂ���(Ver�w��̏ꍇ�͓s�x�ύX���鎖�I)
RUN dnf -y module enable php:remi-8.2
#��dnf module list php�Ō���̗L���ݒ�m�F�\(SSH�ڑ����Ă���ꍇ)
RUN dnf -y install php php-devel php-mbstring php-pdo php-xml php-gd php-fpm php-mysqlnd php-opcache php-pecl-zip

#�����{��locale�̃C���X�g�[�� + ���ݒ�
RUN dnf -y install glibc-langpack-ja
ENV localectl set-locale LANG=ja_JP.utf8
ENV localectl set-keymap jp106
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

#�� Apache �C���X�g�[��
RUN dnf install -y httpd
ADD httpd.conf /etc/httpd/conf/

#�� composer �C���X�g�[��
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install npm nodejs �C���X�g�[��
RUN dnf install -y nodejs npm

#�����[�J�����\�z��łȂ��ƒʂ��Ȃ�(SSH�ڑ���Ɏ��s)
#RUN npm install webpack --save
#RUN npm install node-sass --save-dev

# Port
EXPOSE 80

#��systemctrl�L����
CMD ["/usr/sbin/init"]

#��Apache�L����
RUN systemctl enable httpd

#����ƃf�B���N�g���ݒ�
WORKDIR /var/www/