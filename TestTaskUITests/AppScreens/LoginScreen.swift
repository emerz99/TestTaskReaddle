//
//  LoginScreen.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class LoginScreen {
    let loginInput = XCUIApplication().textFields["Email"].firstMatch
    let passwordInput = XCUIApplication().secureTextFields["Password"].firstMatch
    let loginButton = XCUIApplication().buttons["Login"].firstMatch
    let errorMessage = XCUIApplication().staticTexts["Incorrect login or password format"]

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
    
}
