//
//  HomeYourReccommandView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeYourRecommandViewCell: UICollectionViewCell {
    
    static let identifier = "HomeYourRecommandViewCell"
    
    private let menuImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        return imageView
    }()
    
    private let menuNameLabel: UILabel = {
        var label = UILabel()
        label.text = "샘플메뉴"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setConstraint()
    }
    
    private func setUI() {
        self.addSubview(menuImageView)
        self.addSubview(menuNameLabel)
    }
    
    private func setConstraint() {
        configureMenuImageViewConstraint()
        configureMenuNameLabelConstraint()
    }
    
    private func configureMenuImageViewConstraint() {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func configureMenuNameLabelConstraint() {
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
}
