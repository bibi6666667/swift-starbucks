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
    private let yourRecommandVC = HomeYourRecommandViewController()
    private let mainEventView = UIImageView()
    private let eventsVC = HomeEventsViewController()
    
    private let viewSpace: CGFloat = 10
    
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
        
        self.view.addSubview(eventsVC.view)
        self.addChild(eventsVC)
        eventsVC.didMove(toParent: self)
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = UIColor.customColor(.white)
        
        self.view.addSubview(yourRecommandVC.view)
        
        self.view.addSubview(mainEventView)
        
        self.view.addSubview(eventsVC.view)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        configureYourRecommandVCViewConstraint()
        configureMainEventViewConstraint()
        configureEventsVCViewConstraint()
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
    
    private func configureYourRecommandVCViewConstraint() {
        yourRecommandVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandVC.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewSpace),
            yourRecommandVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yourRecommandVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yourRecommandVC.view.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configureMainEventViewConstraint() {
        mainEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainEventView.topAnchor.constraint(equalTo: yourRecommandVC.view.bottomAnchor, constant: viewSpace),
            mainEventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainEventView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //mainEventView.bottomAnchor.constraint(equalTo: eventsVC.view.topAnchor)
            mainEventView.heightAnchor.constraint(equalToConstant: 800)
        ])
        mainEventView.image = UIImage(named: "sampleMenu")
    }
    
    private func configureEventsVCViewConstraint() {
        eventsVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsVC.view.topAnchor.constraint(equalTo: mainEventView.bottomAnchor, constant: viewSpace),
            eventsVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventsVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventsVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            eventsVC.view.heightAnchor.constraint(equalToConstant: 300)
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
