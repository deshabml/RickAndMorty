//
//  CharacterListScreenViewController.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListScreenViewController: UIViewController {

    private let mainView = CharacterListView()

    private var characters: [Character] = []

    var mainViewModel: ContentViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        getCharacter()
    }

    func setupVC(_ mainViewModel: ContentViewModel) {
        self.mainViewModel = mainViewModel
    }

    func getCharacter() {
        mainViewModel?.getCharacter(completion: { [unowned self] in
            self.characters = mainViewModel?.characters ?? []
            self.mainView.collectionView.reloadData()
            self.mainView.activityIndicator.stopAnimating()
            self.mainView.activityIndicator.isHidden = true
            self.mainView.collectionView.isHidden = false
        })
    }

    deinit {
        print("Deeleted")
    }

}

extension CharacterListScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterListCell.reuseID, for: indexPath) as! CharacterListCell
        cell.setupCell(characters[indexPath.row])
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
