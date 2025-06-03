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
    var usuarioActual: String?
    var mostrarGlobal: Bool = false

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaResultados.dataSource = self
        resultados = []

        let usuarios = UserDefaults.standard.dictionary(forKey: "usuarios") as? [String: [String: Any]] ?? [:]

        if mostrarGlobal {
            for (nombre, datos) in usuarios {
                if let puntajes = datos["puntajes"] as? [String: [Int]],
                   let puntajesTocame = puntajes["tocame"],
                   let maxPuntaje = puntajesTocame.max() {
                    resultados.append(["nombre": nombre, "puntaje": maxPuntaje])
                }
            }
            resultados.sort {
                let p1 = $0["puntaje"] as? Int ?? 0
                let p2 = $1["puntaje"] as? Int ?? 0
                return p1 > p2
            }
            resultados = Array(resultados.prefix(10))
        } else if let usuario = usuarioActual,
                  let datos = usuarios[usuario],
                  let puntajes = datos["puntajes"] as? [String: [Int]],
                  let puntajesTocame = puntajes["tocame"] {
           
            for p in puntajesTocame {
                resultados.append(["nombre": usuario, "puntaje": p])
            }
            resultados.sort {
                let p1 = $0["puntaje"] as? Int ?? 0
                let p2 = $1["puntaje"] as? Int ?? 0
                return p1 > p2
            }
            resultados = Array(resultados.prefix(5))
        }

        tablaResultados.reloadData()
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
