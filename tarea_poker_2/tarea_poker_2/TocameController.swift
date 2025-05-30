//
//  ThirdViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-26.
//

import UIKit

class TocameController: UIViewController {
    
    @IBOutlet weak var tocameView: UIView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var puntajeLabel: UILabel!
    
    @IBOutlet weak var targetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tablasButton: UIButton!
    
    var nombreUsuario1: String?
    var iniciarTimer: Timer?
    var tiempoInicial: Int = 30
    var puntaje: Int = 0
    var jugando: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetButton.isHidden = true
        nombreLabel.text = nombreUsuario1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let viewWidth = tocameView.bounds.width
        let viewHeight = tocameView.bounds.height

        let buttonWidth = targetButton.bounds.width
        let buttonHeight = targetButton.bounds.height

        let maxX = viewWidth - buttonWidth
        let maxY = viewHeight - buttonHeight

        let randomX = CGFloat.random(in: 0...maxX)
        let randomY = CGFloat.random(in: 0...maxY)

        UIView.animate(withDuration: 0.1) {
            self.targetButton.frame.origin = CGPoint(x: randomX, y: randomY)
        }
        puntaje += 1
        puntajeLabel.text = String(puntaje)
    }
    
    @IBAction func startTaped(_ sender: UIButton){
        puntaje = 0
        startTimer()
        targetButton.isHidden = false
        
    }
    @IBAction func leaderboardTapped (_ sender: UIButton) {
        performSegue(withIdentifier: "goToLeaderboard", sender: self)
    }
    
    func startTimer() {
        timerLabel.text = "\(tiempoInicial)"
        iniciarTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.tiempoInicial -= 1
            self.timerLabel.text = "\(self.tiempoInicial)"
            self.startButton.isEnabled = self.jugando
            if self.tiempoInicial <= 0 {
                timer.invalidate()
                self.timerFinal()
                self.startButton.isEnabled = true
            }
        }
    }
    
    func timerFinal () {
        let nombre = nombreUsuario1
        targetButton.isHidden = true
        tiempoInicial = 30
        jugando = false
        var resultados = UserDefaults.standard.array(forKey: "resultados") as? [[String: Any]] ?? []
        resultados.append(["nombre": nombre ?? "Jugador Desconocido", "puntaje": puntaje])
        UserDefaults.standard.set(resultados, forKey: "resultados")
    }
}
