//
//  ToDoTVC.swift
//  ToDoApp
//
//  Created by Maxim on 22.02.2021.
//

import UIKit

class ToDoTVC: UITableViewController {
    
    //Variables:
    
    var vc = TaskViewController()
    var arrayUserTasks = [TaskModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUserTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        arrayUserTasks[indexPath.row].currentIndex = indexPath
        let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        return cell
      }
    
    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
            vc.saveTaskDeleagate = self
            present(vc, animated: true, completion: nil)
        
        print(arrayUserTasks)
    }


}

extension ToDoTVC: SaveUserTaskDelegate {
  func saveTask(task: TaskModel) {
    arrayUserTasks.append(task)
    tableView.reloadData()
  }
}
