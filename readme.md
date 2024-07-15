# DevOps Challenge

## Descrição

Oprocesso de automação do deployment contínuo de aplicações no AWS EC2 através de uma pipeline integrada com GitHub Actions e AWS CodeDeploy. Será iniciada após commits e push no repositório GitHub. Configure GitHub Actions para disparar automaticamente em push para o branch principal, usando um arquivo YAML específico para definir a pipeline. Utilize o AWS CodeDeploy para automatizar o deployment na instância EC2, garantindo eficiência e confiabilidade no processo de atualização contínua da aplicação.

[SPOILER] As instruções de entrega e apresentação do challenge estão no final deste Readme (=

### Tecnologias Utilizadas
 
- Github
- GitHub Actions
- Terraform
- CodeDeploy
- EC2 


## Instruções

## 1 - Subindo a Infraestrutua

1. Para começar, é essencial ter acesso à plataforma AWS para gerenciar seus recursos na nuvem de forma eficiente.

2. Crie um usuário na AWS e gere "Secret Keys" para acesso seguro aos recursos AWS via linha de comando. É recomendado não compartilhar essas "Secret Keys" para manter a segurança dos seus dados.

    - Selecione as políticas apropriadas, como AmazonEC2FullAccess, AmazonVPCFullAccess, ou crie uma política personalizada com as permissões necessárias para seu projeto.

3. Instale a AWS CLI na sua máquina. A AWS CLI permite interagir com os serviços da AWS de maneira simplificada e automatizada diretamente do terminal.

link p/ Instalação: [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

4. Garanta que o Terraform esteja instalado na sua máquina para gerenciar sua infraestrutura como código na AWS. O Terraform simplifica o provisionamento e a automação de recursos na AWS de forma declarativa e escalável

link p/ Instalação : [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-cli)

5. -  No seu terminal configurar as Secrets Keys do seu usuario

    - aws configure

5. Configurar as variaveis para o Deploy na infraestrutra no arquivo variables.tf na raiz do projeto

6. Inicar o terraform via linha de comando 

    - terraform init

7. Verificar se todos os recursos estão subindo corretamente 

    - terraform plan

8. Caso tudo estiver ok conforme configurado iremos implantar a infraestrtura como codigo 

    - terraform apply

## 2 - Piipeline CI/CD

1. GitHub Repositório (Push)
Após realizar alterações no código-fonte da aplicação , fazer o commit para o repositório GitHub.

2. GitHub Actions (Trigger)
GitHub Actions é configurado para monitorar o repositório em busca de alterações no branch principal(main)

Configuração: No diretório .github/workflows/main.yaml, ira definir a pipeline de CI/CD.

3. Criar AWS code Deploy

Configuração: Para configurar o CodeDeploy, você precisa de três coisas: o aplicativo CodeDeploy, o grupo de implantação do aplicativo e uma função do IAM que o CodeDeploy pode assumir para acessar as instâncias do EC2.

    ##Criar um aplicativo:## 
    
    Navegue até o Console do CodeDeploy, no painel esquerdo, clique em “ Aplicativos ” na seção “Implementar” e selecione “Criar aplicativo”.

    ![alt text](image.png)

    Em seguida, forneça o nome do seu aplicativo e use a plataforma “ EC2/On-premises ”.

    ##Criar função do IAM do CodeDeploy##

    Vá para a seção IAM e crie uma nova função

    Imagem

    Use “ AWS Service ” para entidade confiável e selecione “ CodeDeploy ” no menu suspenso para “Use Case”.

    Clique em Avançar e use a política “AWSCodeDeployRole” anexada.

    Imagem


    Dê um nome à função e salve-o.

    ##Criar um grupo de implantação##

    Vá para o aplicativo que você criou anteriormente e clique em “Criar grupo de implantação”.

    Forneça um nome para seu grupo de implantação e selecione a função que criamos anteriormente para a função de serviço.

    Você pode deixar o tipo de implantação nas configurações padrão. Selecione “Amazon EC2 instances” para alvos e use tags para identificá-los.

    imagem

    Selecione “ Nunca ” na configuração do agente, instalaremos o agente CodeDeploy em nosso sistema manualmente para este projeto.

    Você pode selecionar a configuração de implantação “OneAtATime” e habilitar o balanceamento de carga se tiver mais de uma instância , caso contrário, desmarque a opção de balanceamento de carga.

    Em seguida, clique no botão criar grupo de implantação.

4. 

4. Criar arquivo appspec.yml no qual servira de gatilho para o CodeDeploy


## Readme do Repositório

- Deve conter o título do projeto
- Uma descrição sobre o projeto em frase
- Deve conter uma lista com linguagem, framework e/ou tecnologias usadas
- Como instalar e usar o projeto (instruções)
- Não esqueça o [.gitignore](https://www.toptal.com/developers/gitignore)
- Se está usando github pessoal, referencie que é um challenge by coodesh:  

>  This is a challenge by [Coodesh](https://coodesh.com/)

## Finalização e Instruções para a Apresentação

1. Adicione o link do repositório com a sua solução no teste
2. Verifique se o Readme está bom e faça o commit final em seu repositório;
3. Envie e aguarde as instruções para seguir. Sucesso e boa sorte. =)

## Suporte

Use a [nossa comunidade](https://discord.gg/rdXbEvjsWu) para tirar dúvidas sobre o processo ou envie uma mensagem diretamente a um especialista no chat da plataforma. 
