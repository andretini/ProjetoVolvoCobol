/* Lógico_1: */
use Concesionaria;

CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(20),
    Sobrenome VARCHAR(80),
    RG VARCHAR(12),
    CPF VARCHAR(20),
    Endereco VARCHAR(200)
);

CREATE TABLE Veiculo (
    Estado VARCHAR(20),
    Valor_de_Compra FLOAT,
    Ano INT,
    Modelo VARCHAR(20),
    Marca VARCHAR(100),
    Placa VARCHAR(20),
    Id_Veiculo INT PRIMARY KEY IDENTITY,
    fk_Valor_Diaria_Id_Val INT
);

CREATE TABLE Locacao (
    Id_Locacao INT PRIMARY KEY IDENTITY,
    Dias INT,
    Valor FLOAT,
    Data_Locacao DATE,
    fk_Cliente_Id_Cliente INT,
    fk_Veiculo_Id_Veiculo INT
);

CREATE TABLE Valor_Diaria (
    Id_Val INT PRIMARY KEY IDENTITY,
    Categoria VARCHAR(20),
    Tipo VARCHAR(20),
    Valor FLOAT
);

CREATE TABLE Venda (
    Id_Venda INT PRIMARY KEY IDENTITY,
    Data_Venda DATE,
    fk_Cliente_Id_Cliente INT,
    fk_Veiculo_Vendido_Id_Veiculo INT
);

CREATE TABLE Veiculo_Vendido (
    Id_Veiculo INT PRIMARY KEY IDENTITY,
    Id_Vend INT,
    Estado VARCHAR(20),
    Valor_de_Venda FLOAT,
    Placa VARCHAR(20),
    Ano INT,
    Modelo VARCHAR(20)
);
 

ALTER TABLE Veiculo ADD CONSTRAINT FK_Veiculo_3
    FOREIGN KEY (fk_Valor_Diaria_Id_Val)
    REFERENCES Valor_Diaria (Id_Val)
    ON DELETE SET NULL;
 
ALTER TABLE Locacao ADD CONSTRAINT FK_Locacao_2
    FOREIGN KEY (fk_Cliente_Id_Cliente)
    REFERENCES Cliente (Id_Cliente)
    ON DELETE SET NULL;
 
ALTER TABLE Locacao ADD CONSTRAINT FK_Locacao_3
    FOREIGN KEY (fk_Veiculo_Id_Veiculo)
    REFERENCES Veiculo (Id_Veiculo)
    ON DELETE SET NULL;
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_2
    FOREIGN KEY (fk_Cliente_Id_Cliente)
    REFERENCES Cliente (Id_Cliente)
    ON DELETE SET NULL;
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_3
    FOREIGN KEY (fk_Veiculo_Vendido_Id_Veiculo)
    REFERENCES Veiculo_Vendido (Id_Veiculo)
    ON DELETE SET NULL;

INSERT INTO Valor_Diaria(Categoria, Tipo, Valor)
	VALUES 
		('ENTRADA', 'MOTO', 150),
		('INTERMEDIARIO', 'MOTO', 300),
		('LUXO', 'MOTO', 450),
		('ENTRADA', 'AUTOMOVEL', 200),
		('INTERMEDIARIO', 'AUTOMOVEL', 400),
		('LUXO', 'AUTOMOVEL', 600),
		('ENTRADA', 'VAN', 300),
		('INTERMEDIARIO', 'VAN', 500),
		('LUXO', 'VAN', 700);
