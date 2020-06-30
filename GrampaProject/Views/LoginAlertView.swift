//
//  LoginAlertView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 15/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct LoginAlertView: View {
    var body: some View {
        ZStack{
            
            LoginPageView()
            VStack(alignment: .center) {
                Text("Please, complete the form if you want book a table")
                    .multilineTextAlignment(.center)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)))
                    .font(.largeTitle)
                    .padding(.top,50)
                Spacer()
            }
        }
    }
}

struct LoginAlertView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAlertView()
    }
}
