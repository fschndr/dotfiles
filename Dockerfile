FROM zshusers/zsh

#FROM alpine

RUN apt update -y
RUN apt install git wget stow fzf -y
#RUN apk update
#RUN apk add git zsh stow

ADD / /root/.dotfiles

WORKDIR /root/.dotfiles
RUN stow --target ~ zsh

RUN wget -qO - https://github.com/getantibody/antibody/releases/download/v4.1.2/antibody_Linux_x86_64.tar.gz | tar -xzf - -C /usr/local/bin
RUN zsh -c "if [ -e ~/.antibody-plugins ]; then source <(antibody init); antibody bundle < ~/.antibody-plugins; fi"

CMD zsh