//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Maxim on 22.02.2021.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var someTask: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    weak var delegate: CellSubclassDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse () {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
      }
    


    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        self.delegate?.buttonTapped(cell: self)
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        self.delegate?.buttonDoneTapped(cell: self)
    }
    
}
