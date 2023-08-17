//
//  CharacterListCell.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListCell: UICollectionViewCell {

    static let reuseID = "CharacterListCell"

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Имя Фамилия"
        return nameLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        layer.cornerRadius = 16
        backgroundColor = UIColor(named: "BackgroundColor")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
