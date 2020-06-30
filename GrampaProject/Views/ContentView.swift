//
//  ContentView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 11/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var categoryChoosed = 0
    @EnvironmentObject var loaded : Variables
    @State var loginpageshow = false
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if (categoryChoosed == 1 || categoryChoosed == 2 || categoryChoosed == 3){

                        if (categoryChoosed == 1){
                            CardLoopView(tipo: "Pizzeria", HorizontalAlignment: false)
                                .onAppear{
                                    self.loaded.loaded = false
                            }
                        }

                        if (categoryChoosed == 2){
                            CardLoopView(tipo: "Restaurant", HorizontalAlignment: false)
                                .onAppear{
                                self.loaded.loaded = false
                            }

                        }
                        if (categoryChoosed == 3){
                            CardLoopView(tipo: "Pub", HorizontalAlignment: false)
                                .onAppear{
                                self.loaded.loaded = false
                            }

                        }
                    }else{
                        VStack{
                            Text("")
                            CardLoopView(tipo: "Pizzeria", HorizontalAlignment: true)
                            CardLoopView(tipo: "Restaurant", HorizontalAlignment: true)
                            CardLoopView(tipo: "Pub", HorizontalAlignment: true)
                            
                            
                        }
//                        .onDisappear{
//                            if ( self.categoryChoosed == 1 || self.categoryChoosed == 2 || self.categoryChoosed == 3 ){
//                                self.loaded.loaded = false
//                            }
//                        }
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    }
                    
                }
                
                .padding(.top,screen.height/5.5)

                
//                VStack {
//                    Image(uiImage: #imageLiteral(resourceName: "Path 8 "))
//                        .frame(maxHeight: screen.height/3.5 )
//                    
//                    
//                    Spacer()
//                }.edgesIgnoringSafeArea(.top)
                VStack {
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal,20)
                        .padding(.top,2)
                    
                    Spacer()
                }
                
                VStack {
                    Picker(selection: $categoryChoosed,label: Text("Categories")){
                        Text("All").tag(0)
                        Text("Pizzeria").tag(1)
                        Text("Restaurant").tag(2)
                        Text("Pub").tag(3)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.top,50)
                        .padding(.horizontal,20)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
                    
                    Spacer()
                }
            }
            .navigationBarTitle("EasySit",displayMode: .large)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


