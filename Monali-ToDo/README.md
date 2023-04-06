
#"To-do" App

Created three screens:
* 1) List of Added notes
* 2) Note Detail (click on table cell in Notes list screen, redirect to Detail screen and display detail information)
* 3) Add Note (click on + button in Notes list screen, redirect to Add note screen)

* Notes list screen mark completed button is there to make that particular task completed

* Used CoreData for the local storage

* Used MVC Hence its small application thats why used MVC Architecture
* Used ReposiTory design pattern for Coredata 
  * Used Repository design to achive Clean Abstraction and Decoupled design
    * Viewcontroller -> Manager.swift -> DataRepository.swift -> PersistanceStorage.swift
* Followed Solid Principle and Dependency injection
* Wrote Testcases    

