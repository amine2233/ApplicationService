//
//  ApplicationServiceTests.swift
//  ApplicationServiceTests
//
//  Created by BENSALA on 19/10/2018.
//  Copyright © 2018 BENSALA. All rights reserved.
//

import XCTest
@testable import ApplicationService

class ApplicationServiceTests: XCTestCase, HasDependencies {

    private lazy var authenticationWorker: AuthenticationWorkerType = dependencies.resolveWorker()
    
    override func setUp() {
        super.setUp()
        
        DependencyInjector.dependencies = TestDependency()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

extension ApplicationServiceTests {
    func testAuthenticationExemple() {
        authenticationWorker.signup(with: "whatever") {
            XCTAssertTrue(true)
        }
    }
}
