//
//  UITests.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

final class UITests: BaseTestCase {
    
    //Perform login with correct login&password
    func testLoginIntoAppWithCorrectCredentials() {
        MainScreen().ensureUserIsNotLoggedIn()
        LoginScreen().enterEmail("test@test.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        LoginScreen().tapRetryButtonIfAvailable()
        MainScreen().checkIfLogoutButtonIsShown()
    }
    //Perform login with incorrect login
    func testLoginIntoAppWithIncorrectCredentials() {
        MainScreen().ensureUserIsNotLoggedIn()
        LoginScreen().enterEmail("testtest.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        LoginScreen().checkIfErrorMessageIsShown()
    }
    
    func testLogoutOnMainScreen() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLogoutButton()
        MainScreen().checkIfConfirmatioDialogIsShown()
        MainScreen().tapLogoutButtonInDialog()
        XCTAssertTrue(LoginScreen().loginInput.exists, "User isn't loged out from app")
    }
    
    func testCancelLogout() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLogoutButton()
        MainScreen().checkIfConfirmatioDialogIsShown()
        MainScreen().tapCancelButtonInDialog()
        XCTAssertTrue(MainScreen().sortByNameButton.exists, "The 'Cancel' button doesn't work")
    }
    //Verify all tasks are displayed in the task list
    func testTasksListIsDisplayed() {
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let tasks = app.cells.staticTexts.allElementsBoundByIndex
        let expectedTasks = ["Buy milk", "Pay rent", "Change tires", "Sleep", "Dance"]
        let actualTasks = tasks.map { $0.label }
        XCTAssertEqual(actualTasks, expectedTasks, "The task lists do not match.")
    }
    
    //Verify a single task can be marked as completed
    func testCheckASingleTaskCanBeMarkedAsCompleted() {
        MainScreen().ensureUserIsLoggedIn()
        let task = XCUIApplication().cells.allElementsBoundByIndex[0]
        task.tap()
        let taskImage = XCUIApplication().images.allElementsBoundByIndex[0]
        XCTAssertEqual(taskImage.value as? String, "Selected")
    }
    //Verify complete all tasks by taping on each task individually in list
    func testAllTasksAreSelected() {
            MainScreen().ensureUserIsLoggedIn()
            let app = XCUIApplication()
            let tasks = app.cells.allElementsBoundByIndex
            
            for task in tasks {
                task.tap()
                
                if let index = tasks.firstIndex(of: task) {
                    let taskImage = app.images.allElementsBoundByIndex[index]
                    XCTAssertEqual(taskImage.value as? String, "Selected")
                } else {
                    XCTFail("Tasks are not marked as Completed")
                }
            }
     }
    
    //Verify "Complete All" button marks all tasks as completed
    func testVerifyCompleteAllButtonMarksAllTasksAsCompleted() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLCompleteAllButton()
        MainScreen().verifyAllTasksAreSelected()
    }
    //Verify 'Complete All' button is changed to 'Cancel All'
    func testCompleteAllButtonIsChangedToCancelAll() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLCompleteAllButton()
        MainScreen().checkIfCancelAllButtonIsShown()
    }
    
    //Verify "Cancel All" button unchecks all task as completed
    func testVerifyCancelAllButtonUncheksAllTaskAsCompleted() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLCompleteAllButton()
        MainScreen().tapLCancelAllButton()
        MainScreen().verifyAllTasksAreNotSelected()
    }
    
    //Verify list of subtasks are displayed when viewing task details (Verify that when the info button on the "Sleep" task is clicked, additional task details are displayed)
    func testOpenSleepSubtasksScreenAndCheckIfListIsDisplayed() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapMoreInfoButton()
        let app = XCUIApplication()
        let subtasks = app.cells.staticTexts.allElementsBoundByIndex
        let expectedSubtasks = ["Find a bed", "Lie down", "Close eyes", "Wait"]
        let actualSubtasks = subtasks.map { $0.label }
        XCTAssertEqual(actualSubtasks, expectedSubtasks, "The subtask lists do not match.")
    }
    //Verify "Sort by Name" button sorts tasks alphabetically
//    func testSortTasksByName() throws {
//        var sorted = false
//        var attempts = 0
//        let maxAttempts = 3
//        
//        while !sorted && attempts < maxAttempts {
//            MainScreen().tapSortByName()
//            let listTasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
//            
//            if listTasks == listTasks.sorted() {
//                sorted = true
//            } else {
//                attempts += 1
//            }
//        }
//        XCTAssertTrue(sorted, "List is still not sorted after \(maxAttempts) attempts")
//    }
    //Verify "Sort by Name" button sorts tasks alphabetically
    func testSortTasksByName() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapSortByName()
        let app = XCUIApplication()
        let tasks = app.cells.staticTexts.allElementsBoundByIndex
        let actualTasks = tasks.map { $0.label }
        let expectedTasks = actualTasks.sorted()
        XCTAssertEqual(actualTasks, expectedTasks, "The task lists do not match.")
    }
    
    //Verify subtasks can be marked as completed
    func testVerifySubtasksCanBeMarkedAsCompleted() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapMoreInfoButton()
        MainScreen().tapLCompleteAllButton()
        MainScreen().verifyAllSubtasksAreSelected()
        MainScreen().checkIfCancelAllButtonIsShown()
    }
    //Verify subtasks can be sorted
