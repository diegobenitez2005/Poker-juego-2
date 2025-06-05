import UIKit

class ResultadosViewController: UIViewController {
    @IBOutlet weak var tablaResultados: UITableView!
    
    var usuarioActual: String?
    var mostrarGlobal: Bool = false
    
    var scores: [UserScoreResponse] = []           // Para puntajes del usuario
    var scoreGlobal: [ListOfScoresModel] = []      // Para puntajes globales
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaResultados.dataSource = self
        tablaResultados.delegate = self
        cargarScores()
    }
    
    private func cargarScores() {
        if mostrarGlobal {
            cargarScoresGlobales()
        } else {
            guard let userId = SesionUsuario.shared.userId else {
                print("⚠️ No se encontró el userId")
                return
            }
            cargarScoresDelUsuario(userId: userId)
        }
    }
    
    private func cargarScoresDelUsuario(userId: String) {
        UserScoreRepo.obtenerScoresPorUsuario(userId: userId) { [weak self] scores in
            self?.scores = scores.sorted { $0.score > $1.score }
            if self?.scores.count ?? 0 > 5 {
                self?.scores = Array(self!.scores.prefix(5))
            }
            
            DispatchQueue.main.async {
                self?.tablaResultados.reloadData()
            }
        }
    }
    
    private func cargarScoresGlobales() {
        ListScoreRepo.obtenerScores { [weak self] scores in
            self?.scoreGlobal = scores.sorted { $0.score > $1.score }
            if self?.scoreGlobal.count ?? 0 > 10 {
                self?.scoreGlobal = Array(self!.scoreGlobal.prefix(10))
            }
            
            DispatchQueue.main.async {
                self?.tablaResultados.reloadData()
            }
        }
    }
}

extension ResultadosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostrarGlobal ? scoreGlobal.count : scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaResultado", for: indexPath)
        
        if mostrarGlobal {
            let resultado = scoreGlobal[indexPath.row]
            let fechaFormateada = formatearFecha(resultado.date)
            cell.textLabel?.text = "#\(indexPath.row + 1) - Puntaje: \(resultado.score) - \(fechaFormateada)"
        } else {
            let resultado = scores[indexPath.row]
            let fechaFormateada = formatearFecha(resultado.date)
            cell.textLabel?.text = "Puntaje: \(resultado.score) - \(fechaFormateada)"
            cell.detailTextLabel?.text = "Juego ID: \(resultado.game_id)"
        }
        
        return cell
    }
    
    private func formatearFecha(_ fecha: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: fecha) {
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: date)
        }
        return fecha // si no se puede convertir, se devuelve la original
    }
}

extension ResultadosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if mostrarGlobal {
            let score = scoreGlobal[indexPath.row]
            print("Score global seleccionado: \(score.score) del \(score.date)")
        } else {
            let score = scores[indexPath.row]
            print("Score del usuario seleccionado: \(score.score) del \(score.date)")
        }
    }
}
