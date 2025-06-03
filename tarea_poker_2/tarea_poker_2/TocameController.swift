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
    var usuarioActual: String?

    
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
        targetButton.isHidden = true
        tiempoInicial = 30
        jugando = false
        guard let nombreUsuario = nombreUsuario1 else { return }

        
        // 1. Recuperar el diccionario de usuarios
            var usuarios = UserDefaults.standard.dictionary(forKey: "usuarios") as? [String: [String: Any]] ?? [:]

            // 2. Verificar si el usuario existe
            if var datosUsuario = usuarios[nombreUsuario] {
                // 3. Recuperar (o crear) el diccionario de puntajes
                var puntajes = datosUsuario["puntajes"] as? [String: [Int]] ?? [:]

                // 4. Agregar el nuevo puntaje a la lista de "tocame"
                var puntajesTocame = puntajes["tocame"] ?? []
                puntajesTocame.append(puntaje)
                puntajes["tocame"] = puntajesTocame

                // 5. Actualizar los datos del usuario y guardar en UserDefaults
                datosUsuario["puntajes"] = puntajes
                usuarios[nombreUsuario] = datosUsuario
                UserDefaults.standard.set(usuarios, forKey: "usuarios")
            }

//        var resultados = UserDefaults.standard.array(forKey: "resultados") as? [[String: Any]] ?? []
//        resultados.append(["nombre": nombre ?? "Jugador Desconocido", "puntaje": puntaje])
//        UserDefaults.standard.set(resultados, forKey: "resultados")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultadosViewController  {
            destination.usuarioActual = nombreUsuario1
            destination.mostrarGlobal = false
        }    }
}
