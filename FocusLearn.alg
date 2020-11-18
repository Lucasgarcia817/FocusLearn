algoritmo "Focus Learn"

var
   disciplinas, dis, nome, sobrenome, email, senha, confirmeSenha, cpf, letrastest, let, letcpf, emailve, senhave: literal
   f, selecao_mat, contlet, contletd, exib, coluna, escolhalogin, escolhastart, escolhaexib: inteiro
   matInfCad: vetor [1..10, 1..5] de literal
   validacao_login, contsNome, letrasasc, validaNome, validasNome, contNome, letraasc: inteiro
   letnome, letsnome: caracter
   linha: inteiro
procedimento Start
inicio
      limpatela
      escreval("              ______                     _                           ")
      escreval("             |  ____|                   | |                          ")
      escreval("             | |__ ___   ___ _   _ ___  | |     ___  __ _ _ __ _ __  ")
      escreval("             |  __/ _ \ / __| | | / __| | |    / _ \/ _` | '__| '_ \ ")
      escreval("             | | | (_) | (__| |_| \__ \ | |___|  __/ (_| | |  | | | |")
      escreval("             |_|  \___/ \___|\__,_|___/ |______\___|\__,_|_|  |_| |_|")
      escreval
      escreval("                    ESCOLHA: 1: Login; 2: Cadastro; 3: Sair.")
      leia(escolhastart)
      repita
            se ((escolhastart < 1) ou (escolhastart > 3)) entao
                escreval("                             DIGITE UM NÚMERO VÁLIDO!")
                escreval("                    ESCOLHA: 1: Login; 2: Cadastro; 3: Sair.")
                leia(escolhastart)
            fimse
      ate ((escolhastart >= 1) e (escolhastart <= 3))
      escolha escolhastart
              caso 1
                   Login
              caso 2
                   Cadastro
              caso 3
      fimescolha
fimprocedimento

procedimento Login
inicio
      limpatela
      escreval("                            _                 _       ")
      escreval("                           | |               (_)      ")
      escreval("                           | |     ___   __ _ _ _ __  ")
      escreval("                           | |    / _ \ / _` | | '_ \ ")
      escreval("                           | |___| (_) | (_| | | | | |")
      escreval("                           |______\___/ \__, |_|_| |_|")
      escreval("                                         __/ |        ")
      escreval("                                        |___/         ")
      escreval
      repita
         escreva("                          Email: ")
         leia(emailve)
         escreva("                          Senha: ")
         leia(senhave)
         se((emailve = matInfCad[1,4]) e (senhave = matInfCad[1,5])) entao
               escreval("                         LOGIN ACEITO!")
               Selecao_Materia
         fimse
         validacao_login <- 1
      ate (validacao_login = 1)
fimprocedimento

procedimento Cadastro
inicio
      limpatela
      escreval("                       _____          _           _             ")
      escreval("                      / ____|        | |         | |            ")
      escreval("                     | |     __ _  __| | __ _ ___| |_ _ __ ___  ")
      escreval("                     | |    / _` |/ _` |/ _` / __| __| '__/ _ \ ")
      escreval("                     | |___| (_| | (_| | (_| \__ \ |_| | | (_) |")
      escreval("                      \_____\__,_|\__,_|\__,_|___/\__|_|  \___/ ")
      escreval
      letrastest<- "abcdefghijklmnopqrstuvwxyz"
      escreval()
      escreva("                                  Nome:")
      leia(nome)
      para contNome de 1 ate compr(nome) faca
           letnome <- minusc(copia(nome,contNome,1))
           letraasc <- asc(letnome)
           se (letraasc = 32) ou ((letraasc > 96) e (letraasc < 123)) entao
              validaNome <- validaNome + 1
           fimse
      fimpara
      se (validaNome <> compr(nome)) entao
              validaNome <- 0
              validasNome <- 0
              Cadastro
      fimse
      escreva("                                  Sobrenome:")
      leia(sobrenome)
      para contsNome de 1 ate compr(sobrenome) faca
           letsnome <- minusc(copia(sobrenome,contsNome,1))
           letrasasc <- asc(letsnome)
           se (letrasasc = 32) ou ((letrasasc > 96) e (letrasasc < 123)) entao
              validasNome <- validasNome + 1
           fimse
      fimpara
      se (validasNome <> compr(sobrenome)) entao
              validaNome <- 0
              validasNome <- 0
              Cadastro
      fimse
      repita
            escreva("                                  CPF (somente números):")
            leia(cpf)
            se compr(cpf) <> 11 entao
               escreval("                              CPF inválido. Digite novamente.")
            fimse
            para contlet de 1 ate 26 faca
                 letcpf <- minusc(copia(cpf,contlet,1))
                 para contletd de 1 ate compr(cpf) faca
                      let <- minusc(copia(letrastest, contlet, 1))
                      se (letcpf=let) entao
                         escreva("SOMENTE NÚMEROS!")
                         Cadastro
                      fimse
                 fimpara
            fimpara
      ate (compr(cpf) = 11)
      escreva("                                  Email:")
      leia(email)
      escreva("                                  Senha:")
      leia(senha)
      repita
            escreva("                                  Confirma senha:")
            leia(confirmeSenha)
      ate (senha = confirmeSenha)
      linha <- linha + 1
      coluna <- 1
      para coluna de 1 ate 5 faca
           escolha coluna
           caso 1
                matInfCad[linha,coluna] <- nome
           caso 2
                matInfCad[linha,coluna] <- sobrenome
           caso 3
                matInfCad[linha,coluna] <- cpf
           caso 4
                matInfCad[linha,coluna] <- email
           caso 5
                matInfCad[linha,coluna] <- senha
           fimescolha
      fimpara
      Login
