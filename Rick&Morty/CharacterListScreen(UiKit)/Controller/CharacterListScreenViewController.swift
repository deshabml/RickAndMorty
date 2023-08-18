//
//  CharacterListScreenViewController.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListScreenViewController: UIViewController {

    private let mainView = CharacterListView()

    var mainViewModel: ContentViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.mainView.collectionView.reloadData()
            self.mainView.collectionView.isHidden = false
        }
    }

    func setupVC(_ mainViewModel: ContentViewModel) {
        self.mainViewModel = mainViewModel
    }

    deinit {
        print("Deeleted")
    }

}

extension CharacterListScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel?.characters?.count ?? 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterListCell.reuseID, for: indexPath) as! CharacterListCell
        if let characters = mainViewModel?.characters {
            cell.setupCell(name: characters[indexPath.row].name)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Pararam")
    }

}

extension CharacterListScreenViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 202)
    }

}
