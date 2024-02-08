       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLPAG01.

      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT VEICULOS ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\VEICULOS.txt'
       ORGANIZATION IS LINE SEQUENTIAL
       FILE STATUS AS-STATUS-V.

       SELECT CLIENTES ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\CLIENTES.txt'
       ORGANIZATION IS LINE SEQUENTIAL
       FILE STATUS AS-STATUS-C.

       SELECT ALUGUEL ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\ALUGUEL.txt'
       ORGANIZATION IS LINE SEQUENTIAL
       FILE STATUS AS-STATUS-A.


       SELECT IDS ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\IDS.txt'
       ORGANIZATION IS LINE SEQUENTIAL
       FILE STATUS AS-STATUS-I.

      ******************************************************************
       DATA DIVISION.
       FILE SECTION.

       FD VEICULOS
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01 ARQ-VEICULOS                    PIC X(230).
       01 FILLER REDEFINES ARQ-VEICULOS.
           05 ARQ-VEICULOS-ID              PIC X(04).
           05 ARQ-VEICULOS-MODELO          PIC X(20).
           05 ARQ-VEICULOS-MARCA           PIC X(100).
           05 ARQ-VEICULOS-ANO             PIC X(04).
           05 ARQ-VEICULOS-PLACA           PIC X(20).
           05 ARQ-VEICULOS-CATEGORIA       PIC X(20).
           05 ARQ-VEICULOS-TIPO            PIC X(20).
           05 ARQ-VEICULOS-ESTADO          PIC X(20).
           05 ARQ-VEICULOS-VALOR-COMPRA    PIC X(15).
           05 ARQ-VEICULOS-VALOR-DIARIA    PIC X(05).
           05 ARQ-VEICULOS-FIM             PIC X(002).




       FD CLIENTES
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01 ARQ-CLIENTES                     PIC X(338).
       01 FILLER REDEFINES ARQ-CLIENTES.
           05 ARQ-CLIENTES-ID              PIC X(04).
           05 ARQ-CLIENTES-NOME            PIC X(20).
           05 ARQ-CLIENTES-SOBRENOME       PIC X(80).
           05 ARQ-CLIENTES-RG              PIC X(12).
           05 ARQ-CLIENTES-CPF             PIC X(20).
           05 ARQ-CLIENTES-ENDERECO        PIC X(200).
           05 ARQ-CLIENTES-FIM             PIC X(002).


       FD ALUGUEL
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01 ARQ-ALUGUEL                      PIC X(32).
       01 FILLER REDEFINES ARQ-ALUGUEL.
           05 ARQ-ALUGUEL-DIAS             PIC 9(03).
           05 ARQ-ALUGUEL-VALOR            PIC 9(05),99.
           05 ARQ-ALUGUEL-DATA             PIC X(12).
           05 ARQ-ALUGUEL-CLIENTE          PIC 9(04).
           05 ARQ-ALUGUEL-VEICULO          PIC 9(04).
           05 ARQ-CLIENTES-FIM             PIC X(002).

       FD IDS
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01 ARQ-IDS                          PIC X(32).
       01 FILLER REDEFINES ARQ-IDS.
           05 ARQ-IDS-CLIENTE              PIC 9(08).
           05 ARQ-IDS-VEICULOS             PIC 9(08).
           05 ARQ-IDS-DIAS                 PIC 9(08).


      ******************************************************************
       WORKING-STORAGE SECTION.

       01 AS-STATUS-V                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-C                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-A                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-O                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-I                      PIC 9(02) VALUE ZEROS.


       01 LOOP-INICILAIZAR                 PIC 9(01) VALUE ZEROS.
       01 LOOP-CLIENTE                     PIC 9(01) VALUE ZEROS.
       01 LOOP-VEICULO                     PIC 9(01) VALUE ZEROS.
       01 LOOP-LOCACAO                     PIC 9(01) VALUE ZEROS.
       01 LOOP-LISTA                       PIC 9(01) VALUE ZEROS.


       01 RESPOSTA-INICIALIZAR             PIC 9(01) VALUE ZEROS.
       01 RESPOSTA-GENERICA                PIC X(200) VALUE SPACES.

       01 ADDCLIENTE.
           10 ADDCLIENTE-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 ADDCLIENTE-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 ADDCLIENTE-03                   PIC X(20) VALUE
           ' ADDCLIENTE'.
           10 ADDCLIENTE-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\CLIENTES.txt"'.

       01 LISTACLIENTE.
           10 LISTACLIENTE-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 LISTACLIENTE-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 LISTACLIENTE-03                   PIC X(20) VALUE
           ' "LISTACLIENTE"'.
           10 LISTACLIENTE-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\CLIENTES.txt"'.

       01 LISTAVEICULO.
           10 LISTAVEICULO-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 LISTAVEICULO-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 LISTAVEICULO-03                   PIC X(20) VALUE
           ' "LISTAVEICULO"'.
           10 LISTAVEICULO-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\VEICULOS.txt"'.

       01 ADDVEICULO.
           10 ADDVEICULO-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 ADDVEICULO-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 ADDVEICULO-03                   PIC X(20) VALUE
           ' "ADDVEICULO"'.
           10 ADDVEICULO-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\VEICULOS.txt"'.

       01 VENDERVEICULO.
           10 VENDERVEICULO-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 VENDERVEICULO-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 VENDERVEICULO-03                   PIC X(20) VALUE
           ' "VENDERVEICULO"'.
           10 VENDERVEICULO-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\IDS.txt"'.

       01 ALUGARVEICULO.
           10 ALUGARVEICULO-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 ALUGARVEICULO-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 DEVOLVERVEICULO-03                   PIC X(20) VALUE
           ' "DEVOLVERVEICULO"'.
           10 DEVOLVERVEICULO-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\IDS.txt"'.

       01 DEVOLVERVEICULO.
           10 DEVOLVERVEICULO-01                   PIC X(51) VALUE
           'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\PROJC\bin\'.
           10 DEVOLVERVEICULO-02                   PIC X(100) VALUE
           'Release\net8.0\win-x64\publish\PROJC.exe'.
           10 DEVOLVERVEICULO-03                   PIC X(20) VALUE
           ' "DEVOLVERVEICULO"'.
           10 ALUGARVEICULO-04                   PIC X(100) VALUE
           ' "D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\IDS.txt"'.

      ******************************************************************

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM 1000-INICIALIZAR UNTIL LOOP-INICILAIZAR = 1.
           PERFORM 3000-FINALIZAR.

      ***********************************************************************************
      *    MENUS
      ***********************************************************************************

       1000-INICIALIZAR                    SECTION.

           MOVE 0 TO LOOP-CLIENTE
                     LOOP-VEICULO
                     LOOP-LOCACAO


           DISPLAY '1 - Clientes'
           DISPLAY '2 - Veiculos'
           DISPLAY '3 - Locacao'
           DISPLAY '4 - Sair'
           ACCEPT RESPOSTA-INICIALIZAR

           EVALUATE RESPOSTA-INICIALIZAR

           WHEN 1
               PERFORM 1010-INICIALIZAR-CLIENTE
               UNTIL LOOP-CLIENTE = 1
           WHEN 2
               PERFORM 1020-INICIALIZAR-VEICULO
               UNTIL LOOP-VEICULO = 1
           WHEN 3
               PERFORM 1030-INICIALIZAR-LOCACAO
               UNTIL LOOP-LOCACAO = 1
           WHEN 4
               MOVE 1 TO LOOP-INICILAIZAR

           END-EVALUATE
       .

       1000-INICIALIZAR-FIM.
           EXIT.


       1010-INICIALIZAR-CLIENTE            SECTION.

           DISPLAY '1 - Adicionar Cliente'
           DISPLAY '2 - Mostar Clientes'
           DISPLAY '3 - '
           DISPLAY '4 - Sair'
           ACCEPT RESPOSTA-INICIALIZAR

           EVALUATE RESPOSTA-INICIALIZAR

           WHEN 1
               PERFORM 2011-ADICIONAR-CLIENTE
           WHEN 2
               PERFORM 2012-LISTAR-CLIENTE
           WHEN 4
               MOVE 1 TO LOOP-CLIENTE

           END-EVALUATE
           .
       1010-INICIALIZAR-CLIENTE-FIM.
           EXIT.

       1020-INICIALIZAR-VEICULO            SECTION.
           DISPLAY '1 - Adicionar Veiculo'
           DISPLAY '2 - Vender Veiculo'
           DISPLAY '3 - '
           DISPLAY '4 - Sair'
           ACCEPT RESPOSTA-INICIALIZAR

           EVALUATE RESPOSTA-INICIALIZAR
           WHEN 1
               PERFORM 2021-ADICIONAR-VEICULO
           WHEN 2
               PERFORM 2022-VENDER-VEICULO
           WHEN 3
               OPEN INPUT VEICULOS
               DISPLAY AS-STATUS-V
               READ VEICULOS
               DISPLAY AS-STATUS-V
               DISPLAY ARQ-VEICULOS
           WHEN 4
               MOVE 1 TO LOOP-VEICULO
           .
       1020-INICIALIZAR_VEICULO-FIM.
           EXIT.

       1030-INICIALIZAR-LOCACAO           SECTION.

           DISPLAY '1 - Alugar Carro'
           DISPLAY '2 - Devolver Carro'
           DISPLAY '3 - '
           DISPLAY '4 - SAIR'
           ACCEPT RESPOSTA-INICIALIZAR

           EVALUATE RESPOSTA-INICIALIZAR
           WHEN 1
               PERFORM 2031-ALUGAR-VEICULO
           WHEN 2
               PERFORM 2032-DEVOLVER-VEICULO
           WHEN 4
               MOVE 1 TO LOOP-LOCACAO
           .
       1030-INICIALIZAR_LOCACAO-FIM.
           EXIT.


      ***********************************************************************************
      *    FUNCOES
      ***********************************************************************************

       2011-ADICIONAR-CLIENTE              SECTION.
           OPEN OUTPUT CLIENTES
           DISPLAY AS-STATUS-C
           IF AS-STATUS-C NOT EQUAL ZEROS
               DISPLAY 'ERRO AO ABRIR ARQUIVO'

               ELSE
                   MOVE 00 TO ARQ-CLIENTES-ID
                   DISPLAY 'Digite o Nome:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-CLIENTES-NOME
                   DISPLAY 'Digite o Sobrenome:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-CLIENTES-SOBRENOME
                   DISPLAY 'Digite o Endereco:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-CLIENTES-ENDERECO
                   DISPLAY 'Digite o RG:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-CLIENTES-RG
                   DISPLAY 'Digite o CPF:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-CLIENTES-CPF

                   WRITE ARQ-CLIENTES
                   CLOSE CLIENTES

                   CALL 'SYSTEM' USING ADDCLIENTE




           END-IF

           .
       2011-ADICIONAR-CLIENTE-FIM.
           EXIT.

       2012-LISTAR-CLIENTE                 SECTION.
           CALL 'SYSTEM' USING LISTACLIENTE
           OPEN INPUT CLIENTES
           MOVE 0 TO LOOP-LISTA

           PERFORM until LOOP-LISTA = 1

               READ CLIENTES
               IF AS-STATUS-C NOT EQUAL ZEROS
                   DISPLAY 'FIM DA LISTA'
                   MOVE 1 TO LOOP-LISTA
               ELSE
                   DISPLAY ARQ-CLIENTES-ID '                           '
                   DISPLAY ARQ-CLIENTES-NOME '                         '
                   DISPLAY ARQ-CLIENTES-SOBRENOME
                   DISPLAY ARQ-CLIENTES-ENDERECO
                   DISPLAY ARQ-CLIENTES-RG '                           '
                   DISPLAY ARQ-CLIENTES-CPF '                    '
               END-IF
           END-PERFORM

           .
       2012-LISTAR-CLIENTE-FIM.
           EXIT.

       2021-ADICIONAR-VEICULO              SECTION.

           OPEN OUTPUT VEICULOS
           IF AS-STATUS-V NOT EQUAL ZEROS
               DISPLAY 'ERRO AO ABRIR ARQUIVO'

               ELSE
                   MOVE ZEROS TO ARQ-VEICULOS-ID
                   DISPLAY 'Digite o MODELO:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-MODELO
                   DISPLAY 'Digite a MARCA:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-MARCA
                   DISPLAY 'Digite o ANO:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-ANO
                   DISPLAY 'Digite a PLACA:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-PLACA
                   DISPLAY 'Digite a CATEGORIA:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-CATEGORIA
                   DISPLAY 'Digite o TIPO:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-TIPO
                   DISPLAY 'Digite o VALOR DE COMPRA:'
                   ACCEPT RESPOSTA-GENERICA
                   MOVE RESPOSTA-GENERICA TO ARQ-VEICULOS-VALOR-COMPRA
                   MOVE SPACES TO ARQ-VEICULOS-ESTADO
                   MOVE ZEROS TO ARQ-VEICULOS-VALOR-DIARIA
                   MOVE SPACES TO ARQ-VEICULOS-FIM



                   WRITE ARQ-VEICULOS
                   CLOSE VEICULOS

                   CALL 'SYSTEM' USING ADDVEICULO




           END-IF

           .
       2021-ADICIONAR-VEICULO-FIM.
           EXIT.

       2022-VENDER-VEICULO                SECTION.
           MOVE 0 TO LOOP-LISTA
           CALL 'SYSTEM' USING LISTACLIENTE
           OPEN INPUT CLIENTES
           PERFORM UNTIL LOOP-LISTA = 1
               READ CLIENTES
               IF AS-STATUS-C NOT EQUAL ZEROS
                   MOVE 1 TO LOOP-LISTA
               ELSE
                   DISPLAY ARQ-CLIENTES
               END-IF
           END-PERFORM
           CLOSE CLIENTES
           DISPLAY 'SELECIONE O ID DE UM CLIENTE'
           ACCEPT ARQ-IDS-CLIENTE

           MOVE 0 TO LOOP-LISTA
           CALL 'SYSTEM' USING LISTAVEICULO
           OPEN INPUT VEICULOS
           PERFORM UNTIL LOOP-LISTA = 1
               READ VEICULOS
               IF AS-STATUS-V NOT EQUAL ZEROS
                   MOVE 1 TO LOOP-LISTA
               ELSE

                   DISPLAY ARQ-VEICULOS
               END-IF
           END-PERFORM
           CLOSE VEICULOS
           DISPLAY 'SELECIONE O ID DE UM VEICULO'
           ACCEPT ARQ-IDS-VEICULOS

           OPEN OUTPUT IDS
           WRITE ARQ-IDS
           CLOSE IDS

           CALL 'SYSTEM' USING VENDERVEICULO

           .
       2022-VENDER-VEICULO-FIM.
           EXIT.

       2031-ALUGAR-VEICULO                 SECTION.

           MOVE 0 TO LOOP-LISTA
           CALL 'SYSTEM' USING LISTACLIENTE
           OPEN INPUT CLIENTES
           PERFORM UNTIL LOOP-LISTA = 1
               READ CLIENTES
               IF AS-STATUS-C NOT EQUAL ZEROS
                   MOVE 1 TO LOOP-LISTA
               ELSE
                   DISPLAY ARQ-CLIENTES
               END-IF
           END-PERFORM

           CLOSE CLIENTES
           DISPLAY 'SELECIONE O ID DE UM CLIENTE'
           ACCEPT ARQ-IDS-CLIENTE

           MOVE 0 TO LOOP-LISTA
           CALL 'SYSTEM' USING LISTAVEICULO
           OPEN INPUT VEICULOS
           PERFORM UNTIL LOOP-LISTA = 1
               READ VEICULOS
               IF AS-STATUS-V NOT EQUAL ZEROS
                   MOVE 1 TO LOOP-LISTA
               ELSE
                   DISPLAY ARQ-VEICULOS-ID
                   DISPLAY ARQ-VEICULOS-MODELO
                   DISPLAY ARQ-VEICULOS-MARCA
                   DISPLAY ARQ-VEICULOS-ANO
                   DISPLAY ARQ-VEICULOS-PLACA
                   DISPLAY ARQ-VEICULOS-ESTADO
                   DISPLAY ARQ-VEICULOS-VALOR-COMPRA
                   DISPLAY ARQ-VEICULOS-VALOR-DIARIA

               END-IF
           END-PERFORM
           CLOSE VEICULOS
           DISPLAY 'SELECIONE O ID DE UM VEICULO'
           ACCEPT ARQ-IDS-VEICULOS

           DISPLAY 'SELECIONE A QUANTIDADE DE DIAS'
           ACCEPT ARQ-IDS-DIAS

           OPEN OUTPUT IDS
           WRITE ARQ-IDS
           CLOSE IDS

           CALL 'SYSTEM' USING ALUGARVEICULO
           .
       2031-ALUGAR-VEICULO-FIM.
           EXIT.

       2032-DEVOLVER-VEICULO               SECTION.

           MOVE 0 TO LOOP-LISTA
           CALL 'SYSTEM' USING LISTAVEICULO
           OPEN INPUT VEICULOS
           PERFORM UNTIL LOOP-LISTA = 1
               READ VEICULOS
               IF AS-STATUS-V NOT EQUAL ZEROS
                   MOVE 1 TO LOOP-LISTA
               ELSE
                   IF ARQ-VEICULOS-ESTADO EQUAL 'Ocupado'
                   DISPLAY ARQ-VEICULOS-ID
                   DISPLAY ARQ-VEICULOS-MODELO
                   DISPLAY ARQ-VEICULOS-MARCA
                   DISPLAY ARQ-VEICULOS-ANO
                   DISPLAY ARQ-VEICULOS-PLACA
                   DISPLAY ARQ-VEICULOS-ESTADO
                   DISPLAY ARQ-VEICULOS-VALOR-COMPRA
                   DISPLAY ARQ-VEICULOS-VALOR-DIARIA
               END-IF
               END-IF
           END-PERFORM
           CLOSE VEICULOS

           DISPLAY 'SELECIONE O ID DE UM VEICULO'
           ACCEPT ARQ-IDS-VEICULOS

           OPEN OUTPUT IDS
           WRITE ARQ-IDS
           CLOSE IDS

           CALL 'SYSTEM' USING DEVOLVERVEICULO

           .
       2032-DEVOLVER-VEICULO-FIM.
           EXIT.



       3000-FINALIZAR                      SECTION.

           CLOSE CLIENTES
           IF AS-STATUS-C NOT EQUAL ZEROS
               DISPLAY 'ERRO NO FECHAMENTO ' AS-STATUS-C
           END-IF

           CLOSE VEICULOS
           IF AS-STATUS-V NOT EQUAL ZEROS
               DISPLAY 'ERRO NO FECHAMENTO ' AS-STATUS-V
           END-IF

           CLOSE ALUGUEL
           IF AS-STATUS-A NOT EQUAL ZEROS
               DISPLAY 'ERRO NO FECHAMENTO ' AS-STATUS-A
           END-IF

           STOP RUN
       .
       3000-FINALIZAR-FIM.
           EXIT.

       END PROGRAM CBLPAG01.
