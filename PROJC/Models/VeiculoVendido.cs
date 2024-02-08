using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class VeiculoVendido
{
    public int IdVeiculo { get; set; }

    public int? IdVend { get; set; }

    public string? Estado { get; set; }

    public double? ValorDeVenda { get; set; }

    public string? Placa { get; set; }

    public int? Ano { get; set; }

    public string? Modelo { get; set; }

    public virtual ICollection<Vendum> Venda { get; set; } = new List<Vendum>();
}
