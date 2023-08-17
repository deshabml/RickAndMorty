//
//  CharacterListScreenViewController.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListScreenViewController: UIViewController {

    private let mainView = CharacterListView()


//    var labelText: String = "Starting value"

    var mainViewModel: ContentViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
//        let label = UILabel()
//        label.text = labelText
//        label.textColor = .white
//        view.addSubview(label)
//        label.frame = view.frame
//        let button = UIButton()
//        button.setTitle("Here my", for: .normal)
//        view.addSubview(button)
//        button.frame = view.frame
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

//    private func navigationBarSetting() {
//        let navBarAppearance = UINavigationBarAppearance()
//        title = "Characters"
//        navigationController?.navigationBar.prefersLargeTitles = true
////        navigationController?.navigationBar.standardAppearance = navBarAppearance
////        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//    }

    @objc func buttonAction() {
        mainViewModel?.showCharacterListScreen.toggle()
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
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterListCell.reuseID, for: indexPath) as! CharacterListCell
//        cell.nameLabel.text = contacts[indexPath.item].name
        return cell
    }

}

extension CharacterListScreenViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (UIScreen.main.bounds.width - 42) / 2, height: 202)
        return CGSize(width: 156, height: 202)
    }

}
