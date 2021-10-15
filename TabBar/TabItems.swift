//
//  TabItems.swift
//  TabBar
//
//  Created by Nguyễn Bằng on 14/05/2021.
//

import Foundation
import UIKit
import SwiftUI

class TabItems: ObservableObject {
    @Published var items: [TabItem] = [TabItem(imageName: "house", offset: -20),
                                       TabItem(imageName: "magnifyingglass"),
                                       TabItem(imageName: "plus.app"),
                                       TabItem(imageName: "heart"),
                                       TabItem(imageName: "person")]
    @Published var selectedTabIndex: CGFloat = 1

    func select(_ index: Int) {
        let tabItem = items[index]

        tabItem.opacity = 0
        tabItem.offset = 15

        withAnimation(Animation.easeInOut) {
            selectedTabIndex = CGFloat(index + 1)
            for i in 0..<items.count {
                if i != index {
                    items[i].offset = -5
                }
            }
        }
        withAnimation(Animation.easeOut(duration: 0.25).delay(0.25)) {
            tabItem.opacity = 1
            tabItem.offset = -25
        }
    }
}
