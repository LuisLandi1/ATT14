```mermaid
classDiagram
direction TB
    class Hospede {
	    +String nome
	    +String email
	    +int telefone
	    +String documento
	    +historicoReservas()
    }

    class Reserva {
	    +int id
	    +Date dataCheckIn
	    +Date dataCheckOut
	    +String tipoQuarto
	    +boolean confirmada
	    +registrarReserva()
	    +cancelarReserva()
    }

    class Quarto {
	    +int numero
	    +int preco
	    +String tipo
	    +boolean disponivel
	    +atualizarStatus()
    }

    class PrecoDinamico {
	    +float tarifaBase
	    +float tarifaAtual
	    +ajustarPreco()
    }

    class CheckInOut {
	    +boolean checkInRealizado
	    +boolean checkOutRealizado
	    +realizarCheckIn()
	    +realizarCheckOut()
    }

    class GestaoQuartos {
	    +atualizarDisponibilidade()
	    +gerenciarItens()
    }

    class LimpezaManutencao {
	    +solicitarLimpeza()
	    +solicitarManutencao()
    }

    class Financeiro {
	    +registrarPagamento()
	    +gerarRelatorio()
    }

    class Cliente {
	    +String nome
	    +String preferencias
	    +atualizarPerfil()
    }

    class Funcionario {
	    +String nome
	    +String cargo
	    +int horasTrabalhadas
	    +atribuirTarefa()
    }

    class TaxasTarifas {
	    +float desconto
	    +aplicarPromocao()
    }

    Hospede "1" -- "n" Reserva : realiza
    Reserva "1" -- "1" Quarto : associa
    Reserva "1" -- "1" CheckInOut : gerencia
    GestaoQuartos "1" -- "n" Quarto : controla
    LimpezaManutencao "1" -- "n" Quarto : monitora
    Financeiro "1" -- "n" Reserva : processa
    Cliente "1" -- "n" Reserva : consulta
    Funcionario "1" -- "n" LimpezaManutencao : executa
    TaxasTarifas "1" -- "n" PrecoDinamico : aplica

```






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
