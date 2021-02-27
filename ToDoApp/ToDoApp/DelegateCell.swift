//
//  DelegateCell.swift
//  ToDoApp
//
//  Created by Maxim on 27.02.2021.
//

import Foundation

protocol CellSubclassDelegate: class {
    func buttonTapped(cell: TaskCell)
    func buttonDoneTapped(cell: TaskCell)
}
