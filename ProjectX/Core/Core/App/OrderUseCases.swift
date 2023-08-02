//
//  OrderUseCases.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
public protocol OrderUseCases {
    func placeOrder(for user: User, with items: [OrderItem]) -> Order
    func getOrderStatus(for orderId: String) -> OrderStatus
    func updateOrderStatus(_ status: OrderStatus, for orderId: String)
}

