# Instalação do Quartus Prime em Sistemas Operacionais Linux

> Tutorial adaptado de [https://github.com/arthurmteodoro/install-quartus-linux](https://github.com/arthurmteodoro/install-quartus-linux)

O Quartus Prime é a ferramenta para desenvolvimento da Intel para FPGAs. Através dela, é possível desenvolver circuitos digitais com o uso de diagramas de bloco, ou utilizando uma HDL -- Hardware Description Language, tal como VHDL ou (System)Verilog. A ferramenta possui suporte para os sistemas operacionais Windows ou Linux. Entretanto, apesar de mais otimizada, no ambiente Linux, sua instalação não é tão simples quanto no Windows.

Segundo a [a página de suporte da Intel](https://www.intel.com/content/www/us/en/programmable/support/support-resources/download/os-support.html), as ferramentas de desenvolvimento para FPGA da Intel apresentam suporte para os seguintes sistemas GNU/Linux (a lista apresenta apenas as versões não-comerciais):

- CentOS 8.2
- Ubuntu 18.04 LTS
- Ubuntu 20 LTS

> 💁 Observe que na mesma página o ModelSim (hoje substituído pelo QuestaSim) não possui suporte para as distribuições GNU/Linux (não-comerciais). Ao longo deste tutorial iremos entender o que pode ser feito para reverter essa limitação.

Este tutorial foi executado e testado em um sistema operacional **GNU/Linux Ubuntu 20.04.1 LTS**. Todavia, versões anteriores, ou mesmo outras distribuições Linux também podem utilizá-lo com pequenas diferenças, principalmente no que tange a biblioteca _libpng12-0_, uma vez que tal biblioteca ainda pode ter suporte do sistema.

## Fazendo o Download da Ferramenta

Existem algumas versões do Quartus Prime, sendo a versão **Pro** a mais completa e a **Lite** a mais simplista. Neste tutorial, será apresentada a instalação da versão Lite, uma vez que esta é a única versão gratuita do Quartus Prime. A ferramenta pode ser baixada no site da [Intel](https://fpgasoftware.intel.com/?edition=lite&platform=linux).

> 💁 A versão Lite do Quartus Prime é suficiente para realizar todas as atividades práticas de GCET231.

Para realizar o download pelo navegador, é necessário uma conta no Programa de FPGAs Intel. A criação desta conta é gratuita, podendo ser realizada [neste link](https://www.intel.com/content/www/us/en/forms/fpga/fpga-individual-registration.html).

É recomendado que você realize o download da versão mais recente, desde que haja suporte para o seu dispositivo. Para a versão 20.1.1, escolhemos a opção de Arquivos Combinados (_Combined Files_), que possui o tamanho de 6.4 GB.

> 💁 Apesar de já termos uma versão 21.1 do Quartus Prime Lite, ela utiliza o simulador QuestaSim, o qual requer uma licença específica (e gratuita) para uso. Se quiser evitar essa parte, pode baixar a versão 20.1.1. Ela é suficiente para realizar nossas práticas.

## Preparando o Sistema

A partir da mudança de Quartus II para Quartus Prime, a ferramenta começou a apresentar suporte nativo a sistemas 64-_bits_. Porém, a ferramenta de simulação _ModelSim_ não! Logo, ainda é necessário a instalação de algumas bibliotecas 32-_bits_. A instalação de tais bibliotecas pode ser feita executando os comandos em um terminal:

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libxft2:i386 libxext6:i386 libncurses5:i386 bzip2:i386
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get install lib32z1
```

> 💁 A necessidade de algumas dessas bibliotecas pode variar de acordo com a versão do Linux que você está usando. Uma dica é instalar à medida em que o instalador ou o próprio Quartus Prime instalado vai "reclamando".

## Instalação do Quartus Prime

Após o download do Quartus Prime e a configuração do ambiente, é a vez de realizar a sua instalação no sistema. Primeiramente, o arquivo baixado deve ser descompactado. Na pasta descompactada, é possível ver um arquivo _setup.sh_. Porém, ele deve ser executado, uma vez que o processo de instalação costuma ser mais demorado.

Na pasta components, estão os executáveis para a instalação do Quartus Prime. Inicialmente, deve ser executado o _QuartusLiteSetup-20.1.1.720-linux.run_, usando o comando:

```bash
./QuartusLiteSetup-20.1.1.720-linux.run
```

Na tela inicial você deve aceitar a licença para a instalação do Quartus Prime. Após o termo de aceite, é possível escolher a pasta onde o Quartus Prime será instalado. Recomendamos o uso da pasta `/home/${USER}/intelFPGA/20.1.1`, muito parecida com a sugestão original, exceto pelo fato da pasta padrão ser chamada de `intelFPGA_lite`. Entretanto, esse não é o padrão para o _ModelSim_. Logo, é recomendado o uso do diretório `intelFPGA`.

Agora escolha quais componentes serão instalados. Recomendamos a instalação de cada _software_ (_Quartus Prime, Quartus Prime Help e ModelSim_) separadamente. Logo, a escolha dos componentes deve ser igual à imagem abaixo:

![Componentes que devem ser instalados nesta parte do tutorial](https://raw.githubusercontent.com/arthurmteodoro/install-quartus-linux/master/images/1_comps_install_quartus.png)

Após essa etapa, é necessário prosseguir a instalação, aguardando a tela de confirmação. Chegando nesta tela, pressione o botão _Finish_ para fechar a interface gráfica.

Nesse momento, apenas o Quartus Prime foi instalado, mas ainda é necessário a instalação do _Quartus Prime Help_ e do _ModelSim_.

## Instalação do Quartus Prime Help

A instalação do Quartus Prime Help é simples, partindo apenas do comando:

```bash
./QuartusHelpSetup-20.1.1.720-linux.run
```

Após aceitar a licença, é necessário escolher em qual pasta ele será instalado, devendo ser escolhida a mesma em que o Quartus Prime foi instalada. Caso tenha escolhido a pasta recomendada neste tutorial, não é necessário se preocupar com isso, uma vez que a pasta escolhida é a padrão do Quartus Help.

Assim como o Quartus Prime, após a instalação, a interface gráfica será fechada.

## Instalação do ModelSim

Assim como a instalação do Quartus Prime Help, a instalação do ModelSim é fácil, bastando apenas introduzir o comando:

```bash
./ModelSimSetup-20.1.1.720-linux.run
```

Uma vez executado, você deve escolher a versão _ModelSim - Intel FPGA Starter Edition_, uma vez que esta é a versão gratuita do ModelSim.

Assim como o Quartus Prime Help, escolha o mesmo caminho de instalação que o Quartus Prime.

## Configurando o ambiente de simulação

Para podermos executar o ModelSim diretamente a partir do Quartus Prime para simular o funcionamento do nosso circuito, é necessário realizar uma configuração simples. Abra o Quartus Prime e acesse o painel `EDA Tool Options` acessado através do menu `Tools > Options` para especificar a localização do simulador. No campo ferente ao `ModelSim-Intel`, introduza o caminho onde se encontra o executável do ModelSim Intel FPGA Edition:

- No Linux: `<QUARTUS_INSTALL_DIR>/modelsim_ase/linuxaloem`
- No Windows: `<QUARTUS_INSTALL_DIR>/modelsim_ase/win32aloem`

![Configuração do Diretório do ModelSim](https://github.com/GCET231/tutorial3-simulacao-hdl/blob/4e2aedc852a5c6132a493f12a9b696a6c1f57bae/Quartus-Prime-ModelSim/images/91-eda_tools.png)

> Observe que existem duas referências ao **ModelSim**. Certifique-se de preencher a informação acima no campo **ModelSim-Altera**.

## Execução e Integração do Quartus Prime com o Sistema Operacional

### Execução do Quartus Prime

Para realizar a execução do Quartus no Linux, basta executar o comando

```bash
/home/${USER}/intelFPGA/20.1.1/quartus/bin/quartus --64bit
```

O Quartus Prime será executado normalmente.

### Integração com o Sistema

A integração do Quartus Prime com o sistema operacional não é necessária, mas é altamente recomendada.

#### Variável de ambiente `PATH`

Para conseguir executar o Quartus Prime a partir de um terminal sem ser necessário digitar o caminho completo, você pode criar uma variável `PATH` para isso. Primeiramente, é preciso criar o arquivo `quartus.sh` dentro do diretório `/etc/profile.d` com o seguinte conteúdo:

```bash
export PATH=$PATH:/home/${USER}/intelFPGA/20.1.1/quartus/bin
```

Após isso, é necessário tornar o arquivo executável com o comando:

```bash
chmod +x /etc/profile.d/quartus.sh
```

Repita o procedimento para o ModelSim, criando um arquivo `modelsim.sh` dentro do diretório `/etc/profile` utilizando agora o conteúdo:

```bash
export PATH=$PATH:/home/${USER}/intelFPGA/20.1.1/modelsim_ase/bin
```

Após isso, é necessário tornar o arquivo executável com o comando:

```bash
chmod +x /etc/profile.d/modelsim.sh
```

Como o arquivo `profile.d` só é executado quando é feito o login, é necessário fazer o _logout_ do usuário, ou simplesmente executar os comandos

```bash
source /etc/profile.d/quartus.sh
source /etc/profile.d/modelsim.sh
```

### Driver para a conexão USB-Blaster

Para testar os seus projetos na placa FPGA é necessário instalar os drivers do dispositivo.

O driver para a conexão USB-Blaster da Intel é suportado somente em algumas distribuições Linux. Logo, se faz necessário algumas alterações para o completo funcionamento em outras distribuições.

Inicialmente, você deve criar o arquivo `51-altera-usb-blaster.rules` dentro do diretório `/etc/udev/rules.d/` contendo:

```bash
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```

O arquivo deve ser _recarregado_ usando o comando `udevadm`.

> **Atenção:** Todos os componentes Intel FPGA devem estar desconectados antes de executar esse comando!

```bash
udevadm control --reload
```

> Para simplificar, você pode usar o script disponível [nesse arquivo](../scripts/quartus-setup.sh).

Para verificar se a instalação foi bem sucedida, conecte o dispositivo FPGA e execute:

```bash
/home/${USER}/intelFPGA/20.1/quartus/bin/jtagconfig
```

ou simplesmente:

```bash
jtagconfig
```

Você terá usa saída parecida com:

```bash
1) USB-Blaster [USB 1-1.1]
020B30DD   EP2C15/20
```

Caso a saída não apresente o nome da placa, você terá um problema para a inicialização do `nios2 tools`. Para resolver este problema, execute:

```bash
mkdir /etc/jtagd
cp /home/${USER}/intelFPGA/20.1/quartus/linux/pgm_parts.txt /etc/jtagd/jtagd.pgm_parts
```

e reinicie o processo `jtagd`:

```bash
$ jtagconfig
1) USB-Blaster [2-4]
020F30DD
$ killall jtagd
$ jtagd
$ jtagconfig
1) USB-Blaster [2-4]
020F30DD EP3C25/EP4CE22
```

Caso você receba uma mensagem de erro sobre _linux64_, crie um link simbólico de _linux_ para _linux64_ em `/home/${USER}/intelFPGA/20.1.1/quartus` usando a sequência de comandos a seguir:

```bash
ln -s /home/${USER}/intelFPGA/20.1.1/quartus/linux /home/${USER}/intelFPGA/20.1.1/quartus/linux64
```

## Execução do ModelSim

O ModelSim, quando instalado, necessita de algumas modificações em certos arquivos para seu correto funcionamento, principalmente pelo fato do suporte ao Linux ser destinado somente a algumas bibliotecas.

As alterações citadas podem ser feitas manualmente, seguindo as partes deste tutorial ou fazendo uso de um _script_ disponibilizado [neste outro tutorial](http://twoerner.blogspot.com/2017/10/running-modelsim-altera-from-quartus.html).

## Conclusão

Seguindo este tutorial, o Quartus Prime e o ModelSim podem ser instalado em um sistema Linux, rodando Ubuntu 20.04 LTS ou mesmo outras distribuições Linux. Alguns problemas poderão ocorrer, mas é fácil encontrar soluções para eles na Internet e principalmente, nas referências abaixo.

## Fontes e Recursos

- [Intel® FPGA Software Installation and Licensing](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf) (oficial)

- [Altera Design Software - Arch Linux](https://wiki.archlinux.org/index.php/Altera_Design_Software)

- [Quartus Linux Guide - Edison Cristovao](https://github.com/EdisonCristovao/quartus-linux-guide) (github)

- [Configuração da USB para programação do FPGA via JTAG - IFSC](https://wiki.sj.ifsc.edu.br/wiki/index.php/Configura%C3%A7%C3%A3o_da_USB_para_programa%C3%A7%C3%A3o_do_FPGA_via_JTAG)

- [ModelSim 17.1 (Starters Edition) for (Arch) Linux](https://gist.github.com/dries007/36c31fb8b2d712dfb41c6709f16e6e66) (gist)

- [Running ModelSim-Altera from the Quartus Prime Lite IDE under Linux](http://twoerner.blogspot.com/2017/10/running-modelsim-altera-from-quartus.html)

- [How to install Quartus & modelsim on Ubuntu 16.04 LTS](https://www.youtube.com/watch?v=uXwCPoqjpiY) (video)

- [ModelSim Linux installation](https://profile.iiita.ac.in/bibhas.ghoshal/COA_2020/Lab/ModelSim%20Linux%20installation.html)

- [A Guide on Getting ModelSim to Work on Linux](https://mil.ufl.edu/3701/docs/quartus/linux/ModelSim_linux.pdf)

- [Instalação do Quartus no Linux](https://github.com/arthurmteodoro/install-quartus-linux) (github)

- [ModelSim Instalation issues](https://gist.github.com/PrieureDeSion/e2c0945cc78006b00d4206846bdb7657) (gist)
