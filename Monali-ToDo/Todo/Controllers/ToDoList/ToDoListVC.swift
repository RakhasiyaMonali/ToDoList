//
//  ToDoListVC.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import UIKit

class ToDoListVC: UIViewController {

    @IBOutlet weak var tblToDoList: UITableView!
    @IBOutlet weak var btnPlus: UIButton!
    
     lazy var toDoListDataProvider: ToDoListProvider =
    {
        let dataProvider = ToDoListProvider(With: self)
        return dataProvider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        debugPrint(path.first!)
        self.title = "Notes"
    }

    @IBAction func AddNotesTap(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AddNotesVC") { coder -> AddNotesVC? in
            AddNotesVC(coder: coder, mangerProtocol: ToDoListManager())
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoListDataProvider.fetchedResultController.fetchedObjects?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! ToDoNotesTC
        
        let note = toDoListDataProvider.fetchedResultController.object(at: indexPath).convertToNotes()
        cell.note = note
        cell.selectionStyle = .none
        cell.btnTaskStatus.tag = indexPath.row
        cell.btnTaskStatus.addTarget(self, action: #selector(onButtonPressed(sender :)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsVC") { coder -> DetailsVC? in
            DetailsVC(coder: coder, noteDetail: self.toDoListDataProvider.fetchedResultController.object(at: indexPath).convertToNotes())
        }
        self.navigationController?.pushViewController(detailVc, animated: true)

    }
}
