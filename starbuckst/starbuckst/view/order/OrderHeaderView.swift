//
//  OrderHeaderView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/19.
//

import UIKit

class OrderHeaderView: UIView {
    
    private let headerLabel: UILabel = {
        var label = UILabel()
        label.text = "Order"
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
    
    private func setUI() {
        self.backgroundColor = UIColor.customColor(.white)
        self.addSubview(headerLabel)
    }
    
    private func setConstraint() {
        configureHeaderLabelConstraint()
    }

    private func configureHeaderLabelConstraint() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

}
