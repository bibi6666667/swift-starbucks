//
//  OrderViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import Foundation
import UIKit

class OrderViewController: UIViewController {
    
    static let identifier = "OrderViewController"
    
    private let networkManager = NetworkManager.publicNetworkManager
    private let imageCacheManager = ImageCacheManager.publicCacheManager
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let orderHeader = OrderHeaderView()
    private let orderListVC = OrderListViewController()
    
    private let viewSpace: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        
        setChild()
        setViews()
        setViewConstraints()
    }
    
    private func setChild() {
        self.view.addSubview(orderListVC.view)
        self.addChild(orderListVC)
        orderListVC.didMove(toParent: self)
    }
    
    private func setViews() {
        self.view.addSubview(orderHeader)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = UIColor.customColor(.white)
        
        contentView.addSubview(orderListVC.view)
        orderListVC.view.backgroundColor = .blue
    }
    
    private func setViewConstraints() {
        configureOrderHeaderConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        configureOrderListVCViewConstraint()
    }
    
    private func configureOrderHeaderConstraint() {
        orderHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderHeader.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            orderHeader.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            orderHeader.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            orderHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureVerticalScrollViewConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: orderHeader.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    private func configureContentViewConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            // vertical scroll
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
    private func configureOrderListVCViewConstraint() {
        orderListVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderListVC.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewSpace),
            orderListVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderListVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             orderListVC.view.heightAnchor.constraint(equalToConstant: 800)
            // MARK: 왜 위 코드는 되고 아래 코드는 안되는지?....
//             orderListVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc
    private func touchedHeaderButton() {
        // 다음 what's new 화면으로 이동
    }
}

extension OrderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled")
    }
}
