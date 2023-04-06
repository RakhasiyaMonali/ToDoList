//
//  ToDoNote.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation

struct ToDoNote
{
    let id: UUID
    let title: String
    let desc: String
    let createdAt: Date
    let isTaskCompleted: NSNumber
}
