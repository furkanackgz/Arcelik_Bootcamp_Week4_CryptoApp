//
//  CollectionViewHelper.swift
//  week4_Assignment
//
//  Created by Furkan Açıkgöz on 14.06.2022.
//

import UIKit

class CollectionViewHelper: NSObject {
    
    private var currensies: [CryptoCurrency] = []
    
    weak var collectionView: UICollectionView?
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCell()
    }
    
}

extension CollectionViewHelper {
    
    func registerCell() {
        collectionView?.register(.init(nibName: "CryptoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CryptoCollectionViewCell")
    }
    
    func setItems(_ items: [CryptoCurrency]) {
        currensies = items
        collectionView?.reloadData()
    }
}

// MARK: - Collection View Delegation methods
extension CollectionViewHelper: UICollectionViewDelegate { }

extension CollectionViewHelper: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currensies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CryptoCollectionViewCell", for: indexPath) as! CryptoCollectionViewCell
        
        cell.labelSymbol.text = currensies[indexPath.row].symbol
        cell.labelLastPrice.text = currensies[indexPath.row].lastPrice
        
        return cell
    }
    
}