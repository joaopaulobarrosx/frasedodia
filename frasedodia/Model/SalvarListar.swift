//
//  SalvarListar.swift
//  frasedodia
//
//  Created by Joao Barros on 16/06/22.
//

import UIKit

class SalvarListar {
    
    var dados: [String] = []
    
    func salvar(dado: String){
        
        dados = listar()
        
        dados.append(dado)
        UserDefaults.standard.set(dados, forKey: "esse")
        
        
    }
    
    func listar() -> Array<String> {
        
        let info = UserDefaults.standard.object(forKey: "esse")
        
        if info != nil {
            return info as! Array<String>
        }else {
            return []
        }
    }
}
