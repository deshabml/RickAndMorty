//
//  CollectionLayoutManager.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

//class CollectionLayoutManager {
//
//    static let shared = CollectionLayoutManager()
//
//    private init() { }
//
//    func createLayout() -> UICollectionViewCompositionalLayout {
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
//            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(20),
//                                                  heightDimension: .absolute(156))
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//            group.interItemSpacing = .fixed(8)
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
//            return section
//        }
//        return layout
//    }
//
//}
