//
//  Order.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public struct Order {
    public let orderId: String
    public let user: User
    public var orderItems: [OrderItem]
    public var orderStatus: OrderStatus
    
    public init(orderId: String, user: User, orderItems: [OrderItem], orderStatus: OrderStatus) {
        self.orderId = orderId
        self.user = user
        self.orderItems = orderItems
        self.orderStatus = orderStatus
    }
}

public struct OrderItem {
    public let menuItem: MenuItem
    public let quantity: Int
    public init(menuItem: MenuItem, quantity: Int) {
        self.menuItem = menuItem
        self.quantity = quantity
    }
}

public enum OrderStatus: String {
    case pending
    case inProgress
    case completed
    case cancelled
}
