    programa
{
    // =============================================
    // DECLARAÇÃO DE VARIÁVEIS GLOBAIS
    // =============================================
    const inteiro MAX_CURRICULOS = 50               // limite de cadastros
    inteiro totalCadastros = 0
    
    // Dados de cada pessoa (vetores paralelos)
    cadeia  nomes[MAX_CURRICULOS]
    inteiro idades[MAX_CURRICULOS]
    cadeia  objetivos[MAX_CURRICULOS]
    cadeia  habilidades[MAX_CURRICULOS][3]           // matriz 50 x 3
    cadeia  cursos[MAX_CURRICULOS][3]                // matriz 50 x 3
    
    // Variáveis auxiliares para cálculos
    cadeia temp           // usado para pausa
    inteiro i, j
    
    funcao inicio()
    {
        inteiro opcao
        
        faca
        {
            limpa()
            escreva("============================================\n")
            escreva("   SKILLUP – Sistema de Apoio Profissional    \n")
            escreva("============================================\n")
            escreva("1 – Preparação para Entrevista\n")
            escreva("2 – Índice de Empregabilidade\n")
            escreva("3 – Criador de Currículo (cadastrar)\n")
            escreva("4 – Listar Currículos Cadastrados\n")
            escreva("5 – Teste Vocacional\n")
            escreva("0 – Sair\n")
            escreva("--------------------------------------------\n")
            escreva("Escolha uma opção: ")
            leia(opcao)
            
            escolha(opcao)
            {
                caso 1: preparacaoEntrevista()      pare
                caso 2: indiceEmpregabilidade()     pare
                caso 3: cadastrarCurriculo()        pare
                caso 4: listarCurriculos()          pare
                caso 5: testeVocacional()           pare
                caso 0:
                    limpa()
                    escreva("Obrigado por usar o SKILLUP! Até a próxima!\n")
                    pare
                caso contrario:
                    limpa()
                    escreva("Opção inválida! Pressione ENTER para continuar...")
                    leia(temp)
                    pare
            }
        } enquanto (opcao != 0)
    }
    
    // =============================================
    // 1 – PREPARAÇÃO PARA ENTREVISTA
    // =============================================
    funcao preparacaoEntrevista()
    {
        limpa()
        escreva("=== Preparação para Entrevista ===\n\n")
        
        cadeia pontosFortes[3], pontosFracos[3], areaInteresse
        inteiro experiencia
        real prontidao
        
        para (i = 0; i < 3; i++)
        {
            escreva("Ponto forte ", i+1, ": ")
            leia(pontosFortes[i])
        }
        para (i = 0; i < 3; i++)
        {
            escreva("Ponto fraco ", i+1, ": ")
            leia(pontosFracos[i])
        }
        
        escreva("Área de interesse: ")
        leia(areaInteresse)
        
        escreva("Experiência atual (0 a 10): ")
        leia(experiencia)
        
        prontidao = experiencia * 10.0
        
        escreva("\n=== Relatório de Prontidão ===\n")
        escreva("Área de interesse: ", areaInteresse, "\n")
        escreva("Nível de prontidão: ", prontidao, " / 100\n")
        se (prontidao >= 70) escreva("Você está bem preparado!\n")
        senao se (prontidao >= 40) escreva("Continue se preparando!\n")
        senao escreva("Invista mais em experiência e estudos!\n")
        
        escreva("\nPressione ENTER para voltar...")
        leia(temp)
    }
    
    // =============================================
    // 2 – ÍNDICE DE EMPREGABILIDADE
    // =============================================
    funcao indiceEmpregabilidade()
    {
        limpa()
        escreva("=== Índice de Empregabilidade ===\n\n")
        
        inteiro horasEstudo, qtdCursos, qtdProjetos
        logico participaEventos
        real nota = 0.0
        
        escreva("Horas semanais de estudo: ")
        leia(horasEstudo)
        escreva("Quantidade de cursos concluídos: ")
        leia(qtdCursos)
        escreva("Quantidade de projetos pessoais: ")
        leia(qtdProjetos)
        escreva("Participa de eventos/voluntariado? (1=Sim, 0=Não): ")
        leia(i)
        participaEventos = (i == 1)
        
        nota = (horasEstudo * 2.0) + (qtdCursos * 10.0) + (qtdProjetos * 8.0)
        se (participaEventos) nota = nota + 15.0
        se (nota > 100.0) nota = 100.0
        
        escreva("\nNota final: ", nota, "\n")
        se (nota < 40)      escreva("Classificação: Baixa Empregabilidade\n")
        senao se (nota < 70) escreva("Classificação: Média Empregabilidade\n")
        senao                escreva("Classificação: Alta Empregabilidade – Parabéns!\n")
        
        escreva("\nPressione ENTER para voltar...")
        leia(temp)
    }
    
    // =============================================
    // 3 – CADASTRAR CURRÍCULO (usa matriz)
    // =============================================
    funcao cadastrarCurriculo()
    {
        limpa()
        escreva("=== Criador de Currículo ===\n\n")
        
        se (totalCadastros >= MAX_CURRICULOS)
        {
            escreva("Limite de cadastros atingido!\n")
        }
        senao
        {
            escreva("Nome completo: ")
            leia(nomes[totalCadastros])
            escreva("Idade: ")
            leia(idades[totalCadastros])
            escreva("Objetivo profissional: ")
            leia(objetivos[totalCadastros])
            
            escreva("\nInforme 3 habilidades:\n")
            para (i = 0; i < 3; i++)
            {
                escreva("Habilidade ", i+1, ": ")
                leia(habilidades[totalCadastros][i])
            }
            
            escreva("\nInforme 3 cursos realizados:\n")
            para (i = 0; i < 3; i++)
            {
                escreva("Curso ", i+1, ": ")
                leia(cursos[totalCadastros][i])
            }
            
            escreva("\nCurrículo cadastrado com sucesso! (", totalCadastros+1, ")\n")
            totalCadastros++
        }
        
        escreva("\nPressione ENTER para voltar...")
        leia(temp)
    }
    
    // =============================================
    // 4 – LISTAR CURRÍCULOS CADASTRADOS
    // =============================================
    funcao listarCurriculos()
    {
        limpa()
        escreva("=== Currículos Cadastrados ===\n\n")
        
        se (totalCadastros == 0)
        {
            escreva("Nenhum currículo cadastrado ainda.\n")
        }
        senao
        {
            para (i = 0; i < totalCadastros; i++)
            {
                escreva("------------------------------------------------\n")
                escreva("Currículo ", i+1, "\n")
                escreva("Nome: ", nomes[i], "\n")
                escreva("Idade: ", idades[i], "\n")
                escreva("Objetivo: ", objetivos[i], "\n")
                escreva("Habilidades:\n")
                para (j = 0; j < 3; j++) escreva("  - ", habilidades[i][j], "\n")
                escreva("Cursos:\n")
                para (j = 0; j < 3; j++) escreva("  - ", cursos[i][j], "\n")
                escreva("\n")
            }
        }
        escreva("Pressione ENTER para voltar...")
        leia(temp)
    }
    
    // =============================================
    // 5 – TESTE VOCACIONAL (usa matriz 4x5)
    // =============================================
    funcao testeVocacional()
    {
        limpa()
        escreva("=== Teste Vocacional ===\n")
        escreva("Responda de 1 a 5 (1 = baixa afinidade, 5 = alta afinidade)\n\n")
        
        inteiro respostas[4][5]   // 4 áreas x 5 perguntas
        inteiro soma[4] = {0,0,0,0}
        cadeia areas[4] = {"Tecnologia da Informação (TI)", 
                           "Administração", 
                           "Comunicação", 
                           "Indústria"}
        
        // Entrada das respostas
        para (i = 0; i < 4; i++)
        {
            escreva(">>> Área: ", areas[i], "\n")
            para (j = 0; j < 5; j++)
            {
                escreva("  Pergunta ", j+1, " (afinidade): ")
                leia(respostas[i][j])
                soma[i] = soma[i] + respostas[i][j]
            }
            escreva("\n")
        }
        
        // Encontra a área com maior pontuação
        inteiro maior = soma[0]
        inteiro indiceMaior = 0
        para (i = 1; i < 4; i++)
        {
            se (soma[i] > maior)
            {
                maior = soma[i]
                indiceMaior = i
            }
        }
        
        escreva("=== Resultado ===\n")
        escreva("Área mais indicada: ", areas[indiceMaior], "\n")
        escreva("Pontuação: ", maior, " / 100\n")
        escreva("Explore cursos e oportunidades nessa área!\n")
        
        escreva("\nPressione ENTER para voltar...")
        leia(temp)
    }
}
