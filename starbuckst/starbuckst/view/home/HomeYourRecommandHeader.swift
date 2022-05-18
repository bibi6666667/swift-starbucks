//
//  HomeYourRecommandHeader.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/12.
//

import UIKit

class HomeYourRecommandHeader: UIView {
    
    static let identifier = "HomeYourRecommandHeader"
    
    private let recommandLabel: UILabel = {
        var label = UILabel()
        label.text = "bibi 님을 위한 추천 메뉴"
        label.font = UIFont.customFont(.santanaBlackLarge)
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
    
    func setRecommandLabel(text: String) {
        recommandLabel.text = text + " 님을 위한 추천 메뉴"
    }
    
    private func setUI() {
        self.addSubview(recommandLabel)
    }
    
    private func setConstraint() {
        configureRecommandLabelConstraint()
    }
    
    private func configureRecommandLabelConstraint() {
        recommandLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recommandLabel.topAnchor.constraint(equalTo: self.topAnchor),
            recommandLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recommandLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            recommandLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
