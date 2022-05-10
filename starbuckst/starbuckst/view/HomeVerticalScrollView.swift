//
//  HomeVerticalScrollView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeVerticalScrollView: UIScrollView {

    private let contentView: UIView = {
        var view = UIView()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        self.addSubview(contentView)
    }
}
