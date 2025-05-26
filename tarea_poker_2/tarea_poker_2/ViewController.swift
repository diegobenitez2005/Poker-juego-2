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
    
    @IBOutlet weak var puntajeJugador1: UILabel!
    @IBOutlet weak var jugador2label: UILabel!
    
    @IBOutlet weak var puntajeJugador2: UILabel!
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
        //estadoTextoBoton.toggle()
        jugador1TextField.isHidden = estadoTextoBoton
        jugador2TextField.isHidden = estadoTextoBoton
        labelJugador1.isHidden = estadoTextoBoton
        jugador2label.isHidden = estadoTextoBoton
        labelBienvenidos.isHidden = estadoTextoBoton
        puntajeJugador1.text = String(puntosJugador1)
        puntajeJugador2.text = String(puntosJugador2)
        stackJugador1.isHidden = false
        stackJugador2.isHidden = false
        
        // create the alert
        
        

    }
    @IBAction func resetButton(_ sender: UIButton) {
        // Mostrar los campos de texto y etiquetas de los jugadores
        jugador1TextField.isHidden = false
        jugador2TextField.isHidden = false
        labelJugador1.isHidden = false
        jugador2label.isHidden = false
        labelBienvenidos.isHidden = false

        // Ocultar los stacks de cartas
        stackJugador1.isHidden = true
        stackJugador2.isHidden = true

        // Resetear colores
        stackJugador1.backgroundColor = .clear
        stackJugador2.backgroundColor = .clear

        // Limpiar cartas
//        for imageView in vistasCartasJugador1 {
//            imageView.image = nil
//        }
//        for imageView in vistasCartasJugador2 {
//            imageView.image = nil
//        }

        // Limpiar campos de texto (opcional)
        jugador1TextField.text = ""
        jugador2TextField.text = ""

        // Resetear botón de jugar
        jugarButton.setTitle("Repartir", for: .normal)
        estadoTextoBoton = true
        
        puntajeJugador1.text = "0"
        puntajeJugador2.text = "0"
        puntosJugador1 = 0
        puntosJugador2 = 0
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
        let jugador1 = jugador1TextField.text ?? "Jugador 1"
        let jugador2 = jugador2TextField.text ?? "Jugador 2"
        var alert = UIAlertController(title: "RESULTADO!!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        if resultadoPartida.resultado.contains("Jugador 1") {
            stackJugador1.backgroundColor = .green
            stackJugador2.backgroundColor = .red
           alert = UIAlertController(title: "RESULTADO!!", message: "\(jugador1) gana!!", preferredStyle: UIAlertController.Style.alert)
            puntosJugador1 += 1
            
            
        } else if resultadoPartida.resultado.contains("Jugador 2"){
            stackJugador1.backgroundColor = .red
            stackJugador2.backgroundColor = .green
           alert = UIAlertController(title: "RESULTADO!!", message: "\(jugador2) gana!!", preferredStyle: UIAlertController.Style.alert)
            puntosJugador2 += 1
        } else {
            stackJugador1.backgroundColor = .gray
            stackJugador2.backgroundColor = .gray
            alert = UIAlertController(title: "RESULTADO!!", message: "\(resultadoPartida.resultado)", preferredStyle: UIAlertController.Style.alert)
        }
        print("Texto resultado: \(resultadoPartida.resultado)")
       
        
                // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

var puntosJugador1: Int = 0
var puntosJugador2: Int = 0
