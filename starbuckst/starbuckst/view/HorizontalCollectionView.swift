//
//  HorizontalCollectionView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/12.
//

import UIKit

class HorizontalCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: flowLayout)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isScrollEnabled = true
    }
}
