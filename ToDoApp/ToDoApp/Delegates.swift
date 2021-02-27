//
//  Delegates.swift
//  ToDoApp
//
//  Created by Maxim on 22.02.2021.
//

import Foundation


protocol SaveUserTaskDelegate: class {
  func saveTask(task: TaskModel)
}
