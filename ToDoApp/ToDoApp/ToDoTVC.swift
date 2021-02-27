//
//  ToDoTVC.swift
//  ToDoApp
//
//  Created by Maxim on 22.02.2021.
//

import UIKit

class ToDoTVC: UITableViewController, CellSubclassDelegate {
    
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
        cell.delegate = self

        return cell
      }
    
    func buttonTapped(cell:TaskCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
                // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                return
            }
        arrayUserTasks.remove(at: indexPath.row)
        tableView.reloadData()
        }
    
    func buttonDoneTapped (cell:TaskCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
                // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                return
            }
        if arrayUserTasks[indexPath.row].taskCellColor != .green {
            arrayUserTasks[indexPath.row].taskCellColor = .green}
        else {return}
        tableView.reloadData()
        
    }

    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
            vc.saveTaskDeleagate = self
            present(vc, animated: true, completion: nil)
    }
    

}



extension ToDoTVC: SaveUserTaskDelegate {
  func saveTask(task: TaskModel) {
    arrayUserTasks.append(task)
    tableView.reloadData()
  }
}
