//
//  OrderUseCasesOrderUseCases.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public protocol OrderRepository {
    func placeOrder(for user: User, with items: [OrderItem]) -> Order
    func getOrderStatus(for orderId: String) -> OrderStatus
    func updateOrderStatus(_ status: OrderStatus, for orderId: String)
}

public class OrderInteractor: OrderUseCases {
    private let orderRepository: OrderRepository
    
    public init(orderRepository: OrderRepository) {
        self.orderRepository = orderRepository
    }
    
    public func placeOrder(for user: User, with items: [OrderItem]) -> Order {
        return orderRepository.placeOrder(for: user, with: items)
    }
    
    public func getOrderStatus(for orderId: String) -> OrderStatus {
        return orderRepository.getOrderStatus(for: orderId)
    }
    
    public func updateOrderStatus(_ status: OrderStatus, for orderId: String) {
        orderRepository.updateOrderStatus(status, for: orderId)
    }
}
