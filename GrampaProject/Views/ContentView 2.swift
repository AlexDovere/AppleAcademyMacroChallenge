//
//  ContentView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 11/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
          LoginPageView()
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
         
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


