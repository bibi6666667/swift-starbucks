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
    private var yourRecommandProductImages: [UIImage] = [] // UIImage?
    
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
        
        // yourRecommand products
        let products = homeData.yourRecommand.products
        yourRecommandProducts = Array<String>(repeating: "", count: products.count)
        yourRecommandProductImages = Array<UIImage>(repeating: UIImage(), count: products.count)
        
        for index in products.indices {
            let productCD = products[index]
            // productInfo
            networkManager.getProductInfo(productCD: productCD) { productInfo in
                self.setYourRecommandProducts(index: index, productNM: productInfo.view.productNM)
            }
            // productImage
            networkManager.getProductImage(productCD: productCD) { productImage in
                // file: [File]
                print("파일 : \(productImage.file)")
                // MARK: file이 비어있는 경우???
                if !productImage.file.isEmpty {
                    let productImageFile = productImage.file[0] // 위험..
                    guard let productImageURL = URL(string: productImageFile.imgUPLOADPATH + productImageFile.filePATH) else {
                        return
                    }
                    let productImageItem = ImageItem(url: productImageURL)
                    self.imageCacheManager.loadImage(url: productImageURL as NSURL, imageItem: productImageItem) { (imageItem, uiImage) in
                        if let uiImage = uiImage {
                            self.setYourRecommandProductsImage(index: index, productImage: uiImage)
                        }
                    }
                }
            }
        }
        
        
    }
    
    private func setYourRecommandProducts(index: Int, productNM: String) {
        yourRecommandProducts[index] = productNM
        DispatchQueue.main.async {
            self.yourRecommandView.reloadData()
        }
    }
    
    private func setYourRecommandProductsImage(index: Int, productImage: UIImage) {
        yourRecommandProductImages[index] = productImage
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
            let menuImage = yourRecommandProductImages[indexPath.item]
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
