//
//  BaseTestCase.swift
//  Tasks
//
//  Created by Ella Merzanych on 12.05.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest
import Foundation

class BaseTestCase : XCTestCase {
    
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.terminate()
        app.launchArguments.append("--ui-test-reset")
        app.launch()
      //  resetAppState()
    }

    override func tearDown() {
        let app = XCUIApplication()
        super.tearDown()
      //  resetAppState()
        app.terminate()
    }

    
    func resetAppState() {
        if XCUIApplication().buttons["Logout"].exists {
      //      XCUIApplication().buttons["Cancel"].tap()
        }
    }
    
//    // Function to perform login
//    func login(username: String, password: String) {
//        let loginScreen = LoginScreen(app: XCUIApplication())
//        loginScreen.login(username: username, password: password)
//    }
//
//    // Function to log out
//    func logout() {
//        let taskListScreen = TaskListScreen(app: XCUIApplication())
//        taskListScreen.logout()
//    }
    }




