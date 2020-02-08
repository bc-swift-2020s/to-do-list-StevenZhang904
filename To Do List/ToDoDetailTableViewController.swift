//
//  ToDoDetailTableViewController.swift
//  To Do List
//
//  Created by 张泽华 on 2020/2/6.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteView: UITableViewCell!
    
    var toDoItem : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDoItem == nil{
            toDoItem = "" 
        }
        nameField.text = toDoItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        toDoItem = nameField.text
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil)
        }
        else{
            navigationController?.popViewController(animated: true)
        }
    }
}
