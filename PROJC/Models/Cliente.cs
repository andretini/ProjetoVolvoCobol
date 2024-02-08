using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class Cliente
{
    public int IdCliente { get; set; }

    public string? Nome { get; set; }

    public string? Sobrenome { get; set; }

    public string? Rg { get; set; }

    public string? Cpf { get; set; }

    public string? Endereco { get; set; }

    public virtual ICollection<Locacao> Locacaos { get; set; } = new List<Locacao>();

    public virtual ICollection<Vendum> Venda { get; set; } = new List<Vendum>();
}
