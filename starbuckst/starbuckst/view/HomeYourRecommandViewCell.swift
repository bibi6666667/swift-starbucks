//
//  HomeYourReccommandView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeYourRecommandViewCell: UICollectionViewCell {
    
    static let identifier = "HomeYourRecommandViewCell"
    
    private let menuImageViewSize: CGFloat = 150
    
    private let menuImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        imageView.backgroundColor = UIColor.customColor(.primaryGreen)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150 / 2
        return imageView
    }()
    
    private let menuNameLabel: UILabel = {
        var label = UILabel()
        label.text = "Sample Menu"
        label.font = UIFont.customFont(.santanaBlack)
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
            menuImageView.topAnchor.constraint(equalTo: self.topAnchor),
            menuImageView.widthAnchor.constraint(equalToConstant: menuImageViewSize),
            menuImageView.heightAnchor.constraint(equalToConstant: menuImageViewSize),
            menuImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configureMenuNameLabelConstraint() {
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuNameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 5),
            menuNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            menuNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
