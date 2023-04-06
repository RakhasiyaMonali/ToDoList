//
//  ToDoListManagerTests.swift
//  TodoTests
//
//  Created by Monali on 12/04/22.
//

import XCTest
import CoreData
@testable import Todo


class ToDoListManagerTests: XCTestCase {
    
    var toDoListManager: ToDoListManager!
    
    override func setUp() {
        super.setUp()
        toDoListManager = ToDoListManager()
    }
        
    func test_read_Note_failed() {
        //let noteA = toDoListManager.createToDONote(record: ToDoNote(id: UUID(), title: "Ab", desc: "A", createdAt: Date()))
        let noteList = toDoListManager.getAllRecords()

        XCTAssertFalse(noteList!.contains(where: { note in
            if note.title == "xyz"{return true}
            else {return false}
        }))
    }

    func test_read_Notes_success() {
        
        toDoListManager.createToDONote(record: ToDoNote(id: UUID(), title: "B", desc: "A", createdAt: Date(), isTaskCompleted: false))

        let noteList = toDoListManager.getAllRecords()

        XCTAssertTrue(noteList!.contains(where: { note in
            if note.title == "B"{return true}
            else {return false}
        }))
    }

}
