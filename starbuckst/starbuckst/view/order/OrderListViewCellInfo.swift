//
//  OrderListViewCellInfo.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/20.
//

import UIKit

class OrderListViewCellInfo: UIStackView {

    static let identifier = "OrderListViewCellInfo"
    
    
    private let menuNameLabel: UILabel = {
        var label = UILabel()
        label.text = "Menu Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setUIConstraints()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setUIConstraints()
    }
    
    // set Image
    // set Info
    
    private func setUI() {
        self.addArrangedSubview(menuNameLabel)
    }
    
    private func setUIConstraints() {
        configureMenuNameLabelConstraint()
    }
    
    private func configureMenuNameLabelConstraint() {
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            menuNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}
