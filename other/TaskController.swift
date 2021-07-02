//
//  TaskController.swift
//  other
//
//  Created by Cristian Alvarez hossein on 29/06/2021.
//

import UIKit
import CoreData



class TaskController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    var arrayPickerDataSource = [String]()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPickerDataSource.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPickerDataSource[row]
        }
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var userPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtener()
        

    }
    
    @IBAction func save(_ sender: Any) {
              
        //1
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let managedContext = appDelegate.persistentContainer.viewContext
       
         //2
         let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)
        
         let task = Task(entity: entity!, insertInto: managedContext)
       
         //3
        task.setValue(taskNameTextField.text, forKey: "name")
        task.setValue(taskDescriptionTextField.text, forKey: "descriptionTask")
        task.assignUser(usert: users[userPicker.selectedRow(inComponent: 0)] )

       
         //4
         do {
           try managedContext.save()
           
         } catch let error as NSError {
           print("No ha sido posible guardar \(error), \(error.userInfo)")
         }
    }
    

    func obtener() {
     
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let managedContext = appDelegate.persistentContainer.viewContext
     
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
     
      do {
        let results = try managedContext.fetch(fetchRequest)
        users = results 
     } catch let error as NSError {
        print("No ha sido posible cargar \(error), \(error.userInfo)")
     }
        for user in users {
            
            arrayPickerDataSource.append(user.value(forKey: "mail") as! String)
        }
    }
}
