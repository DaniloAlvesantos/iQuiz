import Foundation

struct Questao {
    var titulo: String
    var respostas: [String]
    var correta: Int // indice da resposta correta no array
}

let questoes: [Questao] = [
    Questao(titulo: "Qual feitiço para desarmar o seu oponente, em Harry Poter?", respostas: ["Expecto Patronum", "Avada Kadavra", "Expelliarmus"], correta: 2),
    Questao(titulo: "Quando foi lançado o filme Vingadores Ultimato?", respostas: ["2019", "2018", "2017"], correta: 0),
    Questao(titulo: "Quando foi lançado o filme Avatar 2?", respostas: ["2014", "2022", "2023"], correta: 1),
]
