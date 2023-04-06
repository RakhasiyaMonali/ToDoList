//
//  ViewControllerExtension.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation
import UIKit
import CoreData

extension ToDoListVC : NSFetchedResultsControllerDelegate
{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tblToDoList.reloadData()
    }
    
    @objc func onButtonPressed(sender:UIButton) {
        let myIndexPath = IndexPath(row: sender.tag, section: 0)
        let note = toDoListDataProvider.fetchedResultController.object(at: myIndexPath).convertToNotes()
        let manager: ToDoListManagerProtocol = ToDoListManager()

        let alertController = UIAlertController(title: "Note", message: "Would you mark it as completed?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            let note = ToDoNote(id: note.id, title: note.title, desc: note.desc, createdAt: note.createdAt, isTaskCompleted: 1)
            if manager.updateNote(note: note) {
                UIAlertController.alert(title: "Note", msg: "Note completed!", target: self)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
       }

}
