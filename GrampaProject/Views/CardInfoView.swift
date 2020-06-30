//
//  CardInfoView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 22/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//
//poter chiamare direttamente e poter aprire map direttamente

import SwiftUI

struct CardInfoView: View {
    @State var buttonText: String
    @Binding var locale: Locale
    @Binding var LocaleImage: UIImage?
    
    
    var body: some View {
        ZStack {
            
//            VStack {
//                Image(uiImage: #imageLiteral(resourceName: "Path 8 "))
//                    .frame(maxWidth: .infinity)
//                    .frame(maxHeight: screen.height/3)
//                
//                
//                Spacer()
//            }
//            .edgesIgnoringSafeArea(.top)
            
            VStack{
                VStack {
                    Image(uiImage: self.LocaleImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                         .cornerRadius(30)
                        .frame(width: screen.width-10, height: screen.height/4.28708134)
                    Spacer()
                }.frame(maxHeight: .infinity)
   
                
                Text(locale.nome)
                    .font(.title)
                    .fontWeight(.light)
                
                
                Divider()
                    .padding(.horizontal,40)
                Logos(locale: $locale)
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Speciality of the house")
                            .bold()
                            .fontWeight(.light)
                            .font(.title)
                            .padding(.top,40)
                            .padding(.trailing,70)
                            .padding(.bottom,6)
                            .padding(.leading, 40)
                        HStack {
                            if(locale.specialità == ""){
                                Text("Menu under construction")
                                    .padding(.horizontal,20)
                            }else{
                                Text(locale.specialità)
                                    .padding(.leading, 20)
                            }
                            Spacer()
                     
                        }.padding(.horizontal, 20)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
                            .padding(.trailing,28)
                    }
                    
                    
                }
                HStack{
                    VStack(alignment:.leading){
                        Text("Address")
                            .bold()
                            .fontWeight(.light)
                            .font(.title)
                            .padding(.leading,40)
                            .padding(.top,10)
                        
                        Text(locale.indirizzo)
                            .fontWeight(.light)
                            .padding(.leading,40)
                            .padding(.top,11)
                        
                        
                    }.padding(.bottom,30)
                    
                    Spacer()
                }
       
                NavigationLink(destination: BookTableView(LocaleImage: $LocaleImage, locale: $locale)) {
                    ButtonView(buttonText: $buttonText).foregroundColor(.black)
                }.padding(.bottom,45)
                
            }
        }
     
        .frame(maxWidth: .infinity)
        
    }
}


struct Logos: View {
    
    @Binding var locale : Locale
    
    var body: some View {
        HStack(alignment: .firstTextBaseline,spacing: 25) {
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "Sedia gialla "))
                    .resizable()
                    .frame(width: 30, height: 40)
                    .aspectRatio(contentMode: .fit)
                Text("\(locale.numerodiposti)")
            }
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "wall-clock copy"))  .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
//                orario di apertura a pranzo
                Text(locale.orarioaperturapranzo+"-"+locale.orariochiusurapranzo)
                Text(locale.orarioaperturacena+"-"+locale.orariochiusuracena)
                
            }
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "€"))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                Text(locale.prezzomedio)
            }
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "login"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("Indoor")
            }
//            VStack{
//                Image(systemName: "house.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 40, height: 40)
//                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
//                Text("Size: \(locale.dimensione)")
//            }
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
       CardInfoView(buttonText: "Conferm", locale: .constant(Locale(cardID: "", indirizzo: "", nome: "", tipologia: "", pictureURL: "", apertoacena: false, apertoapranzo: false, dimensione: "", durataprenotazione: 0, numeritavoli2: 0, numeritavoli4: 0, numeritavoli6: 0, tavoliPiudisei: false, numerodiposti: 0, orarioaperturacena: "", orarioaperturapranzo: "", orariochiusuracena: "", orariochiusurapranzo: "", phonenumber: "", prezzomedio: "", specialità: "", tempocambioprenotazione: 0, tempobetweenreservation: 0)), LocaleImage: .constant(UIImage(systemName: "Cornetto")))
    }
}
