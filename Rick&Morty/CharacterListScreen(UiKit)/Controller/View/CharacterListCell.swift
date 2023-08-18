//
//  CharacterListCell.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListCell: UICollectionViewCell {

    static let reuseID = "CharacterListCell"

    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(image: UIImage(systemName: "person.fill"))
        avatarImageView.layer.cornerRadius = 16
        return avatarImageView
    }()

    let nameLabel: UILabel = {
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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
    }

    func setupCell(name: String) {
        nameLabel.text = name
    }
    
}
