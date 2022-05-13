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
    private let contentView = UIView()
    
    // private let yourRecommandHeader = HomeYourRecommandHeader()
    // private let yourRecommandView = HorizontalCollectionView()
    private let yourRecommandVC = HomeYourRecommandViewController()
    
    private let mainEventView = UIImageView()
    
    private let seeAllButton: UIButton = {
        var button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor.customColor(.primaryGreen), for: .normal)
        return button
    }()
    
    private let eventsView = HorizontalCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        
        self.scrollView.delegate = self
        
        setChild()
        setViews()
        setViewConstraints()
    }
    
    private func setChild() {
        self.view.addSubview(yourRecommandVC.view)
        self.addChild(yourRecommandVC)
        yourRecommandVC.didMove(toParent: self)
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = UIColor.customColor(.white)
        
        // self.view.addSubview(yourRecommandHeader)
        self.view.addSubview(yourRecommandVC.view)
        
        self.view.addSubview(mainEventView)
        
        self.view.addSubview(eventsView)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        //configureYourRecommandHeaderConstraint()
        configureYourRecommandVCViewConstraint()
        configureMainEventViewConstraint()
        configureEventsViewConstraint()
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
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            // vertical scroll
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
//    private func configureYourRecommandHeaderConstraint() {
//        yourRecommandHeader.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            yourRecommandHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
//            yourRecommandHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            yourRecommandHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            yourRecommandHeader.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
    private func configureYourRecommandVCViewConstraint() {
        yourRecommandVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandVC.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            yourRecommandVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yourRecommandVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yourRecommandVC.view.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configureMainEventViewConstraint() {
        mainEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainEventView.topAnchor.constraint(equalTo: yourRecommandVC.view.bottomAnchor),
            mainEventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainEventView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mainEventView.bottomAnchor.constraint(equalTo: eventsView.topAnchor)
        ])
        mainEventView.image = UIImage(named: "sampleMenu")
    }
    
    private func configureSeeAllButtonConstraint() {
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeAllButton.topAnchor.constraint(equalTo: mainEventView.bottomAnchor, constant: 10),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func configureEventsViewConstraint() {
        eventsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsView.topAnchor.constraint(equalTo: mainEventView.bottomAnchor),
            eventsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventsView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            eventsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
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


