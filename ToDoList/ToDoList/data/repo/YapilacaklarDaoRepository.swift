//
//  YapilacaklarDaoRepository.swift
//  ToDoList
//
//  Created by Mac on 13.08.2023.
//

import Foundation
import RxSwift

class YapilacaklarDaoRepository {
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())

    func kaydet(name: String){
        print(name)
    }
    func guncelle(id: Int, name: String) {
        print(id, name)
    }
    func sil(id: Int) {
        print(id)
    }
    func ara(aramaKelimesi: String) {
        print(aramaKelimesi)
    }
    func yapilacaklariYukle() {
        var liste = [ToDos]()
        let k1 = ToDos(id: 1, name: "work")
        liste.append(k1)
        toDoList.onNext(liste)
    }
}
