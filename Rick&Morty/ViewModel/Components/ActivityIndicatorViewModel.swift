//
//  ActivityIndicatorViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation

class ActivityIndicatorViewModel: ObservableObject {

    @Published var currentIndex: Int = 0

    func incrementIndex() {
        currentIndex += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50), execute: {
            self.incrementIndex()
        })
    }

    func setOpacity(for index: Int) -> Double {
        let opacityOffset = Double((index + currentIndex - 1) % 11 ) / 12 * 0.9
        return 0.1 + opacityOffset
    }
    
}
