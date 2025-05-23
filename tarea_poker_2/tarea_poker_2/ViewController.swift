//
//  ViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackJugador1: UIStackView!
    
    @IBOutlet weak var stackJugador2: UIStackView!
    
    @IBOutlet weak var jugador1TextField: UITextField!
    @IBOutlet weak var jugador2TextField: UITextField!
    
    @IBOutlet weak var cartaJugador1_1: UIImageView!
    @IBOutlet weak var cartaJugador1_2: UIImageView!
    @IBOutlet weak var cartaJugador1_3: UIImageView!
    @IBOutlet weak var cartaJugador1_4: UIImageView!
    @IBOutlet weak var cartaJugador1_5: UIImageView!

    @IBOutlet weak var cartaJugador2_1: UIImageView!
    @IBOutlet weak var cartaJugador2_2: UIImageView!
    @IBOutlet weak var cartaJugador2_3: UIImageView!
    @IBOutlet weak var cartaJugador2_4: UIImageView!
    @IBOutlet weak var cartaJugador2_5: UIImageView!
    
    
    @IBOutlet weak var labelJugador1: UILabel!
    
    @IBOutlet weak var jugador2label: UILabel!
    
    @IBOutlet weak var jugarButton: UIButton!
    
    @IBOutlet weak var labelBienvenidos: UILabel!
    
    var vistasCartasJugador1: [UIImageView] = []
    var vistasCartasJugador2: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Inicializamos los arrays aquí (ya conectados los IBOutlet)
        vistasCartasJugador1 = [
            cartaJugador1_1,
            cartaJugador1_2,
            cartaJugador1_3,
            cartaJugador1_4,
            cartaJugador1_5
        ]
        vistasCartasJugador2 = [
            cartaJugador2_1,
            cartaJugador2_2,
            cartaJugador2_3,
            cartaJugador2_4,
            cartaJugador2_5
        ]

    }
    var estadoTextoBoton: Bool = true
    
    @IBAction func jugar(_ sender: UIButton) {
        print("bOTON APRENTADO")
        mostrarCartas()
          
        if estadoTextoBoton {
            jugarButton.setTitle("Jugar de nuevo", for: .normal)
        } else {
            jugarButton.setTitle("Repartir", for: .normal)
            
        }
            
            // Alternar estado
//        estadoTextoBoton.toggle()
        jugador1TextField.isHidden = estadoTextoBoton
        jugador2TextField.isHidden = estadoTextoBoton
        labelJugador1.isHidden = estadoTextoBoton
        jugador2label.isHidden = estadoTextoBoton
        labelBienvenidos.isHidden = estadoTextoBoton
        
        
        // create the alert
        
        

    }

    func mostrarCartas() {
        // Usar la función generarPartida() de tu lógica (debería estar importada)
        let resultadoPartida = generarPartida()

        for i in 0..<5 {
            let cartaRojo = resultadoPartida.manoRojo[i]
            let cartaNegro = resultadoPartida.manoNegro[i]

            let nombreImagenRojo = "\(cartaRojo.palo.rawValue)\(cartaRojo.valor.rawValue)"
            let nombreImagenNegro = "\(cartaNegro.palo.rawValue)\(cartaNegro.valor.rawValue)"

            vistasCartasJugador1[i].image = UIImage(named: nombreImagenRojo)
            vistasCartasJugador2[i].image = UIImage(named: nombreImagenNegro)
        }
        if resultadoPartida.resultado.contains("Jugador 1") {
            stackJugador1.backgroundColor = .green
            stackJugador2.backgroundColor = .red
            
        } else if resultadoPartida.resultado.contains("Jugador 2"){
            stackJugador1.backgroundColor = .red
            stackJugador2.backgroundColor = .green
        } else {
            stackJugador1.backgroundColor = .gray
            stackJugador2.backgroundColor = .gray
        }
        print("Texto resultado: \(resultadoPartida.resultado)")
        
        let alert = UIAlertController(title: "RESULTADO!!", message: "\(resultadoPartida.resultado)", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

