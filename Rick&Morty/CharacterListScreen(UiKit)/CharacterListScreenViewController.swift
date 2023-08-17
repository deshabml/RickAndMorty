//
//  CharacterListScreenViewController.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import UIKit

class CharacterListScreenViewController: UIViewController {

    var labelText: String = "Starting value"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        view.addSubview(label)
        label.frame = view.frame
        let button = UIButton()
        button.setTitle("Here my", for: .normal)
        view.addSubview(button)
        button.frame = view.frame
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        print("ap op")
        self.dismiss(animated: true)
    }

}
