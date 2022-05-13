//
//  Amodel.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import Foundation
import UIKit

class Amodel: NSObject { // ojC의 최상위클래스
    
    private let items = [1,2,3,4,5] // DATASOURCE
}

class Bmodel: NSObject {
    private let items = ["A", "B", "C"]
}

extension Amodel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath)
        return cell
    }
}

extension Bmodel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath)
        return cell
    }
}
