//
//  ToDosCell.swift
//  ToDoList
//
//  Created by Mac on 12.08.2023.
//

import UIKit

class ToDosCell: UITableViewCell {
    @IBOutlet weak var toDo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
