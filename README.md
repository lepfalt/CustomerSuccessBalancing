# Ruby

## Informações sobre a solução

Versão Ruby utilizada foi a 3.0.2p107

O código da solução está presente no arquivo customer_success_balancing.rb e faz uso de models e helpers distribuidos em suas respectivas pastas. Seguindo essa mesma linha, os casos de testes já implementados foram movidos para a pasta /tests.

A solução inicia com a serialização dos maps recebidos para um objeto Customer conhecido ao instanciar o CustomerSuccessBalancing. Com os objetos definidos, ao executar(execute()) o balanceamento é feito a ordenação de ambas as listas por score de forma crescente.

Após isso, as listas são passadas para o make_associations() que realiza a associação de um Customer à um CustomerSuccess de nível correspondente.

A partir das associações geradas, é feito um agrupamento por quantidade de Customers de um CustomerSuccess. E para facilitar a manipulação desse agrupamento, foi criado uma lista de objetos 'Association' a fim de validar se houve um CustomerSuccess com mais associações realizadas.

Caso haja, será retornado o id desse CS, caso contrário é retornado 0.

## Como rodar os testes

No terminal, execute os comandos:

```
ruby tests/customer_success_balancing_tests.rb
```
