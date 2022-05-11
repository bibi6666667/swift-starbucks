//
//  HomeVerticalScrollContentView.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/10.
//

import UIKit

class HomeVerticalScrollContentView: UIView {

    private let yourRecommandView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setConstraint()
    }
    
    private func setUI() {
        self.addSubview(yourRecommandView)
    }
    
    private func setConstraint() {
        configureYourRecommandViewConstraint()
    }
    
    private func configureYourRecommandViewConstraint() {
        yourRecommandView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandView.topAnchor.constraint(equalTo: self.topAnchor),
            yourRecommandView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yourRecommandView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yourRecommandView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension HomeVerticalScrollContentView: UICollectionViewDataSource {
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

extension HomeVerticalScrollContentView: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
