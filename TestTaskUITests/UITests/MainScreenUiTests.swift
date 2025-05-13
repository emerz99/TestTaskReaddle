//
//  MainScreenUiTests.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

final class MainScreenUiTests: BaseTestCase {
    
    
    func testLoginIntoAppWithCorrectCredentials() {
        LoginScreen().enterEmail("test@test.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        MainScreen().sortByNameButton.waitForExistence(timeout: 4)
    }
    
    func testLoginIntoAppWithIncorrectCredentials() {
        LoginScreen().enterEmail("testtest.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        LoginScreen().checkIfErrorMessageIsShown()
    }
    
    func testLogoutOnMainScreen() {
        MainScreen().tapLogoutButton()
        MainScreen().checkIfConfirmatioDialogIsShown()
        MainScreen().tapLogoutButtonInDialog()
        XCTAssertTrue(LoginScreen().loginInput.exists, "User isn't loged out from app")
    }
    
    func testCancelLogout() {
        MainScreen().tapLogoutButton()
        MainScreen().checkIfConfirmatioDialogIsShown()
        MainScreen().tapCancelButtonInDialog()
        XCTAssertTrue(MainScreen().sortByNameButton.exists, "The 'Cancel' button doesn't work")
    }
    
    func testTasksListIsDisplayed() {
        
    }
    
    func testCompleteAllTasks() throws {
       // need add
        }

    
    func testCheckaSingleTaskCanBeMarkedAsCompleted() {
        let task = XCUIApplication().cells.allElementsBoundByIndex[0]
        task.tap()
        let taskImage = XCUIApplication().images.allElementsBoundByIndex[0]
        XCTAssertEqual(taskImage.value as? String, "Selected")
    }
    
    func testAllTasksAreSelected() {
        let app = XCUIApplication()
        let tasks = app.cells.allElementsBoundByIndex

        for task in tasks {
            task.tap()
            
            let taskImage = app.images.allElementsBoundByIndex[tasks.firstIndex(of: task)!]
            
            XCTAssertEqual(taskImage.value as? String, "Selected")
        }
    }

    
    func testOpenSleepSubtasksScreenAndCheckIfListIsDisplayed() {
        MainScreen().tapMoreInfoButton()
    }
    
    
    
        func testSortTasksByName() throws {
            testLoginIntoAppWithCorrectCredentials()
            MainScreen().sortByNameButton.waitForExistence(timeout: 4)
            var sorted = false
            var attempts = 0
            let maxAttempts = 3
            
            while !sorted && attempts < maxAttempts {
                MainScreen().tapSortByName()
                let listTasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
                
                if listTasks == listTasks.sorted() {
                    sorted = true
                } else {
                    attempts += 1
                }
            }
            XCTAssertTrue(sorted, "List is still not sorted after \(maxAttempts) attempts")
        }
    
//    func testCompleteAllTasks() throws {
//        let app = XCUIApplication()
//        let completeAllButton = app.buttons["Complete All"]
//        var allCompleted = false
//        var attempts = 0
//        let maxAttempts = 3
//
////        while !allCompleted && attempts < maxAttempts {
////            completeAllButton.tap()
////
////            // перевіряємо, що всі чекбокси мають обраний стан (✓)
////            let allCheckboxes = app.cells.buttons.allElementsBoundByIndex
////            allCompleted = allCheckboxes.allSatisfy { $0.isSelected }
////
////            attempts += 1
////        }
//        while !allCompleted && attempts < maxAttempts {
//             completeAllButton.tap()
//
//             let allCells = app.cells.allElementsBoundByIndex
//             let allCheckboxesSelected = allCells.allSatisfy { cell in
//                 // шукаємо першу кнопку всередині клітинки — вона і є чекбокс
//                 let checkbox = cell.buttons.firstMatch
//                 return checkbox.isSelected
//             }
//
//             if allCheckboxesSelected {
//                 allCompleted = true
//             } else {
//                 attempts += 1
//             }
//         }
//        XCTAssertTrue(allCompleted, "Не всі задачі були відмічені як виконані після \(attempts) спроб")
//    }
    
 
    

}
