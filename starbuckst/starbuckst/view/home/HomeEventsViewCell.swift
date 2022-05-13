//
//  HomeEventsViewCell.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import UIKit

class HomeEventsViewCell: UICollectionViewCell {
    
    static let identifier = "HomeEventsViewCell"
    
    // private let eventImageWidth: CGFloat = 150
    private let eventImageHeight: CGFloat = 180
    
    private let eventImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "sampleMenu")
        return imageView
    }()
    
    private let eventTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Event Title"
        label.font = UIFont.customFont(.santanaBlackMedium)
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
        self.addSubview(eventContentLabel)
    }
    
    private func setConstraint() {
        configureEventImageViewConstraint()
        configureEventTitleLabelConstraint()
        configureEventContentLabelConstraint()
    }
    
    private func configureEventImageViewConstraint() {
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: self.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: eventImageHeight),
        ])
    }
    
    private func configureEventTitleLabelConstraint() {
        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventTitleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            eventTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    private func configureEventContentLabelConstraint() {
        eventContentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventContentLabel.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor),
            eventContentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            eventContentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
