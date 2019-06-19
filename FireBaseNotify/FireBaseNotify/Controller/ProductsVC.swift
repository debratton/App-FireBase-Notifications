//
//  ProductsVC.swift
//  FireBaseNotify
//
//  Created by David E Bratton on 6/19/19.
//  Copyright © 2019 David Bratton. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let testData1 = Product(title: "Sporty shirt", cost: 95)
        let testData2 = Product(title: "Stylish shirt", cost: 88)
        products.append(testData1)
        products.append(testData2)
    }
    
    @IBAction func subscribeBtnPressed(_ sender: UIBarButtonItem) {
        AlertService.subscribeAlert(in: self)
    }
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        AlertService.addProductAlert(in: self) { (product) in
            self.products.append(product)
            self.collectionView.reloadData()
        }
    }
    
}

extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            //let currentProduct = products[indexPath.row] THIS APPEARS TO WORK TO
            let currentProduct = products[indexPath.item]
            cell.configureCell(product: currentProduct)
            return cell
        } else {
            return ProductCell()
        }
    }
}
