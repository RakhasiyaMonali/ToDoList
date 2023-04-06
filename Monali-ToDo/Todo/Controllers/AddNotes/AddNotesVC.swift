//
//  AddNotesVC.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import UIKit

class AddNotesVC: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var textViewDesc: UITextView!
        
    weak var mangerProtocol: ToDoListManagerProtocol?

    public init(coder: NSCoder, mangerProtocol: ToDoListManagerProtocol) {
        self.mangerProtocol = mangerProtocol
        super.init(coder: coder)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func applyBtnTap(_ sender: Any) {
        
        let validation = AddNoteValidation()
        let validationResult = validation.validate(title: txtTitle.text, desc: textViewDesc.text)
        if(validationResult.isValid) {
            let note = ToDoNote(id: UUID(), title: txtTitle.text ?? "", desc: textViewDesc.text, createdAt: Date(), isTaskCompleted: false)
            mangerProtocol?.createToDONote(record: note)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            UIAlertController.alert(title: "Note", msg: validationResult.message ?? "", target: self)
        }
    }
    
    @IBAction func cancelBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

