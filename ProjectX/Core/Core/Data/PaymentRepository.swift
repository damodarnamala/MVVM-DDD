//
//  PaymentRepository.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
public protocol PaymentRepository {
    func processPayment(for order: Order, amount: Double) -> Payment
    func getPaymentStatus(for paymentId: String) -> PaymentStatus
}

public class PaymentInteractor: PaymentUseCases {
    private let paymentRepository: PaymentRepository
    
    public init(paymentRepository: PaymentRepository) {
        self.paymentRepository = paymentRepository
    }
    
    public func processPayment(for order: Order, amount: Double) -> Payment {
        return paymentRepository.processPayment(for: order, amount: amount)
    }
    
    public func getPaymentStatus(for paymentId: String) -> PaymentStatus {
        return paymentRepository.getPaymentStatus(for: paymentId)
    }
}
