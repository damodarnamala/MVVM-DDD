//
//  Payment.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public struct Payment {
    public let id: String
    public let order: Order
    public let amount: Double
    public let status: PaymentStatus
    public init(id: String, order: Order, amount: Double, status: PaymentStatus) {
        self.id = id
        self.order = order
        self.amount = amount
        self.status = status
    }
}

public enum PaymentStatus: String {
    case pending
    case completed
    case failed

}