fimprocedimento

procedimento Selecao_Materia
arquivo "Disciplinas.txt"
inicio
      limpatela
      escreval("                    _____  _          _       _ _                 ")
      escreval("                   |  __ \(_)        (_)     | (_)                ")
      escreval("                   | |  | |_ ___  ___ _ _ __ | |_ _ __   __ _ ___ ")
      escreval("                   | |  | | / __|/ __| | '_ \| | | '_ \ / _` / __|")
      escreval("                   | |__| | \__ \ (__| | |_) | | | | | | (_| \__ \")
      escreval("                   |_____/|_|___/\___|_| .__/|_|_|_| |_|\__,_|___/")
      escreval("                                       | |                        ")
      escreval("                                       |_|                        ")
      escreval
      para f de 1 ate 12 faca
           escreva ("                               ",f, " - ")
           leia(disciplinas)
      fimpara
      escreval
      escreval
      escreva("Digite o número corresponde a matéria desejada: ")
      leia (selecao_mat)
      repita
            se ((selecao_mat < 1) ou (selecao_mat > 12)) entao
               escreval("                             DIGITE UM NÚMERO VÁLIDO!")
               escreva("Digite o número corresponde a matéria desejada: ")
               leia(selecao_mat)
            fimse
      ate ((selecao_mat >= 1) e (selecao_mat <= 12))
      escolha selecao_mat
         caso 1
              Exibir_Materia("Física")
         caso 2
              Exibir_Materia("Química")
         caso 3
              Exibir_Materia("Matemática")
         caso 4
              Exibir_Materia("Biologia")
         caso 5
              Exibir_Materia("Literatura")
         caso 6
              Exibir_Materia("História")
         caso 7
              Exibir_Materia("Filosofia")
         caso 8
              Exibir_Materia("Arte")
         caso 9
              Exibir_Materia("Geografia")
         caso 10
              Exibir_Materia("Sociologia")
         caso 11
              Exibir_Materia("Inglês")
         caso 12
              Exibir_Materia("Português")
      fimescolha
fimprocedimento

procedimento Exibir_Materia(dis:literal)
inicio
      limpatela
      escreval("                        Disciplina selecionada: ", dis)
      escreval
      escreval("    Esta tela é ilustrativa e tem o objetivo de mostrar conexão com as telas ")
      escreval("    de ver aulas, ver atividades, avaliar disciplina e professores e fóruns...")
      escreval
      escreval
      escreval("                         A) Buscar atividades:")
      escreval("                         B) Buscar aulas:")
      escreval("                         C) Buscar professores:")
      escreval("                         D) Fórum:")
      escreval("                         E) Avaliar disciplina:")
      escreval
      escreva("Voltar: 1; Menu Inicial: 2;")
      leia(escolhaexib)
      repita
            se ((escolhaexib < 1) ou (escolhaexib > 2)) entao
               escreval("                             DIGITE UM NÚMERO VÁLIDO!")
               escreva("Digite o número corresponde 1: Voltar; 2: Menu Inicial;")
               leia(escolhaexib)
            fimse
      ate ((escolhaexib >= 1) e (escolhaexib <= 2))
      escolha escolhaexib
             caso 1
                  Selecao_Materia
             caso 2
                  escreval
      fimescolha
fimprocedimento

inicio
repita
      Start
ate escolhastart = 3
fimalgoritmo
