//
//  ToDoListManager.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation

protocol ToDoListManagerProtocol: AnyObject {
    func createToDONote(record: ToDoNote)
    func updateNote(note: ToDoNote) -> Bool
}

class ToDoListManager: ToDoListManagerProtocol
{
    private let _toDoListDataRepository: ToDoListDataRepository = ToDoListDataRepository()

    func createToDONote(record: ToDoNote)
    {
        do {
            try _toDoListDataRepository.create(record: record)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func getAllRecords() -> [ToDoNote]?
    {
        return _toDoListDataRepository.getAll()
    }
    
    func updateNote(note: ToDoNote) -> Bool {
        return _toDoListDataRepository.update(record: note)
    }
    
    func get(byIdentifier id: UUID) -> ToDoNote? {
        return get(byIdentifier: id)
    }
}
