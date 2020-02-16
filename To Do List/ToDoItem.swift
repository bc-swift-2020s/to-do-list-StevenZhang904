//
//  ToDoItem.swift
//  To Do List
//
//  Created by 张泽华 on 2020/2/8.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit
struct ToDoItem: Codable{
    var name: String
    var date: Date
    var notes: String
    var reminderSet : Bool
}
