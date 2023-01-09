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
    
    private var eventsTitles: [String] = []
    private var eventsImages: [UIImage] = []
    
    private let networkManager = NetworkManager.publicNetworkManager
    private let imageCacheManager = ImageCacheManager.publicCacheManager
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.eventsView.delegate = self
        self.eventsView.dataSource = self
        self.eventsView.register(HomeEventsViewCell.self, forCellWithReuseIdentifier: HomeEventsViewCell.identifier)
        
        setViews()
        setConstraints()
        
        networkManager.getHomeEvents { (homeEvents) in
            self.setEventsViewData(homeEvents: homeEvents)
        }
    }
    
    func setEventsViewData(homeEvents: HomeEvents) {
        
        let eventList = homeEvents.list
        presetEventsCellCount(eventsCount: eventList.count)
        
        for index in eventList.indices {
            let event = eventList[index]
            setEventsTitles(index: index, event: event)
            setEventsImages(index: index, event: event)
        }
    }
    
    private func presetEventsCellCount(eventsCount: Int) {
        eventsTitles = Array<String>(repeating: "", count: eventsCount)
        eventsImages = Array<UIImage>(repeating: UIImage(systemName: "camera.metering.unknown") ?? UIImage(), count: eventsCount)
    }
    
    private func setEventsTitles(index: Int, event: List) {
        self.eventsTitles[index] = event.title
        
        DispatchQueue.main.async { [weak self] in
            self?.eventsView.reloadData()
        }
    }
    
    private func setEventsImages(index: Int, event: List) {
        guard let eventImageURL = URL(string: event.imgUPLOADPATH + "/upload/promotion/" + event.mobTHUM) else {
            return
        }
        
        let eventImageItem = ImageItem(url: eventImageURL)
        self.imageCacheManager.loadImage(url: eventImageURL as NSURL, imageItem: eventImageItem) { (imageItem, uiImage) in
            if let uiImage = uiImage {
                self.eventsImages[index] = uiImage
                
                DispatchQueue.main.async { [weak self] in
                    self?.eventsView.reloadData()
                }
            }
        }
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
        ])
    }
    
    private func configureEventsViewConstraint() {
        eventsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsView.topAnchor.constraint(equalTo: seeAllButton.bottomAnchor),
            eventsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            eventsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            eventsView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

}

extension HomeEventsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventsViewCell.identifier, for: indexPath) as? HomeEventsViewCell else {
            return UICollectionViewCell()
        }
        let eventTitle = eventsTitles[indexPath.item]
        let eventImage = eventsImages[indexPath.item]
        
        DispatchQueue.main.async {
            cell.setEventTitleLabel(title: eventTitle)
            cell.setEventImageView(image: eventImage)
        }
        
        return cell
    }
}

extension HomeEventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return eventsViewCellSize
    }
}
