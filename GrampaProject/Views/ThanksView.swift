//
//  ThanksView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 26/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct ThanksView: View {
    
    @Binding var showModal : Bool
    @Binding var locale : Locale
    @State private var textButton = "Ok"
    @Binding var LocaleImage: UIImage?
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            Image(uiImage: #imageLiteral(resourceName: "GruppoSaltanti"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
            Text("Thank you for your reservation!")
                .font(.system(size: 24, weight: .medium))
            Text("Remember that you can delete\n or change your reservation by")
                .font(.system(size: 24, weight: .regular))
            Text(String(locale.tempocambioprenotazione))
                .font(.title)
                .padding()
            Spacer()
            
            ButtonView(buttonText: $textButton)
                .onTapGesture {
                    self.showModal = false
              
            }
            
            
            
        }
  
    }
}
//
