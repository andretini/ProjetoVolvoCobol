using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PROJC_.Models;

public partial class ConcesionariaContext : DbContext
{
    public ConcesionariaContext()
    {
    }

    public ConcesionariaContext(DbContextOptions<ConcesionariaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cliente> Clientes { get; set; }

    public virtual DbSet<Locacao> Locacaos { get; set; }

    public virtual DbSet<ValorDiarium> ValorDiaria { get; set; }

    public virtual DbSet<Veiculo> Veiculos { get; set; }

    public virtual DbSet<VeiculoVendido> VeiculoVendidos { get; set; }

    public virtual DbSet<Vendum> Venda { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\;Database=Concesionaria;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(e => e.IdCliente).HasName("PK__Cliente__3DD0A8CB23305B8C");

            entity.ToTable("Cliente");

            entity.Property(e => e.IdCliente).HasColumnName("Id_Cliente");
            entity.Property(e => e.Cpf)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("CPF");
            entity.Property(e => e.Endereco)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Rg)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("RG");
            entity.Property(e => e.Sobrenome)
                .HasMaxLength(80)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Locacao>(entity =>
        {
            entity.HasKey(e => e.IdLocacao).HasName("PK__Locacao__9892FEF6706688FD");

            entity.ToTable("Locacao");

            entity.Property(e => e.IdLocacao).HasColumnName("Id_Locacao");
            entity.Property(e => e.DataLocacao).HasColumnName("Data_Locacao");
            entity.Property(e => e.FkClienteIdCliente).HasColumnName("fk_Cliente_Id_Cliente");
            entity.Property(e => e.FkVeiculoIdVeiculo).HasColumnName("fk_Veiculo_Id_Veiculo");

            entity.HasOne(d => d.FkClienteIdClienteNavigation).WithMany(p => p.Locacaos)
                .HasForeignKey(d => d.FkClienteIdCliente)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Locacao_2");

            entity.HasOne(d => d.FkVeiculoIdVeiculoNavigation).WithMany(p => p.Locacaos)
                .HasForeignKey(d => d.FkVeiculoIdVeiculo)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Locacao_3");
        });

        modelBuilder.Entity<ValorDiarium>(entity =>
        {
            entity.HasKey(e => e.IdVal).HasName("PK__Valor_Di__5263D05E89AC6B42");

            entity.ToTable("Valor_Diaria");

            entity.Property(e => e.IdVal).HasColumnName("Id_Val");
            entity.Property(e => e.Categoria)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Tipo)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Veiculo>(entity =>
        {
            entity.HasKey(e => e.IdVeiculo).HasName("PK__Veiculo__50F77C6C3EA27085");

            entity.ToTable("Veiculo");

            entity.Property(e => e.IdVeiculo).HasColumnName("Id_Veiculo");
            entity.Property(e => e.Estado)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.FkValorDiariaIdVal).HasColumnName("fk_Valor_Diaria_Id_Val");
            entity.Property(e => e.Marca)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Modelo)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Placa)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ValorDeCompra).HasColumnName("Valor_de_Compra");

            entity.HasOne(d => d.FkValorDiariaIdValNavigation).WithMany(p => p.Veiculos)
                .HasForeignKey(d => d.FkValorDiariaIdVal)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Veiculo_3");
        });

        modelBuilder.Entity<VeiculoVendido>(entity =>
        {
            entity.HasKey(e => e.IdVeiculo).HasName("PK__Veiculo___50F77C6C07BC2AFC");

            entity.ToTable("Veiculo_Vendido");

            entity.Property(e => e.IdVeiculo).HasColumnName("Id_Veiculo");
            entity.Property(e => e.Estado)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.IdVend).HasColumnName("Id_Vend");
            entity.Property(e => e.Modelo)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Placa)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ValorDeVenda).HasColumnName("Valor_de_Venda");
        });

        modelBuilder.Entity<Vendum>(entity =>
        {
            entity.HasKey(e => e.IdVenda).HasName("PK__Venda__B3C86881AB8DD2CB");

            entity.Property(e => e.IdVenda).HasColumnName("Id_Venda");
            entity.Property(e => e.DataVenda).HasColumnName("Data_Venda");
            entity.Property(e => e.FkClienteIdCliente).HasColumnName("fk_Cliente_Id_Cliente");
            entity.Property(e => e.FkVeiculoVendidoIdVeiculo).HasColumnName("fk_Veiculo_Vendido_Id_Veiculo");

            entity.HasOne(d => d.FkClienteIdClienteNavigation).WithMany(p => p.Venda)
                .HasForeignKey(d => d.FkClienteIdCliente)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Venda_2");

            entity.HasOne(d => d.FkVeiculoVendidoIdVeiculoNavigation).WithMany(p => p.Venda)
                .HasForeignKey(d => d.FkVeiculoVendidoIdVeiculo)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Venda_3");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
