//
//  CharacterListCell.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListCell: UICollectionViewCell {

    static let reuseID = "CharacterListCell"

    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.isHidden = true
        return avatarImageView
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Имя Фамилия"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        return nameLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        layer.cornerRadius = 16
        backgroundColor = UIColor(named: "BackgroundColor")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        addSubview(nameLabel)
        addSubview(avatarImageView)
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
    }

    func setupCell(_ character: Character) {
        nameLabel.text = character.name
        downloadImage(urlString: character.imageUrl)
    }

    func downloadImage(urlString: String) {
        NetworkService.shared.downloadImage(urlString: urlString) { result in
            switch result {
                case .success(let getImage):
                    DispatchQueue.main.async {
                        self.avatarImageView.image = getImage
                        self.avatarImageView.layer.cornerRadius = 16
                        self.activityIndicator.startAnimating()
                        self.activityIndicator.isHidden = true
                        self.avatarImageView.isHidden = false
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
}
