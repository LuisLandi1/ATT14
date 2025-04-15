+------------------+       +-----------------+       +-------------------+
|     Hospede      | 1 --- |     Reserva     | N --- |     Quarto        |
|------------------|       |-----------------|       |-------------------|
| +nome            |       | +idReserva      |       | +numero           |
| +cpf             |       | +dataCheckin    |       | +tipo             |
| +telefone        |       | +dataCheckout   |       | +disponivel       |
| +email           |       | +status         |       | +preco            |
+------------------+       +-----------------+       +-------------------+
            |                           |
            |                           |
            |                           |
            |                           |
            |                           |
            V                           V
      +------------------+       +------------------+
      |  Pagamento       | N --- | CheckinCheckout  |
      |------------------|       |------------------|
      | +idPagamento     |       | +idCheckin       |
      | +valor           |       | +dataCheckin     |
      | +metodo          |       | +dataCheckout    |
      +------------------+       +------------------+
            |
            |
            V
      +------------------+
      |  TaxasTarifas    |
      |------------------|
      | +desconto        |
      | +tipoPromocao    |
      +------------------+

      +------------------+       +-------------------+
      | Funcionario      | 1 --- | LimpezaManutencao |
      |------------------|       |-------------------|
      | +nome            |       | +id               |
      | +cargo           |       | +tipoServico      |
      | +cpf             |       |                   |
      | +telefone        |       +-------------------+
      +------------------+


## Relacionamentos

1. **Hospede - Reserva**
   - **Relacionamento:** Um hóspede pode fazer várias reservas.
   - **Cardinalidade:** 1:N (1 hóspede pode ter várias reservas)
   - **Chave Estrangeira:** `cpf` (em **Reserva**).

2. **Reserva - Quarto**
   - **Relacionamento:** Cada reserva é associada a um único quarto.
   - **Cardinalidade:** N:1 (várias reservas podem ser feitas para o mesmo quarto)
   - **Chave Estrangeira:** `numero` (em **Reserva**).

3. **Reserva - Pagamento**
   - **Relacionamento:** Cada reserva pode ter vários pagamentos.
   - **Cardinalidade:** 1:N (uma reserva pode ter vários pagamentos)
   - **Chave Estrangeira:** `idReserva` (em **Pagamento**).

4. **Reserva - CheckinCheckout**
   - **Relacionamento:** Cada reserva tem um processo único de check-in e check-out.
   - **Cardinalidade:** 1:1 (uma reserva tem um único processo de check-in/check-out)
   - **Chave Estrangeira:** `idReserva` (em **CheckinCheckout**).

5. **Funcionario - LimpezaManutencao**
   - **Relacionamento:** Um funcionário pode executar várias tarefas de limpeza ou manutenção.
   - **Cardinalidade:** 1:N (um funcionário pode executar várias tarefas)
   - **Chave Estrangeira:** `cpfFuncionario` (em **LimpezaManutencao**).

6. **Quarto - LimpezaManutencao**
   - **Relacionamento:** Cada quarto pode ter várias tarefas de limpeza ou manutenção associadas.
   - **Cardinalidade:** 1:N (um quarto pode ter várias tarefas associadas a ele)
   - **Chave Estrangeira:** `numeroQuarto` (em **LimpezaManutencao**).

7. **PrecoDinamico - TaxasTarifas**
   - **Relacionamento:** O preço dinâmico é ajustado conforme as taxas e tarifas.
   - **Cardinalidade:** 1:N (um preço dinâmico pode ser afetado por várias promoções/taxas)
   - **Chave Estrangeira:** `desconto` (em **PrecoDinamico**).

---

# Dicionário de Dados

| **Entidade**         | **Atributo**          | **Tipo de Dado** | **Descrição**                                          | **Chave**            |
|----------------------|-----------------------|------------------|--------------------------------------------------------|----------------------|
| **Hospede**           | nome                  | String           | Nome do hóspede                                        | Chave Primária (cpf) |
|                      | cpf                   | String           | CPF do hóspede (único)                                 | Chave Primária       |
|                      | telefone              | Int              | Número de telefone do hóspede                          |                      |
|                      | email                 | String           | E-mail do hóspede                                      |                      |
| **Reserva**           | idReserva             | Int              | Identificador único da reserva                         | Chave Primária       |
|                      | dataCheckin           | Date             | Data de entrada no hotel (check-in)                    |                      |
|                      | dataCheckout          | Date             | Data de saída do hotel (check-out)                     |                      |
|                      | status                | String           | Status da reserva (confirmada/cancelada)               |                      |
|                      | cpf (Hospede)         | String           | CPF do hóspede, chave estrangeira para **Hospede**     | Chave Estrangeira    |
| **Quarto**            | numero                | Int              | Número do quarto                                       | Chave Primária       |
|                      | tipo                  | String           | Tipo de quarto (ex: luxo, standard)                    |                      |
|                      | disponivel            | Boolean          | Status de disponibilidade do quarto                    |                      |
|                      | preco                 | Float            | Preço do quarto                                        |                      |
| **Funcionario**       | nome                  | String           | Nome do funcionário                                    | Chave Primária (cpf) |
|                      | cargo                 | String           | Cargo do funcionário                                   |                      |
|                      | cpf                   | String           | CPF do funcionário (único)                             | Chave Primária       |
|                      | telefone              | String           | Telefone do funcionário                                |                      |
| **Pagamento**         | idPagamento           | Int              | Identificador único do pagamento                       | Chave Primária       |
|                      | valor                 | Float            | Valor do pagamento                                     |                      |
|                      | metodo                | String           | Método de pagamento (cartão, boleto, etc.)             |                      |
|                      | dataPagamento         | Date             | Data do pagamento                                      |                      |
|                      | idReserva (Reserva)   | Int              | Identificador da reserva, chave estrangeira para **Reserva** | Chave Estrangeira    |
| **PrecoDinamico**     | precoBase             | Float            |
