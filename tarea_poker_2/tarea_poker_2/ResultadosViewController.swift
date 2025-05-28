//
//  ResultadosViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-27.
//

import UIKit
var resultados: [[String: Any]] = []

class ResultadosViewController: UIViewController {
    @IBOutlet weak var tablaResultados: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let datos = UserDefaults.standard.array(forKey: "resultados") as? [[String: Any]] {
            resultados = datos
        }
        tablaResultados.dataSource = self
        resultados.sort {
            let puntaje1 = $0["puntaje"] as? Int ?? 0
            let puntaje2 = $1["puntaje"] as? Int ?? 0
            return puntaje1 > puntaje2
        }
    }
}
extension ResultadosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultados.count > 5 ? 5 : resultados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaResultado", for: indexPath)
        
        let resultado = resultados[indexPath.row]
        let nombre = resultado["nombre"] as? String ?? "Desconocido"
        let puntaje = resultado["puntaje"] as? Int ?? 0
        
        cell.textLabel?.text = "\(nombre) - Puntaje: \(puntaje)"
        return cell
    }
}
