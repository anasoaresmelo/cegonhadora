//
//  Comparacoes.swift
//  Cegonhadora
//
//  Created by Ana Carolina Soares de Melo on 19/03/20.
//  Copyright © 2020 Ana Melo. All rights reserved.
//

import Foundation
class Comparacoes{
    var quantidadeSemanas: Int = 0
    let associacoes: [String] = ["Uma semente de papoula", "Uma semente de maçã", "Uma ervilha", "Um mirtilo", "Uma framboesa", "Uma azeitona", "Uma ameixa seca", "Uma lima", "Uma ameixa", "Um pêssego", "Um limão", "Uma laranja", "Um abacate pequeno", "Uma cebola", "Uma batata doce", "Uma manga", "Uma banana", "Uma romã", "Um mamão Papaya", "Uma beringela", "Um milho", "Uma couve-rábano", "Um pepino longo", "Uma couve-flor", "Um alface grande", "Um jerimum", "Um repolho grande", "Um repolho chinês", "Um jicama", "Um abacaxi", "Um melão cantaloupe", "Um melão amarelo", "Um melão", "Um alho poró", "Uma abóbora", "Uma melancia", "Uma jaca"]
    
    init(quantidadeSemanas: Int) {
        self.quantidadeSemanas = quantidadeSemanas
    }
    
    func comparacaoTamanho() -> (String){
        var comparativo: String = ""
        if quantidadeSemanas < 4{
           comparativo = "Seu bebê ainda não pode ser comparado"
        } else if quantidadeSemanas >= 4{
            let x: Int = quantidadeSemanas - 4
            comparativo = "\(associacoes[x])"
        }
        
        return comparativo
    }
}
