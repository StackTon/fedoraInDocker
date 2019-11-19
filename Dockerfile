FROM fedora:30
RUN dnf update -y && \
dnf install -y vim nodejs git wget sudo passwd mlocate && \
useradd alex && \
mkhomedir_helper alex && \
groupadd sudo && \
usermod -a -G sudo alex && \
chmod 666 /etc/sudoers && \
echo "%sudo   ALL=(ALL)   ALL" >> /etc/sudoers && \
chmod 0440 /etc/sudoers && \
echo "export PS1=\"\[\033[38;5;51m\][\u \w]\\$ \[$(tput sgr0)\]\"" >> /home/alex/.bashrc && \
cd /home/alex && \
mkdir projects && \
wget https://raw.githubusercontent.com/StackTon/.vimrc/master/.vimrc && \
mkdir .vim && \
mkdir .vim/autoload && \
cd .vim/autoload && \
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
cd /home/alex && \
chown -R alex .vimrc projects/ .vim && \
dnf autoremove 
