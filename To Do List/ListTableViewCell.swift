//
//  ListTableViewCell.swift
//  To Do List
//
//  Created by 张泽华 on 2020/3/6.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}


class ListTableViewCell: UITableViewCell {
    weak var delegate: ListTableViewCellDelegate?
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var toDoItem: ToDoItem!{
        didSet{
            nameLabel.text = toDoItem.name
            checkBoxButton.isSelected = toDoItem.completed
            
        }
    }
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
    
}
