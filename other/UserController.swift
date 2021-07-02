//
//  UserController.swift
//  other
//
//  Created by Cristian Alvarez hossein on 29/06/2021.
//

import UIKit
import CoreData


class UserController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveUser(_ sender: Any) {
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let managedContext = appDelegate.persistentContainer.viewContext
       
         let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
         let user = NSManagedObject(entity: entity!, insertInto: managedContext)
       
        user.setValue(userTextField.text, forKey: "name")
        user.setValue(nameTextField.text, forKey: "mail")

       
         do {
           try managedContext.save()
           
         } catch let error as NSError {
           print("No ha sido posible guardar \(error), \(error.userInfo)")
         }
    }
}
