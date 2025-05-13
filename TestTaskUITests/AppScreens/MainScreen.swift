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
    let sortedTasks = XCUIApplication().cells.staticTexts.allElementsBoundByIndex.map { $0.label }
        
    func tapSortByName() {
        sortByNameButton.tap()
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
}
