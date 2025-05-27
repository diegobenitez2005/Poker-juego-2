//
//  ThirdViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-26.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tocameView: UIView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var puntajeLabel: UILabel!
    
    @IBOutlet weak var targetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var nombreUsuario1: String?
    
    var iniciarTimer: Timer?
    var tiempoInicial: Int = 30
    
    
    
    override func viewDidLoad() {
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
        targetButton.isHidden = true
        tiempoInicial = 30
        jugando = false
        
        
    }
    var puntaje: Int = 0
    var jugando: Bool = false

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
