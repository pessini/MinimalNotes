//
//  UIViewController+CoreData.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 04/03/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
