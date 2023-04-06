//
//  DetailsVC.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDecs: UILabel!
    
    private let noteDetail: ToDoNote

    init(coder: NSCoder, noteDetail: ToDoNote) { // dependency injection
        self.noteDetail = noteDetail
        super.init(coder: coder)!
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = self.noteDetail.title
        lblDecs.text = self.noteDetail.desc
    }
    
}
