
import UIKit

protocol FormViewControllerProtocol{
    func salvar(filme: Filme)
}
class FormViewController: UIViewController {

    @IBOutlet weak var txtGenero: UITextField!
    @IBOutlet weak var txtLancamento: UITextField!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtNota: UITextField!
    
    var delegate: FormViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func salvar(_ sender: Any) {
     
        let filmeNovo = Filme(
            nome: txtNome.text ?? "",
            nota: txtNota.text ?? "",
            genero: txtGenero.text ?? "",
            lancamento: txtLancamento.text ?? ""
        )
        
        delegate?.salvar(filme: filmeNovo)
        navigationController?.popViewController(animated: true)
    }
    

}
