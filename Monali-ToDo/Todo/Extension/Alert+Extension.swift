//
//  Alert+Extension.swift
//  AppStoreReviews
//
//  Created by Monali on 08/03/22.
//  Copyright © 2022 ING. All rights reserved.
//

import Foundation
import UIKit

// MARK: - handle Alert

extension UIAlertController {
    class func alert(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
    
    class func alertWithCancel(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
        (result: UIAlertAction) -> Void in
        })

        target.present(alert, animated: true, completion: nil)
    }
}
