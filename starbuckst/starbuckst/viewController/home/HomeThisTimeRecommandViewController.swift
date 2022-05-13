//
//  HomeThisTimeRecommandViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/12.
//

import UIKit

class HomeThisTimeRecommandViewController: UIViewController {

    private let thisTimeRecommandHeader = HomeThisTimeRecommandHeader()
    
    private let thisTimeRecommandView = HorizontalCollectionView()
    private let thisTimeRecommandCellSize = CGSize(width: 200, height: 200)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.thisTimeRecommandView.delegate = self
        self.thisTimeRecommandView.dataSource = self
        self.thisTimeRecommandView.register(HomeThisTimeRecommandViewCell.self, forCellWithReuseIdentifier: HomeThisTimeRecommandViewCell.identifier)
        
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        self.view.addSubview(thisTimeRecommandHeader)
        self.view.addSubview(thisTimeRecommandView)
    }
    
    private func setConstraints() {
        configureYourRecommandHeaderConstraint()
        configureYourRecommandViewConstraint()
    }
    
    private func configureYourRecommandHeaderConstraint() {
        thisTimeRecommandHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thisTimeRecommandHeader.topAnchor.constraint(equalTo: self.view.topAnchor),
            thisTimeRecommandHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            thisTimeRecommandHeader.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            thisTimeRecommandHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureYourRecommandViewConstraint() {
        thisTimeRecommandView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thisTimeRecommandView.topAnchor.constraint(equalTo: thisTimeRecommandHeader.bottomAnchor),
            thisTimeRecommandView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            thisTimeRecommandView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            thisTimeRecommandView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension HomeThisTimeRecommandViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThisTimeRecommandViewCell.identifier, for: indexPath) as? HomeThisTimeRecommandViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 아이템 선택 시
        
    }
}

extension HomeThisTimeRecommandViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return thisTimeRecommandCellSize
    }
}
