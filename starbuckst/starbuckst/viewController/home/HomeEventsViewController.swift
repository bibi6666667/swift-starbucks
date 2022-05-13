//
//  HomeEventsViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import UIKit

class HomeEventsViewController: UIViewController {

    private let seeAllButton: UIButton = {
        var button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor.customColor(.primaryGreen), for: .normal)
        return button
    }()
    
    private let eventsView = HorizontalCollectionView()
    private let eventsViewCellSize = CGSize(width: 250, height: 250)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.eventsView.delegate = self
        self.eventsView.dataSource = self
        self.eventsView.register(HomeEventsViewCell.self, forCellWithReuseIdentifier: HomeEventsViewCell.identifier)
        
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        self.view.addSubview(seeAllButton)
        self.view.addSubview(eventsView)
    }
    
    private func setConstraints() {
        configureSeeAllButtonConstraint()
        configureEventsViewConstraint()
    }
    
    private func configureSeeAllButtonConstraint() {
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeAllButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            seeAllButton.heightAnchor.constraint(equalToConstant: 30),
            // seeAllButton.bottomAnchor.constraint(equalTo: eventsView.topAnchor)
        ])
    }
    
    private func configureEventsViewConstraint() {
        eventsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsView.topAnchor.constraint(equalTo: seeAllButton.bottomAnchor),
            eventsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            eventsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            // eventsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            eventsView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

}

extension HomeEventsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventsViewCell.identifier, for: indexPath) as? HomeEventsViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 아이템 선택 시
        
    }
}

extension HomeEventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return eventsViewCellSize
    }
}
