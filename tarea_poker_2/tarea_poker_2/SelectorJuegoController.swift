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
    
    
    
    
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var jugarBoton: UIButton!
    
    @IBOutlet weak var tocameView: UIView!
    
    let games = ["Poker","Tocame"]
    var pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        gamePicker.inputView = pickerView
        jugarBoton.isEnabled = false
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
        if let 
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToPokerScreen" {
//            if let destination = segue.destination as? PokerController {
//                destination.nombreUsuario1 = usuario1TextField.text
//                destination.nombreUsuario2 = usuario2TextField.text
//            }
//        } else if segue.identifier == "goToTocameScreen" {
//            if let destination = segue.destination as? TocameController {
//                destination.nombreUsuario1 = usuario1TextField.text
//            }
//        }
//    }

}
