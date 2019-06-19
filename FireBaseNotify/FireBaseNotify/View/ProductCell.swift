//
//  ProductCell.swift
//  FireBaseNotify
//
//  Created by David E Bratton on 6/19/19.
//  Copyright © 2019 David Bratton. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func configureCell(product: Product) {
        let costString = String(format: "%.2f", product.cost)
        titleLabel.text = product.title
        priceLabel.text = "$\(costString)"
        productImage.image = UIImage(named: "shirt-2")
    }
}
