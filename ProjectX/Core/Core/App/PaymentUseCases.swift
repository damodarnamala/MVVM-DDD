//
//  PaymentUseCases.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public protocol PaymentUseCases {
    func processPayment(for order: Order, amount: Double) -> Payment
    func getPaymentStatus(for paymentId: String) -> PaymentStatus
}
