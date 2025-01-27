//
//  HomeViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import UIKit

class HomeViewController: UIViewController {
    static let identifier = "HomeViewController"
    
    private let networkManager = NetworkManager.publicNetworkManager
    private let imageCacheManager = ImageCacheManager.publicCacheManager
    
    private let headerButton: UIButton = HomeHeaderButton()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let yourRecommandVC = HomeYourRecommandViewController()
    private let mainEventView = UIImageView()
    private let eventsVC = HomeEventsViewController()
    private let thisTimeRecommandVC = HomeThisTimeRecommandViewController()
    
    private let viewSpace: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChild()
        setViews()
        setViewConstraints()
        
        // getHomeData가 리턴해준 completion의 정보를 받아옴..
        networkManager.getHomeData { homeData in
            guard let homeData = homeData else {
                return
            }
            
            self.reloadMainEventImage(homeData: homeData)
            self.yourRecommandVC.setYourRecommandViewData(homeData: homeData)
            self.thisTimeRecommandVC.setThisTimeRecommandViewData(homeData: homeData)
        }
    }
    
    private func addNotifications() {
        
    }
    
    private func reloadMainEventImage(homeData: HomeData) {
        let mainImageURLString = homeData.mainEvent.imageUploadPath + homeData.mainEvent.mobTHUM
        guard let mainImageURL = URL(string: mainImageURLString) else {
            return
        }
        let mainImageItem = ImageItem(url: mainImageURL)
        imageCacheManager.loadImage(url: mainImageURL as NSURL, imageItem: mainImageItem) { (imageItem, uiImage) in
            DispatchQueue.main.async { // MARK: 이미지가 보일 때도 있고 안 보일 때도 있음
                self.mainEventView.image = uiImage
                self.mainEventView.setNeedsDisplay()
            }
        }
    }
    
    
    
    private func setChild() {
        self.view.addSubview(yourRecommandVC.view)
        self.addChild(yourRecommandVC)
        yourRecommandVC.didMove(toParent: self)
        
        self.view.addSubview(eventsVC.view)
        self.addChild(eventsVC)
        eventsVC.didMove(toParent: self)
        
        self.view.addSubview(thisTimeRecommandVC.view)
        self.addChild(thisTimeRecommandVC)
        thisTimeRecommandVC.didMove(toParent: self)
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = UIColor.customColor(.white)
        
        contentView.addSubview(yourRecommandVC.view)
        contentView.addSubview(mainEventView)
        contentView.addSubview(eventsVC.view)
        contentView.addSubview(thisTimeRecommandVC.view)
        
//        self.view.addSubview(yourRecommandVC.view)
//        self.view.addSubview(mainEventView)
//        self.view.addSubview(eventsVC.view)
//        self.view.addSubview(thisTimeRecommandVC.view)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        configureYourRecommandVCViewConstraint()
        configureMainEventViewConstraint()
        configureEventsVCViewConstraint()
        configureThisTimeRecommandVCViewConstraint()
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
            yourRecommandVC.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureMainEventViewConstraint() {
        mainEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainEventView.topAnchor.constraint(equalTo: yourRecommandVC.view.bottomAnchor, constant: viewSpace),
            mainEventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainEventView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //mainEventView.bottomAnchor.constraint(equalTo: eventsVC.view.topAnchor)
            mainEventView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func configureEventsVCViewConstraint() {
        eventsVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsVC.view.topAnchor.constraint(equalTo: mainEventView.bottomAnchor, constant: viewSpace),
            eventsVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventsVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            // eventsVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            eventsVC.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureThisTimeRecommandVCViewConstraint() {
        thisTimeRecommandVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thisTimeRecommandVC.view.topAnchor.constraint(equalTo: eventsVC.view.bottomAnchor, constant: viewSpace),
            thisTimeRecommandVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thisTimeRecommandVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thisTimeRecommandVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thisTimeRecommandVC.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc
    private func touchedHeaderButton() {
        // 다음 what's new 화면으로 이동
    }
}
