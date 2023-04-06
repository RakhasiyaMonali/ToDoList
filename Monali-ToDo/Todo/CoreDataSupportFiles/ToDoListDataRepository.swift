//
//  ToDoListDataRepository.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation
import CoreData

struct ToDoListDataRepository : BaseRepository
{
    func create(record: ToDoNote) throws {

        let cdNotes = CDToDoNote(context: PersistentStorage.shared.context)
        cdNotes.id = record.id
        cdNotes.title = record.title
        cdNotes.desc = record.desc
        cdNotes.createdAt = record.createdAt
        cdNotes.isTaskCompleted = record.isTaskCompleted
        
        do {
            try PersistentStorage.shared.saveContext()
        } catch {
            let nserror = error as NSError
            throw nserror
        }

    }

    func getAll() -> [ToDoNote]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDToDoNote.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [ToDoNote] = []
        records!.forEach({ (cdToDoNote) in
            results.append(cdToDoNote.convertToNotes())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> ToDoNote? {

        let result = self.getCdToDoNote(byId: id)
        guard result != nil else {return nil}

        return result!.convertToNotes()
    }

    func update(record: ToDoNote) -> Bool {

        let toDoNote = self.getCdToDoNote(byId: record.id)
        guard toDoNote != nil else {return false}

        toDoNote?.isTaskCompleted = record.isTaskCompleted
        
        do {
            try PersistentStorage.shared.saveContext()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return true
    }

    func delete(byIdentifier id: UUID) -> Bool
    {
        let toDoNotes = getCdToDoNote(byId: id)
        guard toDoNotes != nil else {return false}

        PersistentStorage.shared.context.delete(toDoNotes!)
        do {
            try PersistentStorage.shared.saveContext()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return true
    }

    private func getCdToDoNote(byId id: UUID) -> CDToDoNote?
    {
        let fetchRequest = NSFetchRequest<CDToDoNote>(entityName: "CDToDoNote")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }

    typealias T = ToDoNote

}
