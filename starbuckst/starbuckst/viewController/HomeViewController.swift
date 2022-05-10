//
//  HomeViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import UIKit

class HomeViewController: UIViewController {
    static let identifier = "HomeViewController"
    
    private let headerView: UIView = HomeHeaderView()
    
    override func viewDidLoad() {
        headerView.backgroundColor = .systemGray3
        setViews()
        setViewConstraints()
    }
    
    private func setViews() {
        self.view.addSubview(headerView)
    }
    
    private func setViewConstraints() {
        configureHeaderViewConstraint()
    }
    
    private func configureHeaderViewConstraint() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            headerView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
