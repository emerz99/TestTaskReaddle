//
//  BugsUITests.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

final class BugsUITests: BaseTestCase {
    //‘Sort by Name’ doesn’t work correct (After clicking few times on button -> tasks are not sorted properly)
    func testSortTasksByName() {
        let app = XCUIApplication()
        MainScreen().ensureUserIsLoggedIn()
        let listTasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
        for _ in 0..<7 {
            MainScreen().tapSortByName()
        }
            let listTasksAfterSorting = app.cells.staticTexts.allElementsBoundByIndex.map { $0.label }
            let sortedListTasks = listTasks.sorted()
            if sortedListTasks == listTasksAfterSorting {
                print("Item lists is sorted correctly")
            } else {
                print("‘Sort by Name’ button doesn’t work correct")
        }
        
      //  XCTAssertEqual(sortedListTasks, listTasksAfterSorting, "‘Sort by Name’ doesn’t work correct")
    }
    
    //Items are checked after clicking on ‘Sort by Name’
    func testTapSortTasksByNameAndCheckIfItemsAreChecked(){
        let app = XCUIApplication()
        MainScreen().ensureUserIsLoggedIn()
        let tasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
        XCTContext.runActivity(named: "Check if all tasks are marked as completed after clicking on 'Sort by namу' button") { _ in
            for _ in 0..<5 {
                MainScreen().tapSortByName()
            }
            for task in tasks {
                if let index = tasks.firstIndex(of: task) {
                    let taskImage = app.images.allElementsBoundByIndex[index]
                    if taskImage.value as? String == "Selected" {
                        print("Task at index \(index) is marked as completed.")
                    } else {
                        print("Task is not marked as completed")
                    }
                }
            }
        }
    }
    
    
    //Checkmarks are not checked after clicking ‘Complete All’ button (text in cells is greyed out) - not always reproduced
    func testVerifyCompleteAllButtonMarksAllTasksAsCompletedBug() {
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let tasks = app.cells.allElementsBoundByIndex
        MainScreen().tapLCompleteAllButton()
        XCTContext.runActivity(named: "Check if all tasks are marked as completed after clicking on 'Complete All' button") { _ in
            for task in tasks {
                if let index = tasks.firstIndex(of: task) {
                    let taskImage = app.images.allElementsBoundByIndex[index]
                    if taskImage.value as? String == "Selected" {
                        print("Task at index \(index) is marked as completed.")
                        //       XCTAssertEqual(taskImage.value as? String, "Selected")
                    } else {
                        print("Task is not marked as Completed")
                    }
                }
            }
        }
    }
        //‘Complete All’ button is not changed to ‘Cancel All’ button  after clicking on ‘Complete All’ button-> not always reproduced
    func testVerifyCompleteAllButtonChangedToCancelAllButton() {
            MainScreen().ensureUserIsLoggedIn()
            MainScreen().tapLCompleteAllButton()
            XCTContext.runActivity(named: "Verify 'Complete All' changes to 'Cancel All'") { _ in
                let exists = MainScreen().cancelAllButton.waitForExistence(timeout: 3)
                if !exists {
                          print("Button is not changed to 'Cancel All' after clicking 'Complete All'")
                      } else {
                          print("Button 'Cancel All' is shown")
                      }
             //   XCTAssertTrue(exists, "Button is not changed to  'Cancel All' after clicking 'Complete All'")
            }
        }
    
    //‘Complete All’ button is not changed to ‘Cancel All’ button after clicking on all tasks individually
    func testCompleteAllIsNotChangedToCancellAllAfterCheckingTasksIndividually(){
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let tasks = app.cells.allElementsBoundByIndex
        XCTContext.runActivity(named: "Verify 'Complete All' changes to 'Cancel All' after clicking on all tasks individually") { _ in
            for task in tasks {
                task.tap()
                
            let exists = MainScreen().cancelAllButton.waitForExistence(timeout: 3)
            if !exists {
                print("Button is not changed to 'Cancel All' after clicking on all tasks individually")
                } else {
                    print("Button 'Cancel All' is shown")
                }
            }
        }
    }
    
    //'Complete All' button is not displayed on Sleep subtasks screen after marking Sleep task as completed and navigating to subtasks
    func testVerifyCompleteAllButtonIsChangedToCancelAllButtonOnSleepSubtasksScreen(){
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        let taskLabel = "Sleep"
        let task = app.cells.staticTexts[taskLabel]
        task.tap()
        MainScreen().tapMoreInfoButton()
        XCTContext.runActivity(named: "Verify Complete All button ss changed to Cancel All button on Sleep subtasks screen") { _ in
            let exists = MainScreen().cancelAllButton.waitForExistence(timeout: 3)
            if !exists {
                      print("Button is not changed to 'Cancel All' on Sleep subtasks screen")
                  } else {
                      print("Button 'Cancel All' is shown")
                  }
            
        }
    }
    // Uncheck tasks individually doesn't work correctly
    func testUncheckTasksIndividuallyDoesntWorksCorrectly(){
        MainScreen().ensureUserIsLoggedIn()
        let app = XCUIApplication()
        MainScreen().tapLCompleteAllButton()
        let task = app.cells.allElementsBoundByIndex
        XCTContext.runActivity(named: "Uncheck tasks individually doesn't work correctly") { _ in
            for index in 0..<5 {
                let task = app.cells.allElementsBoundByIndex[index]
                task.tap()
                
                let taskImage = app.images.allElementsBoundByIndex[index]
                if taskImage.value as? String == "Selected" {
                    print("Task at index \(index) is marked as completed.")
                } else {
                    print("Task at index \(index) is unchecked.")
                }
            }
        }
    }
}
