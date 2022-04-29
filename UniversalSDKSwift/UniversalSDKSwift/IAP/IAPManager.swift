//
//  IAPManager.swift
//  UniversalSDKSwift
//
//  Created by coolishbee on 2022/04/29.
//

import Foundation
import StoreKit

class IAPManager: NSObject {
    static let shared = IAPManager()
    fileprivate var skProducts = Array<SKProduct>()
    
    override init() {
        super.init()
        
        SKPaymentQueue.default().add(self)
    }
    
    private func canMakePayments() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    func setup(pidList: Array<String>) {
        let request = SKProductsRequest(productIdentifiers: Set(pidList))
        request.delegate = self
        request.start()
    }
    
    private func getSKProduct(productId: String) -> SKProduct? {
        for product in skProducts {
            if product.productIdentifier == productId {
                return product
            }
        }
        return nil
    }
    
    func purchase(productId: String) {
        if canMakePayments() {
            let skProduct = getSKProduct(productId: productId)
            guard skProduct != nil else {
                print("sku null")
                return
            }
            
            let payment = SKPayment(product: skProduct!)
            SKPaymentQueue.default().add(payment)
        }else{
            print("Сan't make purchases")
        }
    }
}

extension IAPManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest,
                         didReceive response: SKProductsResponse) {
        
        let count: Int = response.products.count
        if count > 0 {
            skProducts = response.products
            for product in response.products {
                //let validProduct: SKProduct = response.products[0]
                print(product.localizedTitle)
                print(product.localizedDescription)
                print(product.price)
            }
        }
        else {
            print("No products")
        }
    }
    
    func request(_ request: SKRequest,
                 didFailWithError error: Error) {
        print("Failed to load list of products.")
        print("Error: \(error.localizedDescription)")
    }
}

extension IAPManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue,
                      updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            let productId = transaction.payment.productIdentifier
            switch transaction.transactionState {
            case .restored: fallthrough
            case .purchased:
                print("Product Purchased")
                
                queue.finishTransaction(transaction)
                break
            case .failed:
                print("Purchased Failed")
                queue.finishTransaction(transaction)
                break
            case .purchasing:
                print("Purchasing \(productId)...")
                break
            default:
                break
            }
        }
    }
}
