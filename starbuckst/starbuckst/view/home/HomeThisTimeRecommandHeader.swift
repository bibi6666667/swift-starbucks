//
//  HomeThisTimeRecommandHeader.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import UIKit

class HomeThisTimeRecommandHeader: UIView {
    
    static let identifier = "HomeThisTimeRecommandHeader"
    
    private let recommandLabel: UILabel = {
        var label = UILabel()
        label.text = "이 시간대 인기 메뉴"
        label.font = UIFont.customFont(.santanaBlackLarge)
        return label
    }()
    
    private let recommandTimeLabel: UILabel = {
        var label = UILabel()
        label.text = "주중 오후 4시 기준"
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
        self.addSubview(recommandLabel)
        self.addSubview(recommandTimeLabel)
    }
    
    private func setConstraint() {
        configureRecommandLabelConstraint()
        configureRecommandTimeLabelConstraint()
    }
    
    private func configureRecommandLabelConstraint() {
        recommandLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recommandLabel.topAnchor.constraint(equalTo: self.topAnchor),
            recommandLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recommandLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            recommandLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func configureRecommandTimeLabelConstraint() {
        recommandTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recommandTimeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            recommandTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recommandTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            recommandTimeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
