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
    
    private let yourRecommandView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        
        self.scrollView.delegate = self
        
        setViews()
        setViewConstraints()
    }
    
    private func setViews() {
        self.view.addSubview(headerButton)
        headerButton.addTarget(self, action: #selector(touchedHeaderButton), for: .touchUpInside)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        self.view.addSubview(yourRecommandView)
    }
    
    private func setViewConstraints() {
        configureHeaderButtonConstraint()
        configureVerticalScrollViewConstraint()
        configureContentViewConstraint()
        configureYourRecommandViewConstraint()
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
    
    // MARK : 이걸 HomeVerticalScrollContentView에 넣어야 함!!
    private func configureYourRecommandViewConstraint() {
        yourRecommandView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandView.topAnchor.constraint(equalTo: contentView.topAnchor),
            yourRecommandView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yourRecommandView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yourRecommandView.heightAnchor.constraint(equalToConstant: 200)
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

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = yourRecommandView.dequeueReusableCell(withReuseIdentifier: HomeYourRecommandViewCell.identifier, for: indexPath) as? HomeYourRecommandViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    // MARK : 헤더 설정하기
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
