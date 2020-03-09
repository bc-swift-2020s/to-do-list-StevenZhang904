//
//  UIViewController+alert.swift
//  To Do List
//
//  Created by 张泽华 on 2020/3/8.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit

extension UIViewController{
    func oneButtonAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
