FROM ubuntu:16.04

LABEL description="SVN Server"
LABEL version="1.8"
LABEL release="20180830"

#Instalando SVN
RUN apt-get update && apt-get install subversion -y && apt-get clean

#Criando pasta que receberá o volume
RUN mkdir -p /svnrepos/bflexx

#Dando start no repositorio criado acima
RUN svnadmin create /svnrepos/bflexx

#Criando volume onde o repositório ficará
VOLUME /svnrepos/bflexx

#Entrypoint do container
ENTRYPOINT ["svnserve", "-d", "--foreground"]

EXPOSE 3690
