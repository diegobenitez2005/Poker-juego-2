//
//  SecondViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-26.
//

import UIKit

class SelectorJuegoController: UIViewController {
    
    @IBOutlet weak var gamePicker: UITextField!
    
    @IBOutlet weak var usuario1TextField: UITextField!
    
    @IBOutlet weak var usuario2TextField: UITextField!
    
    @IBOutlet weak var labelUser1: UILabel!
    
    @IBOutlet weak var labelUser2: UILabel!
    @IBOutlet weak var jugarBoton: UIButton!
    
    @IBOutlet weak var tocameView: UIView!
    
    let games = ["Poker","Tocame"]
    var pickerView = UIPickerView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        gamePicker.inputView = pickerView
        usuario1TextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        usuario2TextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        jugarBoton.isEnabled = false
        
    }
    
    @IBAction func jugarOpciones (_ sender: Any) {
        if gamePicker.text == "Poker" {
            performSegue(withIdentifier: "goToPokerScreen" , sender: self)
        }
        else {
            performSegue(withIdentifier: "goToTocameScreen", sender: self)
        }
    }
    @objc func textFieldsChanged() {
        validateButton()
    }
    
    func validateButton() {
        let jugador1 = usuario1TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let jugador2 = usuario2TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        // Obtener el juego seleccionado actual
        let selectedRow = gamePicker.tag // Necesitas guardar esto en tu pickerView
        let selectedGame = games.indices.contains(selectedRow) ? games[selectedRow] : ""
        
        if selectedGame == "Tocame" {
            jugarBoton.isEnabled = !jugador1.isEmpty
        } else {
            jugarBoton.isEnabled = !jugador1.isEmpty && !jugador2.isEmpty
        }
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

        if games[row] == "Tocame" {
            labelUser2.isHidden = true
            usuario2TextField.isHidden = true
        } else {
            labelUser2.isHidden = false
            usuario2TextField.isHidden = false
        }

       

            // Para animar el cambio de layout:
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPokerScreen" {
            if let destination = segue.destination as? PokerController {
                destination.nombreUsuario1 = usuario1TextField.text
                destination.nombreUsuario2 = usuario2TextField.text
            }
        } else if segue.identifier == "goToTocameScreen" {
            if let destination = segue.destination as? TocameController {
                destination.nombreUsuario1 = usuario1TextField.text
            }
        }
    }

}
