using System;
using System.Text;
using Microsoft.VisualBasic;
using PROJC_.Models;
namespace PROJC_;

class Program
{
    static void Main(string[] args)
    {
        var _contex = new ConcesionariaContext();
        if (args.Length > 0)
        {
            if (args[0] == "ADDCLIENTE")
            {
                string operacao = args[0];
                string client = File.ReadAllText(args[1]);
                //Console.WriteLine(client);

                Cliente novo = new Cliente();
                novo.Nome = client.Substring(4, 20);
                novo.Sobrenome = client.Substring(24, 80);
                novo.Rg = client.Substring(104, 12);
                novo.Cpf = client.Substring(116, 20);
                novo.Endereco = client.Substring(136, 200);


                Console.WriteLine(novo.Endereco);
                _contex.Clientes.Add(novo);
                _contex.SaveChanges();
            }
            else if (args[0] == "LISTACLIENTE")
            {

                using (StreamWriter writer = new StreamWriter(args[1], false, Encoding.UTF8))
                {
                    foreach (var cliente in _contex.Clientes)
                    {
                        // Formatando os dados de acordo com as proporções do código COBOL
                        string dadosFormatados = $"{cliente.IdCliente,-4}{cliente.Nome,-20}{cliente.Sobrenome,-80}" +
                            $"{cliente.Rg,-12}{cliente.Cpf,-20}{cliente.Endereco,-200}";

                        // Escrever os dados no arquivo
                        writer.WriteLine(dadosFormatados);
                    }
                }

            }
            else if (args[0] == "ADDVEICULO")
            {
                string veiculo = File.ReadAllText(args[1]);
                

                Veiculo novo = new Veiculo();
                novo.Modelo = veiculo.Substring(4, 20);
                novo.Marca = veiculo.Substring(24, 100);
                novo.Ano = Convert.ToInt32(veiculo.Substring(124, 4));
                novo.Placa = veiculo.Substring(128, 20);
                novo.Estado = "Novo";
                novo.ValorDeCompra = Convert.ToDouble(veiculo.Substring(208, 12));
                
                foreach(ValorDiarium valor in _contex.ValorDiaria){
                    if(veiculo.Substring(168,20).Contains(valor.Tipo) && veiculo.Substring(148,20).Contains(valor.Categoria)){
                        novo.FkValorDiariaIdVal  = valor.IdVal;
                        
                    }  
                }
                _contex.Veiculos.Add(novo);
                _contex.SaveChanges();
            }
            else if (args[0] == "LISTAVEICULO")
            {

                using (StreamWriter writer = new StreamWriter(args[1], false, Encoding.UTF8))
                {
                    foreach (var veiculo in _contex.Veiculos)
                    {
                        // Formatando os dados de acordo com as proporções do código COBOL
                        string dadosFormatados = $"{veiculo.IdVeiculo,-4}{veiculo.Modelo,-20}{veiculo.Marca,-100}" +
                            $"{veiculo.Ano,-4}{veiculo.Placa,-20}{"",-20}{"",-20}{veiculo.Estado,-20}{veiculo.ValorDeCompra,-12}           ";

                        // Escrever os dados no arquivo
                        writer.WriteLine(dadosFormatados);
                    }
                }

            }
            else if (args[0] == "VENDERVEICULO")
            {
                Veiculo temporario = new Veiculo();
                VeiculoVendido vendido = new VeiculoVendido();
                string Ids = File.ReadAllText(args[1]);
                foreach (var veiculo in _contex.Veiculos)
                {
                    if (veiculo.IdVeiculo == Convert.ToInt32(Ids.Substring(8,8))){
                        
                        vendido.Ano = veiculo.Ano;
                        vendido.ValorDeVenda = veiculo.ValorDeCompra;
                        vendido.IdVend = veiculo.IdVeiculo;
                        vendido.Estado = veiculo.Estado;
                        vendido.Modelo = veiculo.Modelo;
                        vendido.Placa = veiculo.Placa;
                        temporario = veiculo;
                    }
                }
                
                
                _contex.Veiculos.Remove(temporario);
                _contex.VeiculoVendidos.Add(vendido);
                _contex.SaveChanges();
                foreach (VeiculoVendido ven in _contex.VeiculoVendidos){
                    if (ven.IdVend == vendido.IdVend){
                        vendido = ven;
                    }
                }

                Vendum vend = new Vendum();
                vend.DataVenda = DateOnly.FromDateTime(DateTime.Now);
                vend.FkVeiculoVendidoIdVeiculo = vendido.IdVeiculo;
                vend.FkClienteIdCliente = Convert.ToInt32(Ids.Substring(0,8));
                _contex.Venda.Add(vend);
                _contex.SaveChanges();


            }
            else if (args[0] == "ALUGARVEICULO")
            {
                string Ids = File.ReadAllText(args[1]);
                Veiculo atualizar = new Veiculo();
                atualizar = _contex.Veiculos.FirstOrDefault(e => e.IdVeiculo == Convert.ToInt32(Ids.Substring(8,8)));
                atualizar.Estado = "Ocupado";
                _contex.Veiculos.Update(atualizar);
                _contex.SaveChanges();

                Locacao vend = new Locacao();
                foreach(ValorDiarium valorDiaria in _contex.ValorDiaria){
                    if(valorDiaria.IdVal == atualizar.FkValorDiariaIdVal){
                        vend.Valor = (Convert.ToInt32(Ids.Substring(16,8)) * valorDiaria.Valor);

                    }
                }
                vend.DataLocacao = DateOnly.FromDateTime(DateTime.Now);
                vend.FkVeiculoIdVeiculo = atualizar.IdVeiculo;
                vend.FkClienteIdCliente = Convert.ToInt32(Ids.Substring(0,8));
                vend.Dias = Convert.ToInt32(Ids.Substring(16,8));
                _contex.Locacaos.Add(vend);
                _contex.SaveChanges();

            }
            else if (args[0] == "DEVOLVERVEICULO")
            {
                string Ids = File.ReadAllText(args[1]);
                Veiculo atualizar = null;
                foreach(Veiculo veic in _contex.Veiculos){
                    if(veic.IdVeiculo == Convert.ToInt32(Ids.Substring(8,8))){
                        atualizar = veic;
                    }
                }
                if (atualizar == null){
                    System.Console.WriteLine("Numero Informado não corresponde");
                }
                else{
                    System.Console.WriteLine("Veiculo Devolvido");
                    atualizar.Estado = "Disponivel";
                    _contex.Veiculos.Update(atualizar);
                    _contex.SaveChanges();
                }
                //atualizar = _contex.Veiculos.FirstOrDefault(e => e.IdVeiculo == Convert.ToInt32(Ids.Substring(8,8)));
                
            }
        }
        else
        {
            Console.WriteLine("Nenhum argumento fornecido.");
        }
    }
}
