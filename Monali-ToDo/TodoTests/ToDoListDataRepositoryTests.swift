//
//  ToDoListDataRepositoryTests.swift
//  TodoTests
//
//  Created by Monali on 12/04/22.
//

import XCTest
import CoreData
@testable import Todo

class ToDoListDataRepositoryTests: XCTestCase {

    var toDoListRepository: ToDoListDataRepository!

    override func setUp() {
        super.setUp()
        toDoListRepository = ToDoListDataRepository()
    }

    func test_create_Note_Successfull() {
        let uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
        do {
            try toDoListRepository.create(record: ToDoNote(id: uuid!, title: "test", desc: "abc", createdAt: Date(), isTaskCompleted: false))
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        let toDoList = toDoListRepository.get(byIdentifier: uuid!)

        XCTAssertEqual("test", toDoList?.title)
    }
    
    func test_create_Note_Failed() {
        let uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
        do {
            try toDoListRepository.create(record: ToDoNote(id: uuid!, title: "repo", desc: "abc", createdAt: Date(), isTaskCompleted: false))
        }
        catch {
            XCTAssertNotNil(error)
        }
        
    }
    
    func test_update_Note_Successfull() {
        let uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
        
        XCTAssertTrue(toDoListRepository.update(record: ToDoNote(id: uuid!, title: "test", desc: "abc", createdAt: Date(), isTaskCompleted: true)))
        
    }
    
    func testı_update_Note_failed() {
        let uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")
        XCTAssertFalse(toDoListRepository.update(record: ToDoNote(id: uuid!, title: "test", desc: "abc", createdAt: Date(), isTaskCompleted: true)))
        
    }
    
}
