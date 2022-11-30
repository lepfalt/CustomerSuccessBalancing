# Ruby

## Informações sobre a solução

O código da solução está presente no arquivo `customer_success_balancing.rb` e usa models e helpers que estão distribuídos em seus respectivos diretórios. Seguindo essa mesma linha, os casos de testes já implementados foram movidos para o diretório `/tests`.

A solução inicia com a serialização dos maps recebidos para um objeto <i>Customer</i> conhecido ao instanciar o <i>CustomerSuccessBalancing</i>. Com os objetos definidos, ao executar o balanceamento(<i>execute()</i>) é feito a ordenação de ambas as listas por score de forma crescente.

Após isso, as listas são passadas para o <i>make_associations()</i> que realiza a associação de um <i>Customer</i> a um <i>CustomerSuccess(CS)</i> de nível correspondente.

A partir das associações geradas, é feito um agrupamento por quantidade de <i>Customers</i> de um <i>CustomerSuccess(CS)</i>. Para facilitar a manipulação desse agrupamento, foi criado uma lista de objetos <i>Association</i> a fim de validar se houve um CustomerSuccess com mais associações realizadas.

Caso haja, será retornado o <i>"id"</id> desse <i>CS</i>, caso contrário é retornado 0.

## Como rodar os testes

🛠️ Versão Ruby utilizada foi a `3.0.2p107`

No terminal, execute os comandos:

```
ruby tests/customer_success_balancing_tests.rb
```
