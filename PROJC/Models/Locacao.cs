using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class Locacao
{
    public int IdLocacao { get; set; }

    public int? Dias { get; set; }

    public double? Valor { get; set; }

    public DateOnly? DataLocacao { get; set; }

    public int? FkClienteIdCliente { get; set; }

    public int? FkVeiculoIdVeiculo { get; set; }

    public virtual Cliente? FkClienteIdClienteNavigation { get; set; }

    public virtual Veiculo? FkVeiculoIdVeiculoNavigation { get; set; }
}
