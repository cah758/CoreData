//
//  TableUserController.swift
//  other
//
//  Created by Cristian Alvarez hossein on 30/06/2021.
//

import UIKit
import CoreData

var users = [User]()

class TableUserController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count

    }
    
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        obtener()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
     let user = users[indexPath.row]

     cell!.textLabel!.text = user.value(forKey: "name") as? String
      return cell!
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
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
     tableView.reloadData()
    }
}
