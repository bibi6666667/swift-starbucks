//
//  HomeHeaderView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeHeaderButton: UIButton {

    private let envelopImageView: UIImageView = {
        let envelop = UIImage(systemName: "envelope")
        var imageView = UIImageView(image: envelop)
        imageView.tintColor = .black
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        var label = UILabel()
        label.text = "What's New"
        label.font = UIFont.customFont(.santanaBlackMedium)
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
        self.backgroundColor = UIColor.customColor(.white)
        self.addSubview(envelopImageView)
        self.addSubview(headerLabel)
    }
    
    private func setConstraint() {
        configureEnvelopImageViewConstraint()
        configureHeaderLabelConstraint()
    }
    
    private func configureEnvelopImageViewConstraint() {
        envelopImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            envelopImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            envelopImageView.widthAnchor.constraint(equalToConstant: 40),
            envelopImageView.heightAnchor.constraint(equalToConstant: 30),
            envelopImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func configureHeaderLabelConstraint() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: envelopImageView.trailingAnchor, constant: 10),
            headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
