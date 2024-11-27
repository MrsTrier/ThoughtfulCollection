//
//  ThoughtfulCollectionViewController.swift
//  ThoughtfulCollection
//
//  Created by Daria Cheremina on 27/11/2024.
//

import UIKit

struct Constants {
    static let reusableIdentifier = "ThoughtfulCollectionViewCell"
    static let colors: [UIColor] = [.color1, .color2, .color3, .color, .color4, .color5, .color6, .color7, .color8, .color9, .color1, .color2, .color3, .color, .color4, .color5, .color6, .color7, .color8, .color9]
    static let itemWidth: CGFloat = UIScreen.main.bounds.width / 1.4
    static let itemHeight: CGFloat = UIScreen.main.bounds.height / 1.8
    static let lineSpacing: CGFloat = 25
}

class ThoughtfulCollectionViewController: UIViewController {

    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.itemWidth , height: Constants.itemHeight)
        layout.minimumLineSpacing = Constants.lineSpacing

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.reusableIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false

        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCollectionView()
    }

    func setUpCollectionView() {
        view.addSubview(collection)

        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ThoughtfulCollectionViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var currentIndex = Int(targetContentOffset.pointee.x / (Constants.itemWidth + Constants.lineSpacing))
        currentIndex = (currentIndex != 0) ? (currentIndex + 1) : currentIndex
        let offsetX = CGFloat(currentIndex) * (Constants.itemWidth + Constants.lineSpacing) - (Constants.lineSpacing / 2)
        targetContentOffset.pointee = CGPoint(x: offsetX, y: targetContentOffset.pointee.y)
    }
}

extension ThoughtfulCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reusableIdentifier, for: indexPath)
        cell.backgroundColor = Constants.colors[indexPath.row]
        cell.layer.cornerRadius = Constants.itemWidth / 14
        cell.frame.size.width = Constants.itemWidth
        cell.frame.size.height = Constants.itemHeight
        return cell
    }
}
