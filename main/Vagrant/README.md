# Instalando o Quartus Prime usando Vagrant

O Vagrant é uma ferramenta de construção e distribuição de ambientes de desenvolvimento.

Ambientes de desenvolvimento gerenciados pelo Vagrant podem ser executados em plataformas de virtualização locais, como VirtualBox e VMware, na nuvem via AWS ou OpenStack, ou em containers, como Docker.

Na prática, o Vagrant reúne o poder da virtualização com a automação por meio de scripts.

Para saber mais sobre o Vagrant acesse o [site oficial](https://www.vagrantup.com/).

## Instalando o Vagrant

A instalação do Vagrant no Linux é realmente muito simples. Em uma janela do terminal instale primeiro o VirtualBox (recomendamos ainda instalar o Virtual Box Guest Additions e o Extension Pack).

```
$ sudo apt` -y install virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack
```

Siga as instruções na tela para prosseguir.

Agora é hora de instalar o Vagrant:

```
$ sudo apt install vagrant
```

Se você está usando um PC com Windows, primeiro, faça o [download do VirtualBox](https://www.virtualbox.org/wiki/Downloads) e baixe também o **VirtualBox Oracle VM VirtualBox Extension Pack** para a mesma versão (ele é necessário para compatibilidade com USB).

Agora localize o instalador do Vagrant no site [https://www.vagrantup.com/downloads](https://www.vagrantup.com/downloads).

## Instalando o Quartus Prime em um ambiente Vagrant

Nós preparamos um ambiente para desenvolvimento FPGA usando o Vagrant. Para isso, primeiro prepare um ambiente onde irá implementar seu ambiente.

Você precisa reservar cerca de 30GB para comportar todas as ferramentas necessárias.

Faça o download do repositório:

```
$ git clone https://github.com/joaocarlos/fpga-dev-vagrant.git
$ cd fpga-dev-vagrant
```

Agora você deve poderá iniciar o seu ambiente:

```
$ vagrant up
```

Na primeira execução o Vagrant irá fazer o download da imagem Linux e dos componentes para instalação do Quartus Prime. Isso pode levar um tempo, então prepare uma xícara de café.

Você não precisará se preocupar com nada, uma vez que o script `vagrant/bootstrap.sh` se encarregará de instalar todas as dependências, fazer o download do Quartus Prime e instalar os componentes necessários.

Note que a variável de ambiente `QUARTUS_DISABLED` determina quais componentes **não** serão instalados. Certifique-se de selecionar tudo o que você precisa. Se preferir, poderá desabilitar o `modelsim_ase` para salvar espaço em disco e utilizar um simulador open-source, como [Icarus Verilog](http://iverilog.icarus.com) ou [Verilator](https://www.veripool.org/wiki/verilator).

Para acessar o seu ambiente o vagrant utiliza o protocolo SSH. O arquivo de configuração já habilita o encaminhamento das janelas do servidor `Xorg`.

```
$ vagrant ssh
```

Agora tente abrir o Quartus Prime:

```
$ quartus &
```

## Recursos

- [Vagrant](https://www.vagrantup.com)
- [VirtualBox](https://www.virtualbox.org/)
- [https://github.com/joaocarlos/fpga-dev-vagrant](https://github.com/joaocarlos/fpga-dev-vagrant.git)
