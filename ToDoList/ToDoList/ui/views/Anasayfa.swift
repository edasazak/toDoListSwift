//
//  ViewController.swift
//  ToDoList
//
//  Created by Mac on 12.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var toDoSearchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    var toDos = [ToDos]()
    var vm = AnasayfaVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoSearchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        _ = vm.toDoList.subscribe(onNext: { liste in
            self.toDos = liste
            self.toDoTableView.reloadData()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        vm.yapilacaklariYukle()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? ToDos {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.toDo = toDo
            }
        }
    }
}
extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDosCell") as! ToDosCell
        cell.toDo.text = toDo.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDo)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "SİL") {
            contextualAction, view, bool in
            let toDo = self.toDos[indexPath.row]
            let alert = UIAlertController(title: "Silme  İşlemi", message: "\(toDo.name) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) {
                action in
                self.vm.sil(id: toDo.id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
            return UISwipeActionsConfiguration(actions: [silAction])
    }
}
extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        vm.ara(aramaKelimesi: searchText)
    }
}
