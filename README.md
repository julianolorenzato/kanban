# Kanban

Este é o projeto de uma API GraphQL para um sistema de cards de tarefas kanban.

## Entidades

As seguintes entidades compoem o projeto:

### Stage

Entidade responsável por agrupar múltiplos cards, em um futuro upgrade poderá ser utilizada para interfaces de board de estágios onde os cards passarão de um estágio para o outro.

- `id` (integer)
- `title` (string)
- `cards` (has_many(card))

### Card

Entidade principal do projeto, guarda informações a respeito de uma tarefa a ser executada.

- `id` (integer)
- `title` (string)
- `description` (string)
- `deadline` (date)
- `place` (string)
- `priority` (enum)
- `attachments` (string list)
- `stage` (belongs_to(stage))

## Camada Web

A API GraphQL encontra-se disponível na rota `/graphql` e oferece as seguintes queries:

### Listagem de cards

Lista cards da aplicação de acordo com filtros e paginação.

**Argumentos:** `page` integer (obrigatório), `pageSize` integer (obrigatório), `deadline` datestring, `priority` string, `search` string, `place` string.

Exemplo:
```graphql
query {
  cards: listCards(page: 0, pageSize: 8, deadline: "2024-11-30", priority: "high", search: "ix", place: "ho") {
    title
    deadline
    place
    description
    stage {
      title
    }
    attachments
    priority
  }
}
```

### Detalhe de card

Retorna detalhes sobre um card, baseado no `id` enviado.

**Argumentos:** `id` integer (obrigatório).

Exemplo:
```graphql
query {
  card: getCard(id: 5) {
    id
    attachments
    deadline
    description
    title
    stage {
      id
      title
    }
    priority
  }
}
```

## Execução da aplicação e testes

Para executar a aplicação, certifique-se de ter um banco PostgreSQL em execução no seu sistema e de ter as credenciais corretas configuradas no arquivo `config/dev.exs`. Após, use o comando `iex -S mix phx.server` para iniciar o servidor da API.

Para executar os testes use o comando `mix test`.

## Considerações técnicas

Este projeto inclui a entidade de `stage` para uso futuro, podendo também conter listas de membros e boards para obtenção de uma aplicação mais completa.

Foi utilizado o Plug Corsica para liberação de requisições web de qualquer origin, porém para uma aplicação em produção é aconselhável uma configuração mais específica de CORS.