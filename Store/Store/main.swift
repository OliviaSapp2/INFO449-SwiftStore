//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {get}
    func price () -> Int
}

class Item: SKU{
    var name: String
    var priceEach: Int
    
    init(name: String, priceEach: Int){
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    var itemsList: [SKU] = []
    var currentTotal: Int = 0
    
    func items() -> [SKU] {
        return itemsList
    }
    
    func addItem(_ item: SKU) {
        self.itemsList.append(item)
        self.currentTotal += item.price()
    }
    
    func output() -> String {
        var receiptStr = "Receipt:\n"
        for item in self.itemsList {
            receiptStr += ("\n\(item.name): $\(Double(item.price()) / 100.0)")
        }
        receiptStr += " ------------------ \n TOTAL $\(Double(self.total()) / 100.0)"
        return receiptStr
    }
    
    func total() -> Int {
        return currentTotal
    }
}

class Register {
    var receipt: Receipt = Receipt()
    
    func scan (_ sku: SKU){
        receipt.addItem(sku)
    }
    
    func subtotal() -> Int {
        return receipt.total()
    }
    
    func total() -> Receipt {
        var tempReceit = self.receipt
        receipt = Receipt()
        return tempReceit
    }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

