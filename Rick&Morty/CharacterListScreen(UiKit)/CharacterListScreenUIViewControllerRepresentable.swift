//
//  CharacterListScreenUIViewControllerRepresentable.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import SwiftUI

struct CharacterListScreenUIViewControllerRepresentable: UIViewControllerRepresentable {

    @EnvironmentObject private var mainViewModel: ContentViewModel

    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = CharacterListScreenViewController()
        vc.setupVC(mainViewModel)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }

}
