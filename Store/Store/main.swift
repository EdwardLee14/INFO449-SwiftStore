//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    var name: String
    var cost: Int
    func price() -> Int {
        return cost
    }
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.cost = priceEach
    }
}

class Receipt {
    var itemList: [SKU] = []
    func items() -> [SKU]{
        return itemList
    }
    
    func output() -> String {
        var receiptString = "Receipt:\n"
        
        for item in itemList {
            let dollars = item.price() / 100
            let cents = item.price() % 100
            receiptString += "\(item.name): $\(dollars).\(String(format: "%02d", cents))\n"
        }
        
        receiptString += "------------------\n"
        
        let totalDollars = total() / 100
        let totalCents = total() % 100
        receiptString += "TOTAL: $\(totalDollars).\(String(format: "%02d", totalCents))"
        
        return receiptString
    }
    
    func total() -> Int {
        var sum = 0
        for item in itemList {
            sum += item.price()
        }
        return sum
    }
}

class Register {
    private var receipt = Receipt()
    
    func scan(_ item: SKU) {
        receipt.itemList.append(item)
    }
    
    func subtotal() -> Int {
        var sum = 0
        for item in receipt.items() {
            sum += item.price()
        }
        return sum
    }
    
    func total() -> Receipt {
        let finishedReceipt = receipt
        receipt = Receipt()
        return finishedReceipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

