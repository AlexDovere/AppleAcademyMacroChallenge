//
//  SeatTap.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 10/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct SeatTap: View {
    @Binding var imageTapped1: Bool
    @Binding var imageTapped2: Bool
    @Binding var imageTapped3: Bool
    @Binding var imageTapped4: Bool
    @Binding var imageTapped5: Bool
    @Binding var numberOfPeople : Int
    
    var body: some View {
        HStack(spacing: 40) {
            Image(uiImage: self.imageTapped1 ?#imageLiteral(resourceName: "Sedia gialla "):#imageLiteral(resourceName: "Sedia nera"))
                .scaleEffect(self.imageTapped1 ? 1.2 : 1)
                .shadow(radius: self.imageTapped1 ? 1.3 : 0 )
                .overlay(Text("1")
                    .scaleEffect(self.imageTapped1 ? 1.5 : 1)
                    .foregroundColor(.white)
                    .offset(y: -16)
                    
            )
                .onTapGesture {
                    self.imageTapped1 = true
                    self.imageTapped2 = false
                    self.imageTapped3 = false
                    self.imageTapped4 = false
                    self.imageTapped5 = false
                    self.numberOfPeople = 1
            }
            
            Image(uiImage: self.imageTapped2 ?#imageLiteral(resourceName: "Sedia gialla "):#imageLiteral(resourceName: "Sedia nera"))
                .scaleEffect(self.imageTapped2 ? 1.2 : 1)
                .shadow(radius: self.imageTapped2 ? 1.3 : 0 )
                .overlay(Text("2")
                    .scaleEffect(self.imageTapped2 ? 1.5 : 1)
                    
                    .foregroundColor(.white)
                    .offset(y: -16)
            )
                .onTapGesture {
                    self.imageTapped1 = false
                    self.imageTapped2 = true
                    self.imageTapped3 = false
                    self.imageTapped4 = false
                    self.imageTapped5 = false
                    self.numberOfPeople = 2
                    
            }
            Image(uiImage: self.imageTapped3 ?#imageLiteral(resourceName: "Sedia gialla "):#imageLiteral(resourceName: "Sedia nera"))
                .scaleEffect(self.imageTapped3 ? 1.2 : 1)
                .shadow(radius: self.imageTapped3 ? 1.3 : 0 )
                .overlay(Text("3")
                    .scaleEffect(self.imageTapped3 ? 1.5 : 1)
                    
                    .foregroundColor(.white)
                    .offset(y: -16)
            )
                .onTapGesture {
                    self.imageTapped1 = false
                    self.imageTapped2 = false
                    self.imageTapped3 = true
                    self.imageTapped4 = false
                    self.imageTapped5 = false
                    self.numberOfPeople = 3
                    
            }
            Image(uiImage: self.imageTapped4 ?#imageLiteral(resourceName: "Sedia gialla "):#imageLiteral(resourceName: "Sedia nera"))
                .scaleEffect(self.imageTapped4 ? 1.2 : 1)
                .shadow(radius: self.imageTapped4 ? 1.3 : 0 )
                .overlay(Text("4")
                    .scaleEffect(self.imageTapped4 ? 1.5 : 1)
                    
                    .foregroundColor(.white)
                    .offset(y: -16)
            )
                .onTapGesture {
                    self.imageTapped1 = false
                    self.imageTapped2 = false
                    self.imageTapped3 = false
                    self.imageTapped4 = true
                    self.imageTapped5 = false
                    self.numberOfPeople = 4
            }
            Image(uiImage: self.imageTapped5 ?#imageLiteral(resourceName: "Sedia gialla "):#imageLiteral(resourceName: "Sedia nera"))
                .scaleEffect(self.imageTapped5 ? 1.2 : 1)
                .shadow(radius: self.imageTapped5 ? 1.3 : 0 )
                .overlay(Text("5")
                    .scaleEffect(self.imageTapped5 ? 1.5 : 1)
                    
                    .foregroundColor(.white)
                    .offset(y: -16)
            )
                .onTapGesture {
                    self.imageTapped1 = false
                    self.imageTapped2 = false
                    self.imageTapped3 = false
                    self.imageTapped4 = false
                    self.imageTapped5 = true
                    self.numberOfPeople = 5
            }
            
        }
    }
}

struct SeatTap_Previews: PreviewProvider {
    static var previews: some View {
        SeatTap(imageTapped1: .constant(false), imageTapped2: .constant(false), imageTapped3: .constant(false), imageTapped4: .constant(false), imageTapped5: .constant(false), numberOfPeople: .constant(5))
    }
}
