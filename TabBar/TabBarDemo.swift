//
//  TabBarDemo.swift
//  TabBar
//
//  Created by Nguyễn Bằng on 14/05/2021.
//

import SwiftUI

struct TabBarDemo: View {

    @StateObject var tabItems = TabItems()

    var body: some View {
        ZStack {
            //View 1
            NavigationView {
                ZStack {
                    Color.gray
                    Text("Home")
                }
                .navigationBarTitle("Home")
            }
            .opacity((tabItems.selectedTabIndex == 1) ? 1 : 0)
			//View 2
            NavigationView {
                ZStack {
                    Color.gray
                    NavigationLink(destination: {
                        ZStack {
                            Color.gray
                            Text("Second Search View")
                        }.navigationBarTitle("Second View")
                    }()) {
                        Text("Search")
                    }
                }
                .navigationBarTitle("Search")
            }
            .opacity((tabItems.selectedTabIndex == 2) ? 1 : 0)
            //View 3
            NavigationView {
                ZStack {
                    Color.gray
                    Text("Add")
                }
                .navigationBarTitle("Add")
            }
            .opacity((tabItems.selectedTabIndex == 3) ? 1 : 0)
            //View 4
            NavigationView {
                ZStack {
                    Color.gray
                    Text("Favorite")
                }
                .navigationBarTitle("Favorite")
            }
            .opacity((tabItems.selectedTabIndex == 4) ? 1 : 0)
            //View 5
            NavigationView {
                ZStack {
                    Color.gray
                    Text("Profile")
                }
                .navigationBarTitle("Profile")
            }
            .opacity((tabItems.selectedTabIndex == 5) ? 1 : 0)
            TabBar(tabItems: tabItems)
        }
    }
}

struct TabBarDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabBarDemo()
    }
}
