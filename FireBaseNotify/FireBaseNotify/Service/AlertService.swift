//
//  AlertService.swift
//  FireBaseNotify
//
//  Created by David E Bratton on 6/19/19.
//  Copyright © 2019 David Bratton. All rights reserved.
//

import UIKit

class AlertService {
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New Product", message: "What's for sale?", preferredStyle: .alert)
        alert.addTextField { (title) in
            title.placeholder = "Title"
        }
        alert.addTextField { (price) in
            price.placeholder = "Price"
            price.keyboardType = .numberPad
        }
        let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text,
                let price = alert.textFields?.last?.text,
                let cost = Double(price)
                else { return }
            
            let product = Product(title: title, cost: cost)
            completion(product)
        }
        alert.addAction(submit)
        vc.present(alert, animated: true)
    }
    
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            print("You have subscribed")
        }
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in
            print("You have unsubscribed")
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true)
    }
}
