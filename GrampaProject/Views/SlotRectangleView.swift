//
//  SlotRectangleView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 11/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct SlotRectangleView: View {
    
    @Binding var righePranzo : Int
    @Binding var righeCena : Int
    @Binding var temp1 : Int
    @Binding var temp2 : Int
    @Binding var locale : Locale
    @EnvironmentObject var variables : Variables
    
    var body: some View {
        VStack{
            Text("Lunch")
                .bold()
            
            
            VStack {
                ForEach(0..<self.righePranzo, id: \.self) { item in
                    
                    TimeSlotsPranzo(index: self.$temp1, locale: self.$locale)
                        .foregroundColor(.black)
                        .onTapGesture {
                            self.variables.tapped = true
                    }
                    .onAppear{
                        
                        self.temp1 = self.temp1 + 1
                        
                    }
                }
                
            }
            .padding(.bottom,40)
            
            Text("Dinner")
                .bold()
            VStack {
                ForEach(0..<self.righeCena,id: \.self){ item in
                    TimeSlotsCena(index: self.$temp2, locale: self.$locale)
                        .foregroundColor(.black)
                        .onAppear{
                            
                            self.temp2 = self.temp2 + 1
                            
                    }
                }
            }
        }
        .onAppear{
            self.temp1 = 0
            self.temp2 = 0 
        }
        .frame(maxWidth: .infinity)
    }
}

struct TimeSlotsCena: View {
    @Binding var index : Int
    @Binding var locale : Locale
    @State var now = ""
    @State var after = ""
    @EnvironmentObject var timeSlot : Variables
    @State var scale =  false
    var body: some View {
        
        
        Button(action: {
            self.timeSlot.timeSlotStartAt = self.now
            self.timeSlot.timeSlotEndAt = self.after
            self.scale.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
                self.timeSlot.tapped = false
            }
        
     
        }) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(lineWidth: 2)
                    .fill(self.scale ? Color(#colorLiteral(red: 1, green: 0.7779813409, blue: 0.2153080106, alpha: 1)): Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .scaleEffect(self.scale ? 1 : 0.99 )
                    .animation(.spring())
                HStack {
                    VStack(spacing: 8){
                        Text(now)
                        Text(after)
                        
                    }
                    HStack {
                        ForEach(0 ..< 11) { item in
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .frame(width: 2, height: 50)
                                .cornerRadius(2)
                                .foregroundColor(.green)
                                .padding(.horizontal,9)
                        }
                    }
                }
            }
            .onAppear{
                
                print(self.index)
                
                if(self.locale.apertoacena == true) {
                    
                    
                    
                    var date = FireBaseMethods().stringToDate(stringa: self.locale.orarioaperturacena)
                    
                    
                    print(self.locale.durataprenotazione)
                    print("questo è l'index \(self.index)")
                    date = date + TimeInterval(( self.index * self.locale.durataprenotazione * 60))
                    
                    if (self.index > 0){
                        date = date + TimeInterval(self.index
                            * self.locale.tempobetweenreservation * 60)
                    }
                    let date2 = date + TimeInterval(self.locale.durataprenotazione * 60)
                    
                    
                    let df = DateFormatter()
                    df.dateFormat = "HH:mm"
                    df.timeZone = TimeZone(abbreviation: "GMT+0:00")
                    self.now = df.string(from: date)
                    
                    self.after = df.string(from: date2)
                    
                }
                
                
            }
            .frame(width: UIScreen.main.bounds.width-15,height: 60)
        }
    }
}
struct TimeSlotsPranzo: View {
    @Binding var index : Int
    @Binding var locale : Locale
    @State var now = ""
    @State var after = ""
    @State var timeChoosed = ""
    @EnvironmentObject var variables : Variables
    @State var scale =  false
    
    
    var body: some View {
        
        
        Button(action: {
            self.variables.timeSlotStartAt = self.now
            self.variables.timeSlotEndAt = self.after
            self.scale.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
                self.variables.tapped = false
            }
            
            
        }) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(lineWidth: 2)
                    .fill(self.scale ? Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)): Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .scaleEffect(self.scale ? 1 : 0.99 )
                    .animation(.spring())
                
                HStack {
                    VStack(spacing: 8){
                        Text(now)
                        Text(after)
                        
                    }
                    HStack {
                        ForEach(0 ..< 11) { item in
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .frame(width: 2, height: 50)
                                .cornerRadius(2)
                                .foregroundColor(.green)
                                .padding(.horizontal,9)
                                .foregroundColor(.black)
                            
                        }
                    }
                }
            }
                
            .onAppear{
                
                print(self.index)
                
                if(self.locale.apertoapranzo == true) {
                    
                    
                    
                    var date = FireBaseMethods().stringToDate(stringa: self.locale.orarioaperturapranzo)
                    
                    
                    print(self.locale.durataprenotazione)
                    print("questo è l'index \(self.index)")
                    date = date + TimeInterval(( self.index * self.locale.durataprenotazione * 60))
                    
                    if (self.index > 0){
                        date = date + TimeInterval(self.index
                            * self.locale.tempobetweenreservation * 60)
                    }
                    let date2 = date + TimeInterval(self.locale.durataprenotazione * 60)
                    
                    
                    let df = DateFormatter()
                    df.dateFormat = "HH:mm"
                    df.timeZone = TimeZone(abbreviation: "GMT+0:00")
                    self.now = df.string(from: date)
                    
                    self.after = df.string(from: date2)
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width-15,height: 60)
        }
    }
}
//struct SlotRectangleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlotRectangleView()
//    }
//}
