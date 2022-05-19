//
//  HomeThisTimeRecommandViewCell.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeThisTimeRecommandViewCell: UICollectionViewCell {
    
    static let identifier = "HomeThisTimeRecommandViewCell"
    
    private let menuImageViewSize: CGFloat = 150
    
    private let menuImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150 / 2
        return imageView
    }()
    
    private let menuLabel: UILabel = {
        var label = UILabel()
        label.text = "1 Sample Menu"
        label.font = UIFont.customFont(.santanaBlackSmall)
        label.numberOfLines = 0
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
        self.addSubview(menuLabel)
        setMenuLabelAttribute()
    }
    
    private func setConstraint() {
        configureMenuImageViewConstraint()
        configureMenuLabelConstraint()
    }
    
    private func configureMenuImageViewConstraint() {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            menuImageView.widthAnchor.constraint(equalToConstant: menuImageViewSize),
            menuImageView.heightAnchor.constraint(equalToConstant: menuImageViewSize),
            menuImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configureMenuLabelConstraint() {
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor),
            menuLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            menuLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setMenuLabelAttribute() {
        let fullText = menuLabel.text ?? ""
        let fullTextNSString = fullText as NSString
        let attributedString = NSMutableAttributedString(string: fullText)
        let font = UIFont.customFont(.santanaBlackMedium)
        attributedString.addAttribute(.font, value: font, range: fullTextNSString.range(of: "1"))
        attributedString.addAttribute(.foregroundColor, value: UIColor.customColor(.primaryGreen), range: fullTextNSString.range(of: "1"))
        menuLabel.attributedText = attributedString
    }
}
