//
//  Data.swift
//  Cegonhadora
//
//  Created by Ana Carolina Soares de Melo on 10/03/20.
//  Copyright © 2020 Ana Melo. All rights reserved.
//

class Data {
    var dia: Int = 0
    var mes: Int = 0
    var ano: Int = 0
    
    init (dia: Int, mes: Int, ano: Int){
        self.dia = dia
        self.mes = mes
        self.ano = ano
    }
    
    func meses(){
    
    }
    
    func calculoDataProvavel() ->  (day: String, month:String, year: String) {
       
        // Somar 7 dias à data informada
            var calculoDia: Int = dia+7
            if calculoDia > 23 {
                mes = mes+1
                dia = dia-23
                calculoDia = dia+7
            }
            
        // Voltar três meses antes a data do passo anterior
            var calculoMes: Int = mes-3
            if calculoMes == -2{
                calculoMes = 10
            } else if calculoMes == -1 {
                calculoMes = 11
            } else if calculoMes == 0 {
                calculoMes = 12
            }
        
        // Aumentar um ano da data do passo anterior
            let calculoAno: Int = ano+1
                
        // Exibir resultado
            let diaString: String = String(format :
                    "%2i", calculoDia)
            let mesString: String = String(format :
                "%2i", calculoMes)
            let anoString: String = String(format :
                "%4i", calculoAno)
        
        return (diaString, mesString, anoString)
    }
}
