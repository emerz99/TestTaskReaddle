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
      //  app.launchArguments.append("--ui-test-reset")
        app.launch()
    }

    override func tearDown() {
        let app = XCUIApplication()
        super.tearDown()
        app.terminate()
    }
    }




