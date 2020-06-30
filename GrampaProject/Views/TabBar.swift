//
//  TabBar.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 11/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
        ContentView().tabItem {
            Image(systemName: "house")
            Text("Home")
            
            }

        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
