//
//  CharacterListScreenView.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Characters"
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        label.textColor = .white
        return label
    }()

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.transform = CGAffineTransformMakeScale(5, 5)
        return activityIndicator
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharacterListCell.self, forCellWithReuseIdentifier: CharacterListCell.reuseID)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isHidden = true
        collectionView.backgroundColor = UIColor(named: "AccentColor")
        return collectionView
    }()

    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setViews() {
        collectionView.register(CharacterListCell.self, forCellWithReuseIdentifier: CharacterListCell.reuseID)
    }

    func setConstraints() {
        addSubview(collectionView)
        addSubview(label)
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 156 * 2 + 16),
            collectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
