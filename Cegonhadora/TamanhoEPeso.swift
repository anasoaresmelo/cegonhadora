//
//  TamanhoEPeso.swift
//  Cegonhadora
//
//  Created by Ana Carolina Soares de Melo on 19/03/20.
//  Copyright © 2020 Ana Melo. All rights reserved.
//

import Foundation

class Dimensoes {
    var quantidadeSemanas:Int = 0
    let comprimentos: [String] = ["1,6cm", "2,3cm", "3,1cm", "4,1cm", "5,4cm", "7,4cm", "8,7cm", "10,1cm", "11,6cm", "13,0cm", "14,2cm", "15,3cm", "16,4cm", "26,7cm", "27,8cm", "28,9cm", "30,0cm", "34,6cm", "35,6cm", "36,6cm", "37,6cm", "38,6cm", "39,9cm", "41,1cm", "42,4cm", "43,7cm", "45,0cm", "46,2cm", "47,4cm", "48,6cm", "49,8cm", "50,7cm", "51,2cm"]
    let pesos: [String] = ["1g", "2g", "4g", "7g", "14g", "23g", "43g", "70g", "100g", "140g", "190g", "240g", "300g", "360g", "430g", "501g", "600g", "660g", "760g", "875g", "1,0kg", "1,1kg", "1,3kg", "1,5kg", "1,7kg", "1,9kg", "2,1kg", "2,4kg", "2,6kg", "2,9kg", "3,1kg", "3,3kg", "3,5kg"]
    
    init(quantidadeSemanas: Int) {
        self.quantidadeSemanas = quantidadeSemanas
    }
    
    func calcularComprimento() -> (String){
        var comparativoComprimento: String = ""
        if quantidadeSemanas < 8{
           comparativoComprimento = ">\(comprimentos[0])"
        } else if quantidadeSemanas >= 8{
            let x: Int = quantidadeSemanas - 8
            comparativoComprimento = "\(comprimentos[x])"
        }
        
        return comparativoComprimento
    }
    
    func calcularPeso() -> (String){
        var comparativoPeso: String = ""
        if quantidadeSemanas < 8{
           comparativoPeso = ">\(pesos[0])"
        } else if quantidadeSemanas >= 8{
            let y: Int = quantidadeSemanas - 8
            comparativoPeso = "\(pesos[y])"
        }
        
        return comparativoPeso
    }
}
