//
//  ToDoNotesTC.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import UIKit

class ToDoNotesTC: UITableViewCell {

    @IBOutlet weak var btnTaskStatus: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    var note : ToDoNote! {
        didSet {
            self.lblTitle.text = note.title
            self.lblDesc.text = note.desc
            self.btnTaskStatus.setImage(UIImage(named: note.isTaskCompleted == 0 ? "icn_checkbox_unselect" : "icn_checkbox_select"), for: .normal)
            self.btnTaskStatus.isUserInteractionEnabled = note.isTaskCompleted == 0 ? true : false
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
