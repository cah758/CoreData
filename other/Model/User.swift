//
//  User.swift
//  other
//
//  Created by Cristian Alvarez hossein on 30/06/2021.
//

import Foundation
import CoreData

class User: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
    @NSManaged public var mail: String
    @NSManaged public var tasks: NSSet
    
    
    func giveTask(task:Task) {
        var set = tasks as! Set<Task>
        set.insert(task)
        task.assignUser(usert: self)
        tasks = set as NSSet
        
    }
    func takeTask(task:Task) {
        var set = tasks as! Set<Task>
        if set.contains(task) {
            set.remove(task)
            task.deleteUser()
            
        }
        
        tasks = set as NSSet
        
    }
    
}
