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
    
    private var yourRecommandProductNames: [String] = []
    private var yourRecommandProductImages: [UIImage] = []
    
    private let networkManager = NetworkManager.publicNetworkManager
    private let imageCacheManager = ImageCacheManager.publicCacheManager
    
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
        
        let products = homeData.yourRecommand.products
        presetYourRecommandCellCount(productsCount: products.count)
        
        for index in products.indices {
            let productCD = products[index]
            setYourRecommandProductNames(index: index, productCD: productCD)
            setYourRecommandProductImages(index: index, productCD: productCD)
        }
        
    }
    
    private func presetYourRecommandCellCount(productsCount: Int) {
        yourRecommandProductNames = Array<String>(repeating: "", count: productsCount)
        yourRecommandProductImages = Array<UIImage>(repeating: UIImage(systemName: "questionmark.circle") ?? UIImage(), count: productsCount)
    }
    
    private func setYourRecommandProductNames(index: Int, productCD: String) {
        networkManager.getProductInfo(productCD: productCD) { productInfo in
            self.yourRecommandProductNames[index] = productInfo.view.productNM
            DispatchQueue.main.async {
                self.yourRecommandView.reloadData()
            }
        }
    }
    
    private func setYourRecommandProductImages(index: Int, productCD: String) {
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
                        self.yourRecommandProductImages[index] = uiImage
                        DispatchQueue.main.async {
                            self.yourRecommandView.reloadData()
                        }
                    }
                }
            }
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
        return yourRecommandProductNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeYourRecommandViewCell.identifier, for: indexPath) as? HomeYourRecommandViewCell else {
            return UICollectionViewCell()
        }
        let menuName = yourRecommandProductNames[indexPath.item] // 메뉴이름
        cell.setMenuNameLabel(name: menuName)
        let menuImage = yourRecommandProductImages[indexPath.item]
        cell.setMenuImageView(image: menuImage)
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
