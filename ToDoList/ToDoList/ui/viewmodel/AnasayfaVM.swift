//
//  AnasayfaVM.swift
//  ToDoList
//
//  Created by Mac on 13.08.2023.
//

import Foundation
import RxSwift

class AnasayfaVM {
    var yrepo = YapilacaklarDaoRepository()
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init() {
        toDoList = yrepo.toDoList
    }
    func sil(id: Int) {
        yrepo.sil(id: id)
        yapilacaklariYukle()
    }
    func ara(aramaKelimesi: String) {
        yrepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func yapilacaklariYukle() {
        yrepo.yapilacaklariYukle()
    }
}
