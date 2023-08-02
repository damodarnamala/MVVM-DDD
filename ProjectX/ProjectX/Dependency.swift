//
//  Dependency.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
import Core
// DependencyContainer.swift
class DependencyContainer {
    static let shared = DependencyContainer()
    
    private var singletons: [ObjectIdentifier: Any] = [:]
    
    private init() {
        // Register dependencies for each module
        registerMenuModule()
        registerIdentityModule()
        registerOrderModule()
        registerPaymentModule()
    }
    
    func resolve<T>() -> T {
        guard let factory = singletons[ObjectIdentifier(T.self)] as? () -> T else {
            fatalError("Unregistered dependency: \(T.self)")
        }
        return factory()
    }
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        singletons[ObjectIdentifier(T.self)] = factory
    }
    
    // Menu Module
    func registerMenuModule() {
        register(MenuRepository.self) { MockMenuRepository() }
        register(MenuUseCases.self) {
            MenuInteractor(menuRepository: self.resolve())
        }
    }
    
    // Identity Module
    func registerIdentityModule() {
        register(IdentityRepository.self) { IdentityDataRepository() }
        register(IdentityUseCases.self) {
            IdentityInteractor(identityRepository: self.resolve())
        }
    }
    
    // Order Module
    func registerOrderModule() {
        register(OrderRepository.self) { MockOrderRepository() }
        register(OrderUseCases.self) {
            OrderInteractor(orderRepository: self.resolve())
        }
    }
    
    // Payment Module
    func registerPaymentModule() {
        register(PaymentRepository.self) { MockPaymentRepository() }
        register(PaymentUseCases.self) {
            PaymentInteractor(paymentRepository: self.resolve())
        }
    }
}
