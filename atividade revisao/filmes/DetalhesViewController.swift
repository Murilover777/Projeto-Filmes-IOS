
import UIKit

class DetalhesViewController: UIViewController {


    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelLancamento: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var labelGenero: UILabel!
    
    var filme: Filme?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setup(filme: Filme){
        self.filme = filme
    }
    
    private func setupLabels(){
        labelNome.text = filme?.nome
        labelGenero.text = filme?.genero
        labelNota.text = filme?.nota
        labelLancamento.text = filme?.lancamento
    }
}
