
import UIKit

class FilmeCell: UITableViewCell {

   
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var lancamentoLabel: UILabel!
    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(filme: Filme){
        nomeLabel.text = filme.nome
        lancamentoLabel.text = filme.lancamento
        notaLabel.text = filme.nota
        generoLabel.text = filme.genero
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
