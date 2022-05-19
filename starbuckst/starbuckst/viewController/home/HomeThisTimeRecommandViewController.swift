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
    
    private var thisTimeRecommandProductNames: [String] = []
    private var thisTimeRecommandProductImages: [UIImage] = []
    
    private let networkManager = NetworkManager.publicNetworkManager
    private let imageCacheManager = ImageCacheManager.publicCacheManager
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.thisTimeRecommandView.delegate = self
        self.thisTimeRecommandView.dataSource = self
        self.thisTimeRecommandView.register(HomeThisTimeRecommandViewCell.self, forCellWithReuseIdentifier: HomeThisTimeRecommandViewCell.identifier)
        
        setViews()
        setConstraints()
    }
    
    func setThisTimeRecommandViewData(homeData: HomeData) {
        
        let products = homeData.nowRecommand.products
        presetThisTimeRecommandCellCount(productsCount: products.count)
        
        for index in products.indices {
            let productCD = products[index]
            setThisTimeRecommandProductNames(index: index, productCD: productCD)
            setThisTimeRecommandProductImages(index: index, productCD: productCD)
        }
        
    }
    
    private func presetThisTimeRecommandCellCount(productsCount: Int) {
        thisTimeRecommandProductNames = Array<String>(repeating: "", count: productsCount)
        thisTimeRecommandProductImages = Array<UIImage>(repeating: UIImage(systemName: "questionmark.circle") ?? UIImage(), count: productsCount)
    }
    
    private func setThisTimeRecommandProductNames(index: Int, productCD: String) {
        networkManager.getProductInfo(productCD: productCD) { productInfo in
            self.thisTimeRecommandProductNames[index] = productInfo.view.productNM
            DispatchQueue.main.async {
                self.thisTimeRecommandView.reloadData()
            }
        }
    }
    
    private func setThisTimeRecommandProductImages(index: Int, productCD: String) {
        networkManager.getProductImage(productCD: productCD) { productImage in
            // file: [File]
            // MARK: API 응답에서 file이 비어있는 경우가 존재함..
            if !productImage.file.isEmpty {
                let productImageFile = productImage.file[0] // 위험..
                guard let productImageURL = URL(string: productImageFile.imgUPLOADPATH + productImageFile.filePATH) else {
                    return
                }
                let productImageItem = ImageItem(url: productImageURL)
                self.imageCacheManager.loadImage(url: productImageURL as NSURL, imageItem: productImageItem) { (imageItem, uiImage) in
                    if let uiImage = uiImage {
                        self.thisTimeRecommandProductImages[index] = uiImage
                        DispatchQueue.main.async {
                            self.thisTimeRecommandView.reloadData()
                        }
                    }
                }
            }
        }
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
        return thisTimeRecommandProductNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThisTimeRecommandViewCell.identifier, for: indexPath) as? HomeThisTimeRecommandViewCell else {
            return UICollectionViewCell()
        }
        let menuName = thisTimeRecommandProductNames[indexPath.item] // 메뉴이름
        cell.setMenuNameLabel(name: menuName, rank: String(indexPath.item + 1))
        let menuImage = thisTimeRecommandProductImages[indexPath.item]
        cell.setMenuImageView(image: menuImage)
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
