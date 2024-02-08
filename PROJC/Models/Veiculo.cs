using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class Veiculo
{
    public string? Estado { get; set; }

    public double? ValorDeCompra { get; set; }

    public int? Ano { get; set; }

    public string? Modelo { get; set; }

    public string? Marca { get; set; }

    public string? Placa { get; set; }

    public int IdVeiculo { get; set; }

    public int? FkValorDiariaIdVal { get; set; }

    public virtual ValorDiarium? FkValorDiariaIdValNavigation { get; set; }

    public virtual ICollection<Locacao> Locacaos { get; set; } = new List<Locacao>();
}
