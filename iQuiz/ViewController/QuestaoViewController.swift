//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Danilo Alves dos Santos on 26/02/26.
//

import UIKit

class QuestaoViewController: UIViewController {
    var pontuacao: Int = 0
    var numeroQuestao: Int = 0
    
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBOutlet var botoesResposta: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta = questoes[numeroQuestao].correta == sender.tag
        
        UIView.animate(withDuration: 0.5, animations: {
            if usuarioAcertouResposta {
                self.pontuacao += 1
                sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1)
            } else {
                sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1)
                let correta = questoes[self.numeroQuestao].correta
                self.botoesResposta.first(where: { $0.tag ==  correta})?.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1)
            }
        })
        
        if numeroQuestao < (questoes.count - 1) {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
            //configurarQuestao() // Chamar a funcao novamente, pq a funcao muda a questao
        } else {
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
    }
    
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesResposta {
            let titulo = questoes[numeroQuestao].respostas[botao.tag]
            UIView.animate(withDuration: 0.8, animations: {
                botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1)
                botao.setTitle(titulo, for: .normal)
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController
        else {
            return
        }
        
        desempenhoVC.pontuacao = pontuacao
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
