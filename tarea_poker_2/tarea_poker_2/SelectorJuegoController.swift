//
//  SecondViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-26.
//

import UIKit

class SelectorJuegoController: UIViewController {
    @IBOutlet weak var gamePicker: UITextField!
    
    var username: String?
    var pokerTituloAlert: String = "Póker es un juego clásico de cartas donde el objetivo es formar la mejor mano posible para ganar la partida."
    var pokerReglas:String = """
    Reglas básicas:
    1. Cada jugador recibe 5 cartas al comienzo de la partida.
    2. Cada jugador puede cambiar hasta 3 cartas para mejorar su mano.
    3. Las combinaciones de cartas, de mayor a menor valor, son las siguientes:
      - Escalera Real (A, K, Q, J, 10 del mismo palo)
      - Escalera de Color (cinco cartas consecutivas del mismo palo)
      - Póker (cuatro cartas del mismo número)
      - Full (un trío y una pareja)
      - Color (cinco cartas del mismo palo)
      - Escalera (cinco cartas consecutivas de cualquier palo)
      - Trío (tres cartas del mismo número)
      - Doble Pareja (dos pares)
      - Pareja (dos cartas del mismo número)
      - Carta Alta (cuando no se forma ninguna combinación)
    4. Gana el jugador que tenga la mejor mano al final de la partida.
"""
    var tocameTituloAlert: String = "Bienvenido a Tócame. Este es un juego rápido y sencillo que pone a prueba tu velocidad de reacción."
    
    var tocameReglas: String =  """
    Reglas básicas:
    1. Selecciona el juego “Tócame” en el menú de inicio.
    2. Espera a que el botón aparezca en la pantalla.
    3. Toca el botón lo más rápido que puedas.
    4. Tu tiempo de reacción se convierte en tu puntaje.
    5. Guarda tus puntajes y compite contigo mismo para mejorar cada vez más.
    """






    @IBOutlet weak var labelUser: UILabel!
    
    @IBOutlet weak var jugarBoton: UIButton!
    @IBOutlet weak var ayudaButton: UIButton!
    
    let games = ["Poker","Tocame"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        //gamePicker.inputView = pickerView
        labelUser.text = username
        
    }
    
    @IBAction func jugarOpciones (_ sender: Any) {
        if gamePicker.text == "Poker" {
            performSegue(withIdentifier: "goToPokerScreen" , sender: self)
        }
        else {
            performSegue(withIdentifier: "goToTocameScreen", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPokerScreen" {
            if let destination = segue.destination as? PokerController {
                destination.nombreUsuario1 = username
            }
        } else if segue.identifier == "goToTocameScreen" {
            if let destino = segue.destination as? TocameController {
                destino.nombreUsuario1 = username
            }
        }
    }
    @IBAction func mostrarAyuda(_ sender: UIButton) {
        if gamePicker.text == "Poker" {
            mostrarAlerta(pokerTituloAlert,pokerReglas)
        }
        else {
            mostrarAlerta(tocameTituloAlert,tocameReglas)
        }
    }
   
        func mostrarAlerta(_ titulo: String, _ mensaje: String) {
            let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default))
            present(alerta, animated: true)
        }
}


    

extension SelectorJuegoController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView (_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return games.count
    }
    func pickerView (_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return games[row]
    }
    func pickerView (_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int ) {
        
        gamePicker.text = games[row]
        gamePicker.resignFirstResponder()
        //self.view.endEditing(true)
    }
}
