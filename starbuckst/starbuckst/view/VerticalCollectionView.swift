//
//  VerticalCollectionView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/19.
//

import UIKit

class VerticalCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: flowLayout)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
