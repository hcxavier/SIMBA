# SIMBA - Sistema Integrado de Mapeamento de Barreiras Arquitetônic

O **SIMBA** é uma plataforma web projetada para identificar, registrar e gerenciar barreiras de acessibilidade arquitetônica em ambientes escolares. O sistema capacita usuários a atuarem como "repórteres", que podem cadastrar ocorrências, e "gestores", que analisam e gerenciam as barreiras relatadas em suas respectivas instituições.

## 📋 Tabela de Conteúdos

  * [Sobre o Projeto](https://www.google.com/search?q=%23sobre-o-projeto)
      * [Principais Funcionalidades](https://www.google.com/search?q=%23principais-funcionalidades)
  * [Tecnologias Utilizadas](https://www.google.com/search?q=%23tecnologias-utilizadas)
  * [Começando](https://www.google.com/search?q=%23come%C3%A7ando)
      * [Pré-requisitos](https://www.google.com/search?q=%23pr%C3%A9-requisitos)
      * [Instalação](https://www.google.com/search?q=%23instala%C3%A7%C3%A3o)
  * [Estrutura do Projeto](https://www.google.com/search?q=%23estrutura-do-projeto)
  * [Licença](https://www.google.com/search?q=%23licen%C3%A7a)

## Sobre o Projeto

O objetivo principal do SIMBA é centralizar as informações sobre barreiras de acessibilidade, facilitando a visualização dos problemas e o acompanhamento das soluções. A plataforma oferece um dashboard intuitivo onde os usuários podem visualizar estatísticas, pesquisar escolas, registrar novas barreiras e gerenciar os registros existentes.

### Principais Funcionalidades

  * **Autenticação de Usuários:** Sistema de login seguro com perfis distintos (Repórter e Gestor).
  * **Cadastro de Barreiras:** Repórteres podem registrar novas barreiras, especificando localização, tipo, criticidade e adicionando fotos.
  * **Gerenciamento de Registros:** Gestores podem visualizar, alterar o status e adicionar observações às barreiras de sua escola.
  * **Visualização de Dados:** Dashboards com estatísticas sobre a quantidade de escolas, registros totais, em análise e resolvidos.
  * **Pesquisa Avançada:** Ferramentas para pesquisar escolas por nome e localidade.
  * **Geração de Relatórios:** Capacidade de gerar relatórios em PDF para os registros de barreiras.

## Tecnologias Utilizadas

O projeto foi construído utilizando tecnologias modernas para garantir robustez, escalabilidade e manutenibilidade.

### **Backend**

  * **Java 17:** Versão da linguagem de programação.
  * **Jakarta Servlets & JSP:** Para a criação das páginas web e controle das requisições.
  * **Maven:** Gerenciador de dependências e automação do build.
  * **PostgreSQL:** Banco de dados relacional para armazenamento dos dados.
  * **HikariCP:** Pool de conexões de alto desempenho para o banco de dados.
  * **jBCrypt:** Biblioteca para hashing seguro de senhas.
  * **iText 7:** Biblioteca para a geração de relatórios em PDF.
  * **Logback:** Framework de logging.

### **Frontend**

  * **HTML5, CSS3, JavaScript:** Estrutura, estilização e interatividade das páginas.
  * **Tailwind CSS:** Framework CSS para uma estilização rápida e moderna.
  * **Font Awesome:** Biblioteca de ícones.

### **Banco de Dados & DevOps**

  * **Docker & Docker Compose:** Para containerização da aplicação e do banco de dados, facilitando a configuração do ambiente de desenvolvimento.
  * **Flyway:** Ferramenta para versionamento e migração do schema do banco de dados.

## Começando

Siga os passos abaixo para configurar e executar o projeto em seu ambiente local.

### Pré-requisitos

  * [Git](https://git-scm.com/)
  * [Docker](https://www.docker.com/) e [Docker Compose](https://docs.docker.com/compose/)
  * JDK 17 ou superior
  * Maven 3.8 ou superior

### Instalação

1.  **Clone o repositório:**

    ```bash
    git clone https://github.com/hcxavier/SIMBA.git
    cd SIMBA
    ```

2.  **Crie o arquivo de ambiente:**
    Crie um arquivo chamado `.env` na raiz do projeto e adicione as seguintes variáveis (substitua os valores conforme necessário):

    ```env
    POSTGRES_DB=simba
    POSTGRES_USER=simbauser
    POSTGRES_PASSWORD=simbapass
    ```

3.  **Execute o Docker Compose:**
    Este comando irá construir a imagem da aplicação, iniciar os contêineres do banco de dados e da aplicação. O Flyway executará as migrações automaticamente para criar a estrutura do banco de dados.

    ```bash
    docker-compose up -d --build
    ```

4.  **Acesse a aplicação:**
    Após a inicialização dos contêineres, a aplicação estará disponível em:
    [http://localhost:8080/index](https://www.google.com/search?q=http://localhost:8080/index)

## Estrutura do Projeto

A estrutura de diretórios segue o padrão de projetos Maven para aplicações web:

```
SIMBA/
├── .gitignore
├── docker-compose.yml
├── pom.xml
└── src/
    ├── main/
    │   ├── java/
    │   │   └── br/com/simba/
    │   │       ├── controller/  # Servlets (Controladores)
    │   │       ├── exceptions/  # Classes de exceção customizadas
    │   │       ├── model/       # Lógica de negócio, DAOs e Entidades
    │   │       └── uploads/     # Diretório para upload de imagens
    │   ├── resources/
    │   │   └── db/migration/  # Scripts de migração do Flyway (V1__init.sql)
    │   └── webapp/
    │       ├── assets/        # Arquivos CSS e JS
    │       ├── pages/         # Arquivos JSP
    │       ├── partials/      # Fragmentos de HTML (header, footer, etc.)
    │       ├── WEB-INF/
    │       │   └── web.xml    # Descritor de implantação
    │       └── index.jsp
    └── test/
```

## Licença

Este projeto está sob a licença **GNU General Public License v3.0**. Veja o arquivo `LICENSE` para mais detalhes.
