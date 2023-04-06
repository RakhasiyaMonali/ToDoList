//
//  CDToDoNotesExtensions.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation

extension CDToDoNote
{
    func convertToNotes() -> ToDoNote
    {
        return ToDoNote(id: self.id!, title: self.title!, desc: self.desc!, createdAt: self.createdAt!, isTaskCompleted: self.isTaskCompleted ?? 0)
    }
}
