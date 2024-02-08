using System;
using System.Collections.Generic;

namespace PROJC_.Models;

public partial class Vendum
{
    public int IdVenda { get; set; }

    public DateOnly? DataVenda { get; set; }

    public int? FkClienteIdCliente { get; set; }

    public int? FkVeiculoVendidoIdVeiculo { get; set; }

    public virtual Cliente? FkClienteIdClienteNavigation { get; set; }

    public virtual VeiculoVendido? FkVeiculoVendidoIdVeiculoNavigation { get; set; }
}
