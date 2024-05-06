# MySQL Stored Procedure Task

Este é um exemplo de script SQL que cria um banco de dados MySQL, define tabelas e uma stored procedure, e insere dados nessas tabelas usando o MySQL Workbench.

## Descrição

O script SQL contém os seguintes elementos:

1. Criação do Banco de Dados `stored_procedure`.
2. Definição das tabelas `Alunos`, `Professores`, `Cursos` e `Professores_da_Cursos`, juntamente com suas respectivas chaves estrangeiras.
3. Criação de uma stored procedure chamada `InserirAluno`, que insere alunos na tabela `Alunos` com um email gerado automaticamente.
4. Inserção de 5 cursos e 10 professores nas tabelas correspondentes.
5. Inserção de 20 alunos utilizando a stored procedure `InserirAluno`.

Abaixo o modelo lógico:

![modelo_logico](https://github.com/FernandoPoles/sql_stored_procedure/assets/164109947/c0a9e9f5-8fff-4d81-a1d0-7fda54ffc757)

## Autores

- Fernando Poles (https://github.com/seu-usuario) - Desenvolvedor
