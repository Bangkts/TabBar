//
//  TabItem.swift
//  TabBar
//
//  Created by Nguyễn Bằng on 14/05/2021.
//

import Foundation
import UIKit

class TabItem: Identifiable {
    let id = UUID()
    let imageName: String
    var offset: CGFloat = -5
    var opacity: Double = 1

    init(imageName: String, offset: CGFloat) {
        self.imageName = imageName
        self.offset = offset
    }
    init(imageName: String) {
        self.imageName = imageName
    }
}
