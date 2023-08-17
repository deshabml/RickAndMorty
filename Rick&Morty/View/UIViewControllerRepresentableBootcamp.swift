//
//  UIViewControllerRepresentableBootcamp.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {

    @State private var showScreen: Bool = false

    var body: some View {
        VStack {
            if showScreen {
                VStack {
                    CharacterListScreenUIViewControllerRepresentable(labelText: "New Text Hear")
                }
            } else {
                VStack {
                    Text("Hi")
                    Button {
                        showScreen.toggle()
                    } label: {
                        Text("Click here")
                    }
                    //                .navigationDestination(isPresented: $showScreen, destination: {
                    //                    BasicUIViewControllerRepresentable(labelText: "New Text Hear")
                    //                })
                    //            .sheet(isPresented: $showScreen) {
                    //                 BasicUIViewControllerRepresentable(labelText: "New Text Hear")
                    //            }

                }
            }
        }
        .ignoresSafeArea()
    }

}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {

    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }

}

struct CharacterListScreenUIViewControllerRepresentable: UIViewControllerRepresentable {

    let labelText: String

    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = CharacterListScreenViewController()
        vc.labelText = labelText
//        vc.view.backgroundColor = .blue
//        let label = UILabel()
//        label.text = labelText
//        label.textColor = .white
//        vc.view.addSubview(label)
//        label.frame = vc.view.frame
//        let button = UIButton()
//        button.setTitle("Here my", for: .normal)
//        vc.view.addSubview(button)
//        button.frame = vc.view.frame
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }



}
