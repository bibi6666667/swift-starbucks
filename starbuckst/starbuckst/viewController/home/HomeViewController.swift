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
    
    private let yourRecommandHeader = HomeYourRecommandHeader()
    private let yourRecommandView = HomeYourRecommandView()
    
    private let mainEventView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        
        self.scrollView.delegate = self
        self.yourRecommandView.dataSource = self
        self.yourRecommandView.delegate = self
        self.yourRecommandView.register(HomeYourRecommandViewCell.self, forCellWithReuseIdentifier: HomeYourRecommandViewCell.identifier)
        
        setViews()
        setViewConstraints()
        
        
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = UIColor.customColor(.white)
        
        self.view.addSubview(yourRecommandHeader)
        self.view.addSubview(yourRecommandView)
        
        self.view.addSubview(mainEventView)
    }
    
    //    private func setChild() { }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        configureYourRecommandHeaderConstraint()
        configureYourRecommandViewConstraint()
        configureMainEventViewConstraint()
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
    
    private func configureYourRecommandHeaderConstraint() {
        yourRecommandHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            yourRecommandHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yourRecommandHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yourRecommandHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureYourRecommandViewConstraint() {
        yourRecommandView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandView.topAnchor.constraint(equalTo: yourRecommandHeader.bottomAnchor),
            yourRecommandView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yourRecommandView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yourRecommandView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureMainEventViewConstraint() {
        mainEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainEventView.topAnchor.constraint(equalTo: yourRecommandView.bottomAnchor),
            mainEventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainEventView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mainEventView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        mainEventView.image = UIImage(named: "sampleMenu")
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

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeYourRecommandViewCell.identifier, for: indexPath) as? HomeYourRecommandViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 아이템 선택 시
        
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
