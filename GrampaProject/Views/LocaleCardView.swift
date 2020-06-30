//
//  LocaleView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 28/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import Combine

struct LocaleCardView: View {
    @EnvironmentObject var loaded : Variables
    @State var LocaleImage = UIImage(systemName: "wand.and.rays.inverse")
    @State var locale : Locale
    
    
    var body: some View {
        NavigationLink(destination: CardInfoView(buttonText: "Book a table", locale: $locale, LocaleImage: $LocaleImage)){
            ZStack {
                Image(uiImage: self.LocaleImage!)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width-41, height: 199)
                    .cornerRadius(30)
                    .clipped()
                
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
                        .frame(width: screen.width-40, height: screen.height/13)
                }
                .frame(width: screen.width-10, height: 200)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(locale.nome)
                            .bold()
                        Spacer()
                    }.padding(.horizontal)
                    HStack {
                        Text(locale.indirizzo)
                            .lineLimit(1)
                        Spacer()
                        Text("Average price \(locale.prezzomedio) €")
                    }.padding(.horizontal)
    
                }
                .padding(.horizontal,15)
                .padding(.bottom,2)
                .frame(width: screen.width-10, height: 200)
                .foregroundColor(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//            .shadow(color: Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)).opacity(0.5), radius: 20, x: 0, y: 10)
            .onAppear{
//                if(self.loaded.imageloaded == false){
                
                    print(self.locale.indirizzo)
                    print("......Loading Image......")
                    FireBaseMethods().loadImage(url: self.locale.pictureURL) { (result) in
                        switch result {
                        case .success(let datas):
                            self.LocaleImage = UIImage(data: datas)!
                            self.loaded.imageloaded = true
                            print("Image caricata")
                        case .failure(let err):
                            print(".......SEI NEL ERRORE!!.....")
                            print(err.localizedDescription)
                        }
                    }
//                }
//                else{
//                    print("--------IMAGE NON CARICATA--------")
//                    print("\(String(self.loaded.imageloaded))")
//                }
            }
        }
    }
    
    
}
