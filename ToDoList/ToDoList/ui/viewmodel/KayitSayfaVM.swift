//
//  KayitSayfaVM.swift
//  ToDoList
//
//  Created by Mac on 13.08.2023.
//

import Foundation

class KayitSayfaVM {
    var yrepo = YapilacaklarDaoRepository()
    func kaydet(name: String){
        yrepo.kaydet(name: name)
    }
}
