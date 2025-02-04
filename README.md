# E-Commerce - Modelo Conceitual de Banco de Dados

## 📊 Descrição do Projeto

Este projeto tem como objetivo o desenvolvimento de um modelo conceitual de banco de dados para um sistema de E-Commerce, que abrange funcionalidades essenciais para o gerenciamento de clientes, produtos, pedidos, pagamentos, entregas, fornecedores e vendedores.

O modelo foi projetado utilizando o MySQL Workbench, com foco em garantir a integridade dos dados, a normalização das tabelas e o suporte à expansão futura.

## 📦 Estrutura do Esquema Conceitual
 
### 1. Cliente

Um cliente pode ser classificado como Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas nunca ambos.

O campo tipo_cliente (ENUM) define o tipo do cliente, garantindo a exclusividade por meio de regras de integridade.

### 2. Pessoa Física e Pessoa Jurídica

As entidades armazenam informações específicas, como CPF e CNPJ, vinculadas diretamente ao cliente correspondente.

### 3. Produto

Produtos podem ser fornecidos por múltiplos fornecedores e vendidos por terceiros.

O estoque é controlado por uma tabela separada, permitindo o gerenciamento de localização e quantidade.

### 4. Pedido

Um pedido pode conter vários produtos (relacionamento N:N com a tabela Produto).

Está associado a um cliente e pode ter múltiplos pagamentos e entregas.

### 5. Pagamento

Os pagamentos são normalizados com uma tabela separada para Metodo_Pagamento, permitindo flexibilidade na adição de novas formas de pagamento.

Um pedido pode ter múltiplas formas de pagamento associadas.

### 6. Entrega

Cada entrega possui um código de rastreamento e status de acompanhamento, permitindo o controle logístico detalhado.

### 7. Fornecedor e Vendedor Terceiro

Fornecedores e vendedores têm relações definidas com produtos, permitindo que diferentes entidades gerenciem seus catálogos de forma independente.



## 🚀 Tecnologias Utilizadas

MySQL Workbench para modelagem EER

MySQL para implementação do banco de dados relacional
