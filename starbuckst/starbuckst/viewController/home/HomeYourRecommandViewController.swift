//
//  HomeYourRecommandViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/12.
//

import UIKit

class HomeYourRecommandViewController: UIViewController {

    private let yourRecommandHeader = HomeYourRecommandHeader()
    
    private let yourRecommandView = HorizontalCollectionView()
    private let yourRecommandCellSize = CGSize(width: 200, height: 200)
    
    private var yourRecommandProducts: [String] = []
    private var yourRecommandProductImages: [UIImage?] = [] // UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.yourRecommandView.delegate = self
        self.yourRecommandView.dataSource = self
        self.yourRecommandView.register(HomeYourRecommandViewCell.self, forCellWithReuseIdentifier: HomeYourRecommandViewCell.identifier)
        
        setViews()
        setConstraints()
    }
    
    func setYourRecommandViewData(homeData: HomeData) {
        yourRecommandHeader.setRecommandLabel(text: homeData.displayName)
    }
    
    func setYourRecommandProducts(productNM: String) {
        yourRecommandProducts.append(productNM)
        DispatchQueue.main.async {
            self.yourRecommandView.reloadData()
        }
    }
    
    func setYourRecommandProductsImage(productImage: UIImage?) {
        guard let productImage = productImage else {
            print("이미지 비어있음")
            yourRecommandProductImages.append(nil)
            return
        }
        yourRecommandProductImages.append(productImage)
        DispatchQueue.main.async {
            self.yourRecommandView.reloadData()
        }
    }
    
    private func setViews() {
        self.view.addSubview(yourRecommandHeader)
        self.view.addSubview(yourRecommandView)
    }
    
    private func setConstraints() {
        configureYourRecommandHeaderConstraint()
        configureYourRecommandViewConstraint()
    }
    
    private func configureYourRecommandHeaderConstraint() {
        yourRecommandHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandHeader.topAnchor.constraint(equalTo: self.view.topAnchor),
            yourRecommandHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            yourRecommandHeader.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            yourRecommandHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureYourRecommandViewConstraint() {
        yourRecommandView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourRecommandView.topAnchor.constraint(equalTo: yourRecommandHeader.bottomAnchor),
            yourRecommandView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            yourRecommandView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            yourRecommandView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension HomeYourRecommandViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yourRecommandProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeYourRecommandViewCell.identifier, for: indexPath) as? HomeYourRecommandViewCell else {
            return UICollectionViewCell()
        }
        print("제품리스트 : \(yourRecommandProducts)")
        if !yourRecommandProducts.isEmpty {
            let menuName = yourRecommandProducts[indexPath.item] // 메뉴이름
            cell.setMenuNameLabel(name: menuName)
        }
        print("이미지리스트 : \(yourRecommandProductImages)")
        if !yourRecommandProductImages.isEmpty {
            guard let menuImage = yourRecommandProductImages[indexPath.item] else {
                return cell
            } // 메뉴 이미지
            cell.setMenuImageView(image: menuImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 아이템 선택 시
        
    }
}

extension HomeYourRecommandViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return yourRecommandCellSize
    }
}
