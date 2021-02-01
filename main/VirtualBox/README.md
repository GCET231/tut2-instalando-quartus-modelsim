# Configurando a Máquina Virtual do VirtualBox

Para realizar seus trabalhos você poderá utilizar os computadores do Laboratório de Sistemas Embarcados, ou uma máquina virtual em seu próprio notebook ou desktop (para trabalhar em casa). Se você tem um bom notebook, nós recomendamos que você o utilize uma vez que você o achará mais rápido, além de poder realizar as tarefas fora do laboratório.

A utilização de máquinas virtuais é recomendado por poupar o tempo de instalação e configuração dos softwares que podem muitas vezes lhe trazer alguns transtornos.

Ainda assim, você deve frequentar as sessões de laboratório para realização de demonstrações, quando for necessário o uso da plata de desenvolvimento e para pedir ajuda ao professor. Não parta do pressuposto de que você será capaz de concluir todas as tarefas por conta própria. Se você trouxer o seu notebook **não esqueça de trazer o seu carregado**. As atividades práticas demandam de alta carga computacional e pode facilmente drenar sua bateria.

Um notebook adequado para realização das atividades deve apresentar as especificações equivalente às que apresentamos a seguir:

- Intel Core i5 ou i7, i3/m5/m7/AMD pode funcionar, mas será mais lento.
- Suporte a virtualização (VT-x ou AMD-V) presenta e ativo na BIOS.
- 4GB de RAM (apesar de 8GB ser o mais recomendado).
- 24GB ou mais de espaço livre.
- Um sistema operacional de 64-bits compatível com [VirtualBox](http://www.virtualbox.org/) (Windows, Linux e MacOS devem funcionar bem).

Se você não tem um computador compatível com as especificações acima, ou se prefere executar os softwares em seu sistema operacional, pode seguir um dos guias de instalação para [Windows](https://github.com/GCET231/tutorial2-instalando-quartus-modelsim/tree/main/main/Windows) ou [Linux](https://github.com/GCET231/tutorial2-instalando-quartus-modelsim/tree/main/main/Linux).

## Instalando o VirtualBox

Primeiro, faça o [download do VirtualBox](https://www.virtualbox.org/wiki/Downloads) e baixe também o **VirtualBox Oracle VM VirtualBox Extension Pack** para a mesma versão (ele é necessário para compatibilidade com USB).

Se você utiliza um sistema operacional Linux com gerenciador de pacotes, instale o pacote do VirtualBox fornecido pela sua distribuição e encontre o pacote de extensões correspondente no site do VirtualBox.

Para instalar o VirtualBox Extension Pack, vá em `File -> Preferences`, clique no botão Extensions, e então clique na 'pasta com um triângulo'. Navegue até o diretório onde baixou o Extension Pack e selecione o arquivo baixado. Em seguida siga as instruções na tela.

## Importando a Máquina Virtual

Nós preparamos para você um disco virtual, no formato VDI que pode ser encontrado [aqui](https://drive.google.com/file/d/1jnl3SJFXHXIo54iJxkx_uZfpLtRNfobK/view?usp=sharing) (você precisará estar autenticado com sua conta institucional para fazer o download). Certifique-se de que possui cerca de 40GB de espaço livre em disco. Prepare uma xícara de café ou aproveite para assistir àquela série na Netflix, enquanto o download é concluído (~9GB).

Descompacte o arquivo para prosseguir (novamente, aquela xícara de café...). O arquivo final deve ocupar cerca de 30GB. Sugiro que você mantenha o disco compactado em um local seguro, caso alguma coisa dê errado.

Antes de criar a máquina virtual, vamos adicionar o disco ao conjunto de mídias do VirtualBox. No menu `File -> Virtual Media Manager...`. Clique em Add e localize o disco que acabou de baixar.

![Alt Text](https://recordit.co/Ifs7u9foNB)

Agora crie uma nova máquina virtual, clicando no botão `New` ou indo até o menu `Machine -> New...`. Defina a quantidade de memória RAM de acordo com o hardware que você possui. Saiba que quanto mais memória utilizar, melhor será o desempenho da sua máquina virtual. Por outro lado, utilizar muita RAM pode afetar o desempenho do seu computador. Por exemplo, se seu computador possui 8GB de RAM, utilize apenas 4GB para a sua máquina virtual.

![Alt Text](https://recordit.co/HYTMmAwNNO)

Fique livre para alterar outras configurações da máquina virtual. Quando estiver pronto, clique no botão `Start` na barra superior e aguarde.

Na tela de login, você deverá ver apenas um usuário (GCET231). Para acessar o sistema, utilize a senha `gcet231`. Não se preocupe em alterar essa senha ou criar um usuário para você, uma vez que usaremos a máquina apenas para os propósitos do curso.

Certifique-se de que está tudo funcionando indo abrindo o terminal e entrando com o comando `quartus &`. Neste momento, a janela do Quartus Prime deve abrir.

Se você notar que o conteúdo da janela não está sendo redimensionado a medida em que você aumenta a sua janela de trabalho, certifique-se de atualizar a versão do VirtualBox Guest Additions que está instalada. Para isso, clique no menu `Devices -> Insert Guest Additions CD image` e siga as instruções na tela.

## Recursos

- [Download do VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download da imagem do disco VDI](https://drive.google.com/file/d/1jnl3SJFXHXIo54iJxkx_uZfpLtRNfobK/view?usp=sharing)
