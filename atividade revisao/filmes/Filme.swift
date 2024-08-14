import Foundation

struct Filme: Encodable, Decodable{
    let nome: String
    let nota: String
    let genero: String
    let lancamento: String
}
