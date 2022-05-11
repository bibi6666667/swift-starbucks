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
    
    private let scrollView = UIScrollView()
    private let contentView = HomeVerticalScrollContentView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        
        self.scrollView.delegate = self
        
        setViews()
        setViewConstraints()
    }
    //MARK: child view controller 관계 설정하고 HomeVC에 추가하기
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
    }
    
    private func configureHeaderButtonConstraint() {
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            headerButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            headerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureVerticalScrollViewConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerButton.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    private func configureContentViewConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
        // vertical scroll view
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
    }
    
    @objc
    private func touchedHeaderButton() {
        // 다음 what's new 화면으로 이동
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled")
    }
}


