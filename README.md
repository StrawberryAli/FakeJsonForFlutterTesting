O app faz requerimento do site https://my-json-server.typicode.com/StrawberryAli/FakeJsonForFlutterTesting

AVISO: Como o site em si não é um servidor, nenhuma mudança que tentar fazer com o aplicativo (Ou de qualquer outra forma indireta) será fisicamente efetivada

O json:
  O json contém nele uma estrutura chamada "posts". Cada item dessa estrutra contém três parâmetros:
  - id
    O id é o parâmetro que determina o link individual de cada item, apresentado no formato https://my-json-server.typicode.com/StrawberryAli/FakeJsonForFlutterTesting/posts/{id_do_item}
    Por exemplo, o item com id 2 pode ser acessado com o link https://my-json-server.typicode.com/StrawberryAli/FakeJsonForFlutterTesting/posts/2
  - title
    Um valor puramente descritivo
  - body
    Um valor puramente descritivo

O que o app faz:
  O app oferece 4 funções para requerir o api do "servidor":
  - get - Exibe o objeto "post" associado ao id que o usuário colocar como input (Falha se o id do input não existir no json)
  - post - Cria um novo objeto "post" com os dados passados pelo input (Falha se o id do input já existir no json)
  - update - Associar novos valores para um objeto "post" com valores passados pelo input (Falha se o id do input não existir no json)
  - delete - Deleta o objeto "post" do id passado no input (Falha se o id do input não existir no json)
    
  Cada uma dessas funções recebe os parâmetros através de uma tela de input. No caso do get e do delete, apenas o id do post a ser requerido é necessário. No caso do post e do update, "title" e "body" também precisam ser informados pelo usuário
  
  Após o requerimento ser concluído, o app irá mostrar na tela os valores de "title" e "body" na tela do  post requerido (se o post for nulo, não será mostrado nada na tela)
  Um erro será mostrado ao invés caso o requerimento tenha falhado

Como o input é feito:
  A tela de input recebe uma lista de strings (chamada inputFields no programa), cada string sendo o nome de um parâmetro para fazer o input, e cria um campo de input de texto para cada um
  
  O usuário pode digitar em cada campo, e quando quiser pode apertar o botão presente abaixo dos campos para confirmar o input
  
  Quando o input é confirmado, a tela de input fecha e retorna um mapa, em que cada parâmetro é uma chave associada aos valores passados pelo usuário

Exemplos de execução:

  Exemplo 1:
    Função executada: post (Cria novo objeto)
    
    Lista de parâmetros: ['id','title','body']
    
    Input do usuário: id: 6; title: titulo qualquer; body: descricao qualquer
    
    Valor de retorno da tela de input:
      {
        "id":"6",
        "title":"titulo qualquer",
        "body":"descricao qualquer"
      }
      
    Valor de retorno do requerimento:
      {
        "id":"6",
        "title":"titulo qualquer",
        "body":"descricao qualquer"
      }
      
    Resultado apresentado na tela:
    
      titulo qualquer
      
      descricao qualquer
      
  Exemplo 2:
    Função executada: get (busca objeto existente)
    
    Lista de parâmetros: ['id']
    
    Input do usuário: id: 4
    
    Valor de retorno da tela de input:
      {
        "id":"4"
      }
    
    Valor de retorno do requerimento:
      {
        "id": 4,
        "title": "Id 4",
        "body": "Item 4"
      }
    
    Resultado apresentado na tela:
      Id 4
      Item 4
      
  Exemplo 3:
    Função executada: delete (remove objeto existente)
    
    Lista de parâmetros: ['id']
    
    Input do usuário: id: 1
    
    Valor de retorno da tela de input:
      {
        "id":"1"
      }
    
    Valor de retorno do requerimento:
      null
    
    Resultado apresentado na tela:
      (Nada é apresentado no espaço que apareceria os valores de "title" e "body")

  Exemplo 4:
    Função executada: update (Atualiza objeto existente)
    
    Lista de parâmetros: ['id','title','body']
    
    Input do usuário: id: 3; title: titulo novo; body: descricao nova
    
    Valor de retorno da tela de input:
      {
        "id":"3",
        "title":"titulo novo",
        "body":"descricao nova"
      }
    
    Valor de retorno do requerimento:
      {
        "id":"6",
        "title":"titulo novo",
        "body":"descricao nova"
      }
    
    Resultado apresentado na tela:
      titulo novo
      descricao nova
