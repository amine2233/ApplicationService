//
//  TestDependency.swift
//  ApplicationServiceTests
//
//  Created by BENSALA on 19/10/2018.
//  Copyright © 2018 BENSALA. All rights reserved.
//

import Foundation
@testable import ApplicationService

class TestDependency: CoreDependency {
    
    override func resolveWorker() -> AuthenticationWorkerType {
        return AuthenticationTestService()
    }
}

struct AuthenticationTestService: AuthenticationWorkerType {
    
    var isRequested: Bool {
        return true
    }
    
    public func signup(with request: Any, completion: @escaping () -> Void) {
        print("AuthenticationTestService.signup")
    }
    
    public func login(with request: Any, completion: @escaping () -> Void) {
        print("AuthenticationTestService.login")
    }
    
    public func logout() {
        
    }
}
