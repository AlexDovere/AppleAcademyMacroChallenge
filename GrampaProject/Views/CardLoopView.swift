//
//  HomeView2.0.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 28/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct CardLoopView: View {
    @State var localiFiltrati = [Locale]()
    @State var tipo : String
    @EnvironmentObject var loaded : Variables
    @State var HorizontalAlignment : Bool
    var body: some View {
        
        
        VStack {
            HStack {
                Text(tipo)
                    .font(.largeTitle)
                    .padding(.leading,20)
                
                Spacer()
            }
            if HorizontalAlignment{
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(localiFiltrati){ locali in
                            GeometryReader{ geometry in
                                LocaleCardView(locale: locali)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: screen.width, height: 220)
                        }
                    }
                    Spacer()
                }
                .frame(width: screen.width, height: 220)
            }else{
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 5) {
                    ForEach(localiFiltrati){ locali in
                        GeometryReader{ geometry in
                            LocaleCardView(locale: locali)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: screen.width, height: screen.height)
                    }
                }
                    Spacer()
                }
            .frame(height: screen.height)
            
            }
            Spacer()
        }

        .onAppear{
          
            print("\(String(self.loaded.loaded))")
//            if (self.loaded.loaded == false){
            print(".....Loading DB.....")
            print("\(self.tipo.lowercased()) siamo prima del getCards")
            FireBaseMethods().getCards(tipo: self.tipo){
                result in
                switch result {
                case .success(let pizzerias ):
                    self.loaded.loaded = true
                    print("ooooooooooo \(pizzerias.count)")
                    self.localiFiltrati = pizzerias
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
//            }else{
//                print("----------- Non Caricato-----------")
//            }
        }
        
        
    }
}

struct PizzeriaCardView_Previews: PreviewProvider {
    static var previews: some View {
        CardLoopView(tipo: "", HorizontalAlignment: false)
    }
}
