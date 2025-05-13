//
//  LoginUITests.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

final class LoginUITests: BaseTestCase {
    
//    override func setUp() {
//        super.setUp()
//        let app = XCUIApplication()
//        app.launch()
//    }
//    
//    override func tearDown()
//    {
//        let app = XCUIApplication()
//        app.terminate()
//        super.tearDown()
//    }
    
    func testLoginIntoAppWithCorrectCredentials() {
        LoginScreen().enterEmail("test@test.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        
    }
    
    func testLoginIntoAppWithIncorrectCredentials() {
        LoginScreen().enterEmail("testtest.com")
        LoginScreen().enterPassword("test")
        LoginScreen().tapLogin()
        LoginScreen().checkIfErrorMessageIsShown()
    }
    
}
