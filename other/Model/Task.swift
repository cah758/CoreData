//
//  Task.swift
//  other
//
//  Created by Cristian Alvarez hossein on 30/06/2021.
//

import Foundation
import CoreData

class Task: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
    @NSManaged public var descriptionTask: String
    @NSManaged public var user: User?
    
    public func deleteUser() { user = nil}
    public func assignUser(usert:User) {
        user = usert
        
    }
}
