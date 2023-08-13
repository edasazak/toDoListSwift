//
//  DetaySayfaVM.swift
//  ToDoList
//
//  Created by Mac on 13.08.2023.
//

import Foundation

class DetaySayfaVM {
    var yrepo = YapilacaklarDaoRepository()

    func guncelle(id: Int, name: String) {
        yrepo.guncelle(id: id, name: name)
    }
    
}
