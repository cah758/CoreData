//
//  TableTaskController.swift
//  other
//
//  Created by Cristian Alvarez hossein on 30/06/2021.
//

import UIKit
import CoreData


var tasks = [Task]()

class TableTaskController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count

    }
    
    @IBOutlet weak var tableView: UITableView!
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        obtener()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
       let task = tasks[indexPath.row]
    
        

        cell!.textLabel!.text = task.value(forKey: "name") as? String
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    }
    
    func obtener() {
     
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let managedContext = appDelegate.persistentContainer.viewContext
     
      let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
     
      do {
        let results = try managedContext.fetch(fetchRequest)
        tasks = results
     } catch let error as NSError {
        print("No ha sido posible cargar \(error), \(error.userInfo)")
     }
     tableView.reloadData()
    }
}
