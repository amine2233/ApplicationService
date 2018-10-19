//
//  Dependency.swift
//  ApplicationService
//
//  Created by BENSALA on 19/10/2018.
//  Copyright © 2018 BENSALA. All rights reserved.
//
// http://basememara.com/swift-protocol-oriented-dependency-injection/
//

import Foundation

public protocol HTTPServiceType {}

public struct HTTPService: HTTPServiceType {
}

///

public protocol AuthenticationService {}

public struct AuthenticationNetworkService: AuthenticationService {
    private let httpService: HTTPServiceType
    
    public init(httpService: HTTPServiceType) {
        self.httpService = httpService
    }
}

///

public protocol AuthenticationWorkerType {
    func signup(with request: Any, completion: @escaping () -> Void)
    func login(with request: Any, completion: @escaping () -> Void)
    func logout()
}

public struct AuthenticationWorker: AuthenticationWorkerType {
    private let service: AuthenticationService
    
    public init(service: AuthenticationService) {
        self.service = service
    }
    
    public func signup(with request: Any, completion: @escaping () -> Void) {}
    
    public func login(with request: Any, completion: @escaping () -> Void) {}
    
    public func logout() {}
    
}

public protocol Dependency {
    func resolveService() -> HTTPServiceType
    func resolveAuthenticationService() -> AuthenticationService
    func resolveWorker() -> AuthenticationWorkerType
}

public class CoreDependency: Dependency {
    public func resolveService() -> HTTPServiceType {
        return HTTPService()
    }
    
    public func resolveAuthenticationService() -> AuthenticationService {
        return AuthenticationNetworkService(httpService: self.resolveService())
    }
    
    public func resolveWorker() -> AuthenticationWorkerType {
        return AuthenticationWorker(service: self.resolveAuthenticationService())
    }
}

/// The singleton dependency container reference
/// which can be reassigned to another container
struct DependencyInjector {
    static var dependencies: Dependency = CoreDependency()
}

/// Attach to any type for exposing the dependency container
protocol HasDependencies {
    var dependencies: Dependency { get }
}

extension HasDependencies {
    /// Container for dependency instance factories
    var dependencies: Dependency {
        return DependencyInjector.dependencies
    }
}
