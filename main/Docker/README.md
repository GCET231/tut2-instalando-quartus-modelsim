# Instalando o Quartus Prime com base em uma imagem Docker

O Docker é um ambiente de virtualização baseado em contêiner capaz de proporcionar ambientes de desenvolvimento sem modificar o ambiente do sistema operacional hospedeiro. Para isso, ele possui a capacidade de implantar instâncias de contêineres que fornecem um ambiente de virtualização usando o _kernel_ do sistema hospedeiro, o que o torna mais rápido e leve do que a virtualização de hardware completa, como VirtualBox, VMWare, Parallels, etc.

Para ter uma descrição detalhada dos diferentes componentes de um container Docker, visite [The Docker Ecosystem: An Introduction to Common Components](https://www.digitalocean.com/community/tutorials/the-docker-ecosystem-an-introduction-to-common-components).

Se você já tem o Docker instalado em seu sistema, siga para a [próxima etapa do tutorial](#executando-o-container-do-docker-intel-quartus-prime).

## Instalando o Docker

> _Tutorial adaptado de [How To Install and Use Docker on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)_

Este tutorial baseia-se na instalação do Docker em um sistema operacional Linux Ubuntu 20.04. Primeiramente, é comum que a versão do Docker disponível no repositório oficial não seja a mais atualizada. Para garantir que você está com a versão mais nova, nós precisamos adicionar o repositório das fontes do Docker.

Primeiro atualize a lista de pacotes:

```bash
sudo apt update
```

Em seguida, instale os requisitos para usar pacotes do `apt` sob HTTPS:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

Em seguida adicione a chave GPG para o repositório oficial do Docker:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Adicione o repositório Docker:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

Agora, atualize a base de dados de pacotes com as fontes dos novos pacotes do Docker.

```bash
sudo apt update
```

Certifique-se que você está instalando os pacotes a partir do repositório do Docker, ao invés do repositório padrão do Ubuntu.

```bash
apt-cache policy docker-ce
```

Você verá um resultado assim, embora o número da versão para o Docker possa ser diferente:

```bash
docker-ce:
  Installed: (none)
  Candidate: 5:19.03.9~3-0~ubuntu-focal
  Version table:
     5:19.03.9~3-0~ubuntu-focal 500
        500 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages
```

Observe que o `docker-ce` não está instalado, mas o candidato para a instalação é do repositório do Docker para o Ubuntu 20.04 (`focal`).

Agora você pode instalar o Docker:

```bash
sudo apt install docker-ce
```

O Docker deve agora ser instalado, o daemon iniciado e o processo habilitado a iniciar no boot. Verifique se ele está funcionando:

```bash
sudo systemctl status docker
```

O resultado deve ser similar ao mostrado a seguir, mostrando que o serviço está ativo e funcionando:

```bash
Output
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2020-05-19 17:00:41 UTC; 17s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 24321 (dockerd)
      Tasks: 8
     Memory: 46.4M
     CGroup: /system.slice/docker.service
             └─24321 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

Instalando o Docker agora não dá apenas o serviço do Docker (daemon), mas também o utilitário de linha de comando `docker`, ou o cliente do Docker.

### Executando o comandos docker sem `sudo`

Por padrão, o comando `docker` só pode ser executado pelo usuário **root** ou por um usuário no grupo **docker**, que é criado automaticamente no processo de instalação do Docker. Se você tentar executar o comando `docker` sem prefixar ele com o `sudo` ou sem estar no grupo **docker**, você terá um resultado como este:

```bash
Output
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
See 'docker run --help'.
```

Se você quiser evitar digitar `sudo` sempre que você executar o comando `docker`, adicione seu nome de usuário no grupo **docker**:

```bash
sudo usermod -aG docker ${USER}
```

Para inscrever o novo membro ao grupo, saia do servidor e logue novamente, ou digite o seguinte:

```bash
su - ${USER}
```

Você será solicitado a digitar a senha do seu usuário para continuar.

Confirme que seu usuário agora está adicionado ao grupo **docker** digitando:

```bash
id -nG
```

Se você precisar adicionar um usuário ao grupo `docker` com o qual você não está logado, declare esse nome de usuário explicitamente usando:

```bash
sudo usermod -aG docker username
```

Para verificar se você pode executar containers Docker, digite:

```bash
docker run hello-world
```

O resultado vai indicar que o Docker está funcionando corretamente:

```bash
Output
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:6a65f928fb91fcfbc963f7aa6d57c8eeb426ad9a20c7ee045538ef34847f44f1
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

...
```

O Docker inicialmente não conseguiu encontrar a imagem `hello-world` localmente, então ele baixou a imagem do [Docker Hub](https://hub.docker.com/), que é o repositório padrão. Uma vez baixada a imagem, o Docker criou um container da imagem e executou o aplicativo no container, mostrando a mensagem.

## Executando o Container do Docker Intel Quartus Prime

> Fonte: <https://github.com/no2chem/quartuslite-docker>

Considerando que você já possui o Docker instalado e pronto para receber novos containers, execute o comando:

```
docker pull no2chem/quartuslite:20.1.1
```

Esse container está configurado para instalar apenas o Quartus Prime. Caso deseje adicionar ou remover outros programas utilize a variável `QUARTUS_DISABLED`. Para saber mais, acesse o `Dockerfile` em [https://github.com/no2chem/quartuslite-docker](https://github.com/no2chem/quartuslite-docker).

Execute seu container usando o comando:

```bash
docker run --net=host -v {project_path}:/project --env DISPLAY=DISPLAY no2chem/quartuslite:20.1 quartus
```

# Recursos

- [How To Install and Use Docker on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
- [https://github.com/no2chem/quartuslite-docker](https://github.com/no2chem/quartuslite-docker)
