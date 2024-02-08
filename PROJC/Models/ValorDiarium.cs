using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class ValorDiarium
{
    public int IdVal { get; set; }

    public string? Categoria { get; set; }

    public string? Tipo { get; set; }

    public double? Valor { get; set; }

    public virtual ICollection<Veiculo> Veiculos { get; set; } = new List<Veiculo>();
}
