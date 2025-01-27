//
//  OrderListViewCell.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/20.
//

import UIKit

class OrderListViewCell: UICollectionViewCell {
    
    static let identifier = "OrderListViewCell"
    
    private let menuImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let menuInfoStackView: OrderListViewCellInfo = {
        var stackView = OrderListViewCellInfo()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setUIConstraints()
    }
    
    private func setUI() {
        self.addSubview(menuImageView)
        self.addSubview(menuInfoStackView)
    }
    
    private func setUIConstraints() {
        congifureMenuImageViewConstraint()
        configureMenuInfoStackViewConstraint()
    }
    
    private func congifureMenuImageViewConstraint() {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            menuImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            menuImageView.widthAnchor.constraint(equalToConstant: 120),
            menuImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    private func configureMenuInfoStackViewConstraint() {
        menuInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuInfoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            menuInfoStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            menuInfoStackView.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 20),
            menuInfoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            menuInfoStackView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
