//
//  TodoItems.swift
//  To Do List
//
//  Created by 张泽华 on 2020/3/7.
//  Copyright © 2020 张泽华. All rights reserved.
//

import Foundation
import UserNotifications

class ToDoItems{
    var itemsArray: [ToDoItem] = []
    func saveData(){
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(itemsArray)
        do{
            try data?.write(to: documentURL, options: .noFileProtection )
        }catch {
            print("Error: Could not save data \(error.localizedDescription)")
        }
        setNotification()
    }
    
    func loadData(completed: @escaping ()->()){
           let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
           guard let data = try? Data(contentsOf: documentURL) else{return}
           let jsonDecoder = JSONDecoder()
           do{
               itemsArray = try jsonDecoder.decode(Array<ToDoItem>.self, from: data)
           }catch{
               print("Error: Could not load data \(error.localizedDescription)")
           }
        completed()
       }
    
     func setNotification(){
        guard itemsArray.count > 0 else{
            return
        }
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        for index in 0..<itemsArray.count{
            if itemsArray[index].reminderSet{
                let toDoItem = itemsArray[index]
                itemsArray[index].notificationID = localNotificationManager.setCalendarNotification(title: toDoItem.name, subtitle: "", body: toDoItem.notes, badgeNumber: nil, sound: .default, date: toDoItem.date)
            }
        }
    }
       
}
