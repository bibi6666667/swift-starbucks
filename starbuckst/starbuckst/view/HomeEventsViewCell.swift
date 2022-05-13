//
//  HomeEventsViewCell.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import UIKit

class HomeEventsViewCell: UICollectionViewCell {
    
    static let identifier = "HomeEventsViewCell"
    
    private let menuImageViewSize: CGFloat = 150
    
    private let eventImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        return imageView
    }()
    
    private let eventTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Event Title"
        label.font = UIFont.customFont(.santanaBlackSmall)
        return label
    }()
    
    private let eventContentLabel: UILabel = {
        var label = UILabel()
        label.text = "Event Content"
        label.font = UIFont.customFont(.santanaBlackSmall)
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
        self.addSubview(eventImageView)
        self.addSubview(eventTitleLabel)
    }
    
    private func setConstraint() {
        configureMenuImageViewConstraint()
        configureMenuNameLabelConstraint()
    }
    
    private func configureMenuImageViewConstraint() {
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            eventImageView.widthAnchor.constraint(equalToConstant: menuImageViewSize),
            eventImageView.heightAnchor.constraint(equalToConstant: menuImageViewSize),
            eventImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configureMenuNameLabelConstraint() {
        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventTitleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            eventTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            eventTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
