//
//  TabBar.swift
//  TabBar
//
//  Created by Nguyễn Bằng on 14/05/2021.
//

import SwiftUI

struct TabBar: View {

    @ObservedObject var tabItems: TabItems

    let padding: CGFloat = 5
    let iconeSize: CGFloat = 20
    var iconFrame: CGFloat {
        (padding*2) + iconeSize
    }
    var tabItemCount: CGFloat {
        CGFloat(tabItems.items.count)
    }
    var spacing: CGFloat {
        (UIScreen.main.bounds.width - (iconFrame*tabItemCount))/(tabItemCount + 1)
    }
    var firstCenter: CGFloat {
        spacing + iconFrame/2
    }
    var stepperToNextCenter: CGFloat {
        spacing + iconFrame
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Bar(tabItems: tabItems, firstCenter: firstCenter, stepperToNextCenter: stepperToNextCenter)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                HStack(spacing: spacing) {
                    ForEach(0..<tabItems.items.count,id: \.self) {i in
                        ZStack {
                            Image(systemName: self.tabItems.items[i].imageName)
                                .resizable()
                                .foregroundColor(Color.gray)
                                .frame(width: self.iconeSize, height: self.iconeSize)
                                .opacity(self.tabItems.items[i].opacity)
                                .padding(.all,padding)
                                .background(Color.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation(Animation.easeInOut) {
                                        self.tabItems.select(i)
                                    }
                                }
                        }
                        .offset(y: self.tabItems.items[i].offset)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}
