//
//  HomeViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import UIKit

class HomeViewController: UIViewController {
    static let identifier = "HomeViewController"
    
    private let headerButton: UIButton = HomeHeaderButton()
    
    override func viewDidLoad() {
        headerButton.backgroundColor = .systemGray3
        setViews()
        setViewConstraints()
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
    }
    
    private func configureHeaderButtonConstraint() {
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            headerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func touchedHeaderButton() {
        // 다음 what's new 화면으로 이동
    }
}
