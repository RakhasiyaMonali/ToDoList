//
//  CDToDoNote+CoreDataProperties.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//
//

import Foundation
import CoreData


extension CDToDoNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDToDoNote> {
        return NSFetchRequest<CDToDoNote>(entityName: "CDToDoNote")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var isTaskCompleted: NSNumber?

}

extension CDToDoNote : Identifiable {

}
