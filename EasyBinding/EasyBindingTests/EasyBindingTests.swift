//
//  EasyBindingTests.swift
//  EasyBindingTests
//
//  Created by Carlos Mejía on 13/02/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import XCTest
@testable import EasyBinding

class EasyBindingTests: XCTestCase {
    private var testLabel = UILabel()
    private let textValue = Var("hello")
    private let textValueChangeExpectation = XCTestExpectation(description: "textValue")
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testValueListener() {
        let expectedValue = "bye!"
        
        textValue.listen { [weak self] _ in
            self?.textValueChangeExpectation.fulfill()
        }
        
        textValue.value = expectedValue
        
        wait(for: [textValueChangeExpectation], timeout: 0.5)
        
        XCTAssertEqual(textValue.value, expectedValue, "Listener not being called or value not changing!")
    }
}
