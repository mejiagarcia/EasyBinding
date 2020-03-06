//
//  HelpersTests.swift
//  EasyBindingTests
//
//  Created by Carlos Mejía on 5/03/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import XCTest
@testable import EasyBinding

class HelpersTests: XCTestCase {
    let testArray = [1, 2, 3, 4, 5]
    
    var testView: UIView?
    
    override func setUp() {
        testView = UIView()
    }

    override func tearDown() {
        testView = nil
    }
    
    func testSafePositionFail() {
        XCTAssertNil(testArray.safePosition(10), "SafePosition method is given an un expected result.")
    }
    
    func testSafePositionAssert() {
        XCTAssertEqual(testArray.safePosition(0), 1, "SafePosition method is given an un expected result.")
    }
    
    func testVisibilityAttribute() {
        testView?.isHidden = true
        
        Helpers.toggleViewVisibility(view: testView, state: false)
        
        XCTAssert(testView?.isHidden == false, "Test view is not changing the visibility state!")
    }
    
    func testWorngVisibilityAttribute() {
        testView?.isHidden = true
        
        Helpers.toggleViewVisibility(view: testView, state: 1)
        
        XCTAssert(testView?.isHidden == true, "Test view is changing with invalid arguments!")
    }
}
