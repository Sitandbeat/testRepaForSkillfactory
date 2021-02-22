//
//  TaskViewController.swift
//  ToDoApp
//
//  Created by Maxim on 22.02.2021.
//

import UIKit

class TaskViewController: UIViewController {
    
    weak var saveTaskDeleagate: SaveUserTaskDelegate?

    @IBOutlet weak var userTaskField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text {
             if !task.isEmpty {
                let task = TaskModel(taskName: task, taskCellColor: .white)
                saveTaskDeleagate?.saveTask(task: task)
                dismiss(animated: true, completion: nil)
            
             }
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
