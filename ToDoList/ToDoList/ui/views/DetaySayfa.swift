//
//  DetaySayfa.swift
//  ToDoList
//
//  Created by Mac on 12.08.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var detayTextField: UITextField!
    var toDo: ToDos?
    var vm = DetaySayfaVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDo = toDo {
            detayTextField.text = toDo.name
        }

    }
    

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let name = detayTextField.text, let toDo = toDo {
            vm.guncelle(id: toDo.id!, name: name)
        }
    }
    
    
}
