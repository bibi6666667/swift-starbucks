//
//  OrderListViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/20.
//

import UIKit

class OrderListViewController: UIViewController {

    private let orderListView = VerticalCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.orderListView.delegate = self
        self.orderListView.dataSource = self
        self.orderListView.register(OrderListViewCell.self, forCellWithReuseIdentifier: OrderListViewCell.identifier)
        
        // setChild()
        setViews()
        setViewConstraints()
    }
    
    private func setChild() {    }
    
    private func setViews() {
        self.view.addSubview(orderListView)
        //orderListView.backgroundColor = .blue
    }
    
    private func setViewConstraints() {
        configureOrderListViewConstraint()
    }
    
    private func configureOrderListViewConstraint() {
        orderListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderListView.topAnchor.constraint(equalTo: self.view.topAnchor),
            orderListView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            orderListView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            orderListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension OrderListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderListViewCell.identifier, for: indexPath) as? OrderListViewCell else {
            return UICollectionViewCell()
        }
        // cell settings
        cell.backgroundColor = .systemPink
        return cell
    }
}

extension OrderListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: orderListView.frame.width, height: 100)
    }
}
