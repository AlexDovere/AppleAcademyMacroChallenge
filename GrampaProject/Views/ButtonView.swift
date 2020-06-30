//
//  ButtonView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 26/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @Binding var buttonText: String
    
    var body: some View {
        
        Text(buttonText)
            .font(.title)
            .fontWeight(.light)
            .frame(width: 328, height: 60)
            .background(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
            .cornerRadius(16)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: .constant("Button"))
    }
}