//    func testVerifySubtasksCanBeSorted() {
//        MainScreen().ensureUserIsLoggedIn()
//        MainScreen().tapMoreInfoButton()
//        var sorted = false
//        var attempts = 0
//        let maxAttempts = 3
//        
//        while !sorted && attempts < maxAttempts {
//            MainScreen().tapSortByName()
//            let listSubtasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
//            
//            if listSubtasks == listSubtasks.sorted() {
//                sorted = true
//            } else {
//                attempts += 1
//            }
//        }
//        XCTAssertTrue(sorted, "List is still not sorted after \(maxAttempts) attempts")
//    }
    func testSortSubtasksByName() {
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapMoreInfoButton()
        MainScreen().tapSortByName()
        let app = XCUIApplication()
        let subtasks = app.cells.staticTexts.allElementsBoundByIndex
        let actualSubtasks = subtasks.map { $0.label }
        let expectedSubtasks = actualSubtasks.sorted()
        XCTAssertEqual(actualSubtasks, expectedSubtasks, "The subtask lists do not match.")
    }

    
    //- Verify if subtasks are marked as completed if 'mark as completed' Sleep task on main screen
    func testSubtasksAreMarkedAsCompletedIfMarkSleepTaskAsCompleted() {
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let taskLabel = "Sleep"
        let task = app.cells.staticTexts[taskLabel]
        task.tap()
        MainScreen().tapMoreInfoButton()
        MainScreen().verifyAllSubtasksAreSelected()
    }
    
    // Verify if 'Sleep' task is marked as completed if 'mark as completed' all subtasks
     func testCompleteAllSubtasksAndCheckIfSleepTaskIsCompleted(){
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let taskLabel = "Sleep"
        let tasks = app.cells.staticTexts.allElementsBoundByIndex
        MainScreen().tapMoreInfoButton()
        MainScreen().tapLCompleteAllButton()
        MainScreen().verifyAllSubtasksAreSelected()
        MainScreen().tapBackButton()
        var taskIndex: Int? = nil
        for (index, task) in tasks.enumerated() {
            if task.label == taskLabel {
                taskIndex = index
                break
            }
        }
        if let index = taskIndex {
            let taskImage = app.images.allElementsBoundByIndex[index]
            XCTAssertEqual(taskImage.value as? String, "Selected", "Checkbox for task '\(taskLabel)' is not marked as completed")
        }
        else {
            XCTFail("Item with label'\(taskLabel)' is not found")
        }
    }
    
    //- Verify if uncheck 'completed' subtask (e.g. 'Wait') -> Main task is also uncheked (Precondition: Sleep task and all subtasks are checked)
//        func testUncheckAnySubtaskAndCheckIfSleepTaskIsUnchecked(){
//            let app = XCUIApplication()
//            let taskLabel = "Sleep"
//            let task = app.cells.staticTexts[taskLabel]
//            task.tap()
//            MainScreen().tapMoreInfoButton()
//            let subtasks = app.cells.allElementsBoundByIndex
//            for subtask in subtasks {
//                if let index = subtasks.firstIndex(of: subtask) {
//                    let subtaskImage = app.images.allElementsBoundByIndex[index]
//                    XCTAssertEqual(subtaskImage.value as? String, "Selected")
//                } else {
//                    XCTFail("Complete All doesn't work")
//                }
//            }
//    
//            let subtaskLabel = "Wait"
//            let subtask = app.cells.staticTexts[subtaskLabel]
//            subtask.tap()
//            var subtaskIndex: Int? = nil
//            for (index, subtask) in subtasks.enumerated() {
//                if subtask.label == subtaskLabel {
//                    subtaskIndex = index
//                    break
//                }
//            }
//            if let index = subtaskIndex {
//                let subtaskImage = app.images.allElementsBoundByIndex[index]
//                XCTAssertEqual(subtaskImage.value as? String, "Not selected", "Checkbox for task 'Wait' is not unchecked")
//            }
//            else {
//                XCTFail("Item with label 'Wait' is not found")
//            }
//            
//            MainScreen().tapBackButton()
//            let taskImage = XCUIApplication().images.allElementsBoundByIndex.first { $0.label == taskLabel }
//         //   XCTAssertEqual(taskImage.value as? String, "Not selected")
//        }
  
    
        
        //Verify that tasks and subtasks are not unchecked while navigating between screens
    func testCheckTasksAndSubtaskAreNotUncheckedWhileNavigationBetweenScreens(){
        MainScreen().ensureUserIsLoggedIn()
        MainScreen().tapLCompleteAllButton()
        MainScreen().verifyAllTasksAreSelected()
        MainScreen().tapMoreInfoButton()
        MainScreen().verifyAllSubtasksAreSelected()
        MainScreen().tapBackButton()
        MainScreen().verifyAllTasksAreSelected()
        MainScreen().tapMoreInfoButton()
        MainScreen().verifyAllSubtasksAreSelected()
    }
}

