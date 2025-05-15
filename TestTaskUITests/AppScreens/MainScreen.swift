//
//  MainScreen.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class MainScreen {
    let logoutButton = XCUIApplication().buttons["Logout"].firstMatch
    let completeAllButton = XCUIApplication().buttons["Complete All"].firstMatch
    let cancelAllButton = XCUIApplication().buttons["Cancel All"].firstMatch
    let sortByNameButton = XCUIApplication().buttons["Sort by Name"].firstMatch
    let moreInfoButton = XCUIApplication().buttons["More Info"].firstMatch
    let confirmationDialog = XCUIApplication().staticTexts["Do you really want to logout?"]
    let cancelButton = XCUIApplication().buttons["Cancel"].firstMatch
    let backButton = XCUIApplication().buttons["Tasks"].firstMatch
    let loginInput = XCUIApplication().textFields["Email"].firstMatch
    let passwordInput = XCUIApplication().secureTextFields["Password"].firstMatch
    let loginButton = XCUIApplication().buttons["Login"].firstMatch
    let errorMessage = XCUIApplication().staticTexts["Incorrect login or password format"]
    
    func tapSortByName() {
        sortByNameButton.tap()
    }
    
    func tapBackButton() {
        backButton.tap()
    }
    
    func tapMoreInfoButton() {
        moreInfoButton.tap()
    }
    
    func tapLogoutButton() {
        logoutButton.tap()
    }
    
    func checkIfConfirmatioDialogIsShown() {
        XCTAssertTrue(confirmationDialog.exists, "The logout confirmation dialog is not shown.")
    }
    
    func tapLogoutButtonInDialog() {
        let logoutButtonInDialog = XCUIApplication().buttons.matching(identifier: "Logout").element(boundBy: 1)
        XCTAssertTrue(logoutButtonInDialog.exists, "The 'Logout' button inside the confirmation dialog does not exist.")
        logoutButtonInDialog.tap()
    }
    
    func tapCancelButtonInDialog() {
        XCTAssertTrue(cancelButton.exists, "The 'Cancel' button inside the confirmation dialog does not exist.")
        cancelButton.tap()
    }
    
    func tapLCompleteAllButton() {
        completeAllButton.tap()
    }
    
    func checkIfCancelAllButtonIsShown() {
        XCTAssertTrue(cancelAllButton.exists, "The 'Complete All' button isn't changed to 'Cancel All' button")
    }
    
    func tapLCancelAllButton() {
        cancelAllButton.tap()
    }
    
    func checkIfLogoutButtonIsShown() {
        loginButton.waitForExistence(timeout: 5)
        XCTAssertTrue(logoutButton.exists, "The 'Logout; button is not shown on screen")
    }
    
    func enterEmail(_ email: String) {
        XCTAssertTrue(loginInput.exists)
        loginInput.tap()
        loginInput.typeText(email)
    }
    
    func enterPassword(_ password: String) {
        XCTAssertTrue(passwordInput.exists)
        passwordInput.tap()
        passwordInput.typeText(password)
    }
    
    func tapLogin() {
        XCUIApplication().keyboards.buttons["Return"].tap()
        loginButton.waitForExistence(timeout: 2)
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
    }
    
    func checkIfErrorMessageIsShown() {
        XCTAssertTrue(errorMessage.exists, "Error message is not shown")
    }
    
    func ensureUserIsLoggedIn() {
        if logoutButton.exists {
            // Якщо кнопка Logout існує, користувач вже залогінений, продовжуємо тест
            print("User is logged in")
        } else {
            print("User isn't logged in")
            
            loginInput.tap()
            loginInput.typeText("test@test.com")
            passwordInput.tap()
            passwordInput.typeText("test")
            tapLogin()
            LoginScreen().tapRetryButtonIfAvailable()
            logoutButton.waitForExistence(timeout: 3)
            XCTAssertTrue(logoutButton.exists, "User couldn't log in")
        }
    }
    
    func ensureUserIsNotLoggedIn() {
        if loginButton.exists {
            print("User is not logged in")
        } else {
            print("User is logged in")
            
            MainScreen().tapLogoutButton()
            MainScreen().checkIfConfirmatioDialogIsShown()
            MainScreen().tapLogoutButtonInDialog()
            
            loginButton.waitForExistence(timeout: 3)
            XCTAssertTrue(loginButton.exists, "User couldn't log out")
        }
    }
    
    func retryTest(_ test: () -> Bool, retries: Int = 3) {
        var attempts = 0
        while attempts < retries {
            if test() {
                return // Test passed, no need to retry
            }
            attempts += 1
        }
        XCTFail("Test failed after \(retries) attempts")
    }
    
    func verifyAllSubtasksAreSelected(){
        let app = XCUIApplication()
        let subtasks = app.cells.allElementsBoundByIndex
        for subtask in subtasks {
            if let index = subtasks.firstIndex(of: subtask) {
                let subtaskImage = app.images.allElementsBoundByIndex[index]
                XCTAssertEqual(subtaskImage.value as? String, "Selected")
            } else {
                XCTFail("Subtask is not found in list")
            }
        }
    }
    func verifyAllTasksAreSelected(){
        let app = XCUIApplication()
        let tasks = app.cells.allElementsBoundByIndex
        for task in tasks {
            if let index = tasks.firstIndex(of: task) {
                let taskImage = app.images.allElementsBoundByIndex[index]
                XCTAssertEqual(taskImage.value as? String, "Selected")
            } else {
                XCTFail("Task is not found in list")
            }
        }
    }
    
    func verifyAllTasksAreNotSelected(){
        let app = XCUIApplication()
        let tasks = app.cells.allElementsBoundByIndex
        for task in tasks {
            if let index = tasks.firstIndex(of: task) {
                let taskImage = app.images.allElementsBoundByIndex[index]
                XCTAssertEqual(taskImage.value as? String, "Not selected")
            } else {
                XCTFail("Task is not found in list")
            }
        }
    }
    
}
