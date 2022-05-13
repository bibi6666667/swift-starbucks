////
////  HomeYourRecommandViewController.swift
////  starbuckst
////
////  Created by Bibi on 2022/05/12.
////
//
//import UIKit
//
//class HomeYourRecommandViewController: UIViewController {
//
//    private let yourRecommandView = HomeYourRecommandView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //self.yourRecommandView.delegate = self // ???설마????
//        self.yourRecommandView.dataSource = self
//        self.yourRecommandView.register(HomeYourRecommandViewCell.self, forCellWithReuseIdentifier: HomeYourRecommandViewCell.identifier)
//        
//        setViews()
//        setConstraints()
//    }
//    
//    private func setViews() {
//        self.view.addSubview(yourRecommandView)
//    }
//    
//    private func setConstraints() {
//        configureYourRecommandViewConstraint()
//    }
//    
//    private func configureYourRecommandViewConstraint() {
//        yourRecommandView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            yourRecommandView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            yourRecommandView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            yourRecommandView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            yourRecommandView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        ])
//    }
//}
//
//
//extension HomeYourRecommandViewController: UICollectionViewDataSource { // DataSources
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeYourRecommandViewCell.identifier, for: indexPath) as? HomeYourRecommandViewCell else {
//            return UICollectionViewCell()
//        }
//        cell.backgroundColor = .red
//        return cell
//    }
//    
//}
//
//extension HomeYourRecommandViewController: UICollectionViewDelegateFlowLayout {
//    // 셀 사이즈 설정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
//}
