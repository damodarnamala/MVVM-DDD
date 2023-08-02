//
//  MockOrderRepository.swift
//  CoreTests
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

// MockMenuRepository.swift
public class MockMenuRepository: MenuRepository {
    
    private var menuItems: [MenuItem] = []
    
    public init() { }
    
    public func fetchMenuItems(for category: MenuCategory) -> [MenuItem] {
        return menuItems.filter { $0.category == category }
    }
    
    public func addMenuItem(_ item: MenuItem, to category: MenuCategory) {
        menuItems.append(item)
    }
    
    public func updateMenuItem(_ item: MenuItem) {
        if let index = menuItems.firstIndex(where: { $0.id == item.id }) {
            menuItems[index] = item
        }
    }
    
    public func deleteMenuItem(_ id: String) {
        self.menuItems = self.menuItems.filter({$0.id != id})
    }
    
    public func fetchAllMenuItems() -> [MenuItem] {
        self.menuItems
    }
}

// MockOrderRepository.swift
public class MockOrderRepository: OrderRepository {
    private var orders: [Order] = []
    
    public init() { }
    
    public func placeOrder(for user: User, with items: [OrderItem]) -> Order {
        let orderId = UUID().uuidString
        let order = Order(orderId: orderId, user: user, orderItems: items, orderStatus: .pending)
        orders.append(order)
        return order
    }
    
    public func getOrderStatus(for orderId: String) -> OrderStatus {
        guard let order = orders.first(where: { $0.orderId == orderId }) else {
            return .cancelled
        }
        return order.orderStatus
    }
    
    public func updateOrderStatus(_ status: OrderStatus, for orderId: String) {
        guard var order = orders.first(where: { $0.orderId == orderId }) else {
            return
        }
        order.orderStatus = status
    }
}

// MockPaymentRepository.swift
public class MockPaymentRepository: PaymentRepository {
    private var payments: [Payment] = []
    public init() { }
    public func processPayment(for order: Order, amount: Double) -> Payment {
        let paymentId = UUID().uuidString
        let payment = Payment(id: paymentId, order: order, amount: amount, status: .completed)
        payments.append(payment)
        return payment
    }
    
    public func getPaymentStatus(for paymentId: String) -> PaymentStatus {
        guard let payment = payments.first(where: { $0.id == paymentId }) else {
            return .failed
        }
        return payment.status
    }
}
