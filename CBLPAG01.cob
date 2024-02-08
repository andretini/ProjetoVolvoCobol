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
       FILE STATUS AS-STATUS-V.

       SELECT CLIENTES ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\CLIENTES.txt'
       FILE STATUS AS-STATUS-C.

       SELECT ALUGUEL ASSIGN TO
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\ALUGUEL.txt'
       FILE STATUS AS-STATUS-A.

      ******************************************************************
       DATA DIVISION.
       FILE SECTION.

       FD VEICULOS
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01 ARQ-VEICULOS                     PIC X(227).
       01 FILLER REDEFINES ARQ-VEICULOS.
           05 ARQ-VEICULOS-ID              PIC 9(04).
           05 ARQ-VEICULOS-MODELO          PIC X(20).
           05 ARQ-VEICULOS-MARCA           PIC X(100).
           05 ARQ-VEICULOS-ANO             PIC 9(04).
           05 ARQ-VEICULOS-PLACA           PIC X(20).
           05 ARQ-VEICULOS-CATEGORIA       PIC X(20).
           05 ARQ-VEICULOS-TIPO            PIC X(20).
           05 ARQ-VEICULOS-ESTADO          PIC X(20).
           05 ARQ-VEICULOS-VALOR-COMPRA    PIC 9(10),99.
           05 ARQ-VEICULOS-VALOR-DIARIA    PIC 9(03),99.
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



      ******************************************************************
       WORKING-STORAGE SECTION.

       01 AS-STATUS-V                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-C                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-A                      PIC 9(02) VALUE ZEROS.
       01 AS-STATUS-O                      PIC 9(02) VALUE ZEROS.


       01 LOOP-INICILAIZAR                 PIC 9(01) VALUE ZEROS.
       01 LOOP-CLIENTE                     PIC 9(01) VALUE ZEROS.
       01 LOOP-VEICULO                     PIC 9(01) VALUE ZEROS.
       01 LOOP-LOCACAO                     PIC 9(01) VALUE ZEROS.


       01 RESPOSTA-INICIALIZAR             PIC 9(01) VALUES ZEROS.
       01 RESPOSTA-GENERICA                PIC X(200) VALUE SPACES.


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


           WHEN 4
               MOVE 1 TO LOOP-LOCACAO
           .
       1030-INICIALIZAR_LOCACAO-FIM.
           EXIT.


      ***********************************************************************************
      *    FUNCOES
      ***********************************************************************************
       2000-PROCESSAR                      SECTION.


       .
       2000-PROCESSAR-FIM.
           EXIT.

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

                   CALL 'SYSTEM' USING
       'D:\VS_CODE\Volvo_Cobol\Volvo_Final_Cobol\win-x64\PROJC.exe "D:'
       '\VS_CODE\Volvo_Cobol\CLIENTES.txt"'
       

           END-IF

           .
       2011-ADICIONAR-CLINETE-FIM.
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
