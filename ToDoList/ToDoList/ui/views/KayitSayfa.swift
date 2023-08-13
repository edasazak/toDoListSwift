//
//  KayıtSayfa.swift
//  ToDoList
//
//  Created by Mac on 12.08.2023.
//

import UIKit

class KayitSayfa: UIViewController {

    @IBOutlet weak var kayitTextField: UITextField!
    var vm = KayitSayfaVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kayitButton(_ sender: Any) {
        if let name = kayitTextField.text {
            vm.kaydet(name: name)
        }
    }
    
    
   
    

}
