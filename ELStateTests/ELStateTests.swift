//
//  ELStateTests.swift
//  ELStateTests
//
//  Created by Brandon Sneed on 3/26/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import XCTest
@testable import ELState

struct blah {
    let v: Int
}

class ELStateTests: XCTestCase, Subscriber {
    
    //let store = Store(MyState())
    var state = State()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //store.subscribe(self)
        
        let b = blah(v: 22)
        
        state.setValue(b, forKey: "blah")
    }
    
    override func tearDown() {
        //store.unsubscribe(self)

        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func newState(state: State) {
        //
        //state.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
