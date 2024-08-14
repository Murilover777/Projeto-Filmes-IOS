import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FormViewControllerProtocol {
    
    var userDefaults = UserDefaults.standard
    let listaFilmesKey = "ListaFilmes"
    
    var listaFilmes : [Filme] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        do{
            if let listaFilmesSalva = userDefaults.value(forKey: listaFilmesKey) as? Data{
                self.listaFilmes = try JSONDecoder().decode([Filme].self, from: listaFilmesSalva)
                tableView.reloadData()
            }
        }catch{
            print("Erro ao salvar na memória local: \(error.localizedDescription)")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filme = listaFilmes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmes", for: indexPath) as! FilmeCell
        
        cell.setup(filme: filme)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filme = listaFilmes[indexPath.row]
        performSegue(withIdentifier: "detalhes", sender: filme)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhes"{
            if let viewControllerDestino = segue.destination as? DetalhesViewController
            {
                guard let filme = sender as? Filme else { return }
                viewControllerDestino.setup(filme: filme)
                
            }
        }else if segue.identifier == "form"{
            let viewControllerFormulario = segue.destination as! FormViewController
            viewControllerFormulario.delegate = self
        }
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "form", sender: nil)
    }
    
    func salvar(filme: Filme) {
        listaFilmes.append(filme)
        
        tableView.reloadData()
        
        do{
            let dataLista = try JSONEncoder().encode(listaFilmes)
            userDefaults.set(dataLista, forKey: listaFilmesKey)
        }catch{
            print("Erro ao salvar na memória local: \(error.localizedDescription)")
        }
        
    }
}
