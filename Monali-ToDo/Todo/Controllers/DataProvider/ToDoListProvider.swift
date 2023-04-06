//
//  ToDoListProvider.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation
import CoreData

class ToDoListProvider
{
    private weak var fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate?

    init(With fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate)
    {
        self.fetchedResultControllerDelegate = fetchedResultControllerDelegate
    }

    lazy var fetchedResultController: NSFetchedResultsController<CDToDoNote> =
        {

            let fetchRequest: NSFetchRequest<CDToDoNote> = CDToDoNote.fetchRequest()
            fetchRequest.fetchBatchSize = 20
            
            
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]

            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: PersistentStorage.shared.context, sectionNameKeyPath: nil, cacheName: nil)

            controller.delegate = fetchedResultControllerDelegate

            do{
                 try controller.performFetch()
            } catch{
                debugPrint(error)
            }

            return controller
    }()

}
