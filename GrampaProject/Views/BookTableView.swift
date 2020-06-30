//
//  BookTableView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 26/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//



import SwiftUI

struct BookTableView: View {
    @EnvironmentObject var variables : Variables
    @Binding var LocaleImage: UIImage?
    @Binding var locale: Locale
    @State private var buttonText = "Confirm"
    @State var imageTapped1 = false
    @State var imageTapped2 = false
    @State var imageTapped3 = false
    @State var imageTapped4 = false
    @State var imageTapped5 = false
    @State var numberOfPeople = 0
    @State var  dateChoosed = Date()
    @State var showDataPicker = false
    @State var righePranzo = 0
    @State var righeCena = 0
    @State var temp1 = -1
    @State var temp2 = -1
    @State var index = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    

    var body: some View {
        ZStack {
          
            if (self.showDataPicker ||  self.variables.tapped){
                Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
            }
            VStack(spacing: 10) {                
                HStack{
                    Text("Choose the date")
                    Spacer()
                    HStack {
                        Text("\(dateChoosed,formatter: dateFormatter )")
                        Button(action: {self.showDataPicker = true}) {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)))
                        }
                        
                    }
                    
                }.padding()
                HStack {
                    Text("How many people ?")
                        .padding()
                    Spacer()
                }.frame(maxWidth: .infinity)
                    .padding(.top,20)
                
//                SEAT TAP ROW --------------------------------------------------
                SeatTap(imageTapped1: self.$imageTapped1, imageTapped2: self.$imageTapped2, imageTapped3: self.$imageTapped3, imageTapped4: self.$imageTapped4, imageTapped5: self.$imageTapped5, numberOfPeople: self.$numberOfPeople)
                
                Divider()
                    
                    .padding(.horizontal)
                //                -------------------------------------------------
                
                HStack {
                    
                    
                    
                    Text("Choose the time slot")
                        .padding()
                        .padding(.top,20)
    
                    Spacer()
                    Button(action: {self.variables.tapped = true}) {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)))
                    }
                    .padding(.trailing,16)
                    
                }
                .frame(maxWidth: .infinity)
                
                Image(uiImage: #imageLiteral(resourceName: "GruppoPNGGrampa"))
                
                VStack {
                    Spacer()
                    if(UserDefaults.standard.string(forKey: "IDuser") != nil){
                        NavigationLink(destination: ResumeReservationView(numberOfPeople: $numberOfPeople, dateChoosed: $dateChoosed, LocaleImage: $LocaleImage, locale: $locale)) {
                            ButtonView(buttonText: $buttonText)
                                .foregroundColor(.black)
                            
                            
                        }
                        .padding(.bottom,5)
                        .shadow(radius: self.showDataPicker ? 0.001 : 0)
                    }else{
                        NavigationLink(destination: LoginPageView()) {
                            ButtonView(buttonText: $buttonText)
                                .foregroundColor(.black)
                            
                            
                        }
                        .padding(.bottom,5)
                        .shadow(radius: self.showDataPicker ? 0.001 : 0)
                        
                    }
                    
                    
                }
                
                
                Spacer()
            }
            .navigationBarTitle(Text("Book a table")
            .font(.largeTitle))
                
            .background(Color.white)
            .scaleEffect((self.showDataPicker ||  self.variables.tapped) ? 0.88 : 1 )
            .blur(radius: (self.showDataPicker ||  self.variables.tapped) ? 5 : 0 )
            .cornerRadius((self.showDataPicker ||  self.variables.tapped) ? 0 : 30)
            .shadow(radius: (self.showDataPicker ||  self.variables.tapped) ? 10 : 0)
            .animation(.spring(response: 0.45, dampingFraction: 0.5, blendDuration: 0))
            
            
           
            
            if (showDataPicker || variables.tapped){
                ZStack {
                    Color.white.opacity(0.0001)
                        .onTapGesture {
                            self.showDataPicker = false
                            self.variables.tapped = false
                    }
                    if showDataPicker{
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(lineWidth: 3)
                                .fill(Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)))
                                .frame(maxWidth: screen.width/1.3)
                                .frame(maxHeight: screen.height/4)
                            DataPickerView(dateChoosed: $dateChoosed)
                                .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.8))
                                .cornerRadius(30)
                        }
                        
                    }
                    if variables.tapped {
                    
                        ZStack {
                            

                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(lineWidth: 3)
                                .fill(Color(#colorLiteral(red: 1, green: 0.7428113222, blue: 0.192406714, alpha: 1)))
                                .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.8))
                            .cornerRadius(30)
                                .frame(maxWidth: screen.width/1.1)
                                .frame(maxHeight: screen.height/2)
                            ScrollView(.vertical, showsIndicators: false) {
                                SlotRectangleView(righePranzo: $righePranzo, righeCena: $righeCena, temp1: $temp1, temp2: $temp2, locale: $locale)
                                
                            }
                            .scaleEffect(0.8)
                            .frame(maxWidth: screen.width/1.1)
                            .frame(maxHeight: screen.height/2)
                            
                        }
                        
                    }
                    
                    
                }
            }
            
        
        }
        .navigationBarTitle(Text("Book a table")
        .font(.largeTitle))
        .padding(.bottom,30)
        .onAppear{
            
            if(self.locale.apertoapranzo){
                let orariochiusurapranzo = FireBaseMethods().stringToDate(stringa: self.locale.orariochiusurapranzo)
                let orarioaperturapranzo = FireBaseMethods().stringToDate(stringa: self.locale.orarioaperturapranzo)
                let numfascia = orariochiusurapranzo.timeIntervalSince(orarioaperturapranzo)
                
                self.righePranzo = Int(numfascia/TimeInterval(60 * self.locale.durataprenotazione))
                
            }
            if(self.locale.apertoacena){
                let orariochiusuracena = FireBaseMethods().stringToDate(stringa: self.locale.orariochiusuracena)
                let orarioaperturacena = FireBaseMethods().stringToDate(stringa: self.locale.orarioaperturacena)
                let numfascia = orariochiusuracena.timeIntervalSince(orarioaperturacena)
                print("orario di apertura di cena :\(orarioaperturacena)")
                print("orario di chiusura cena :\(orariochiusuracena)")
                print("numero di fasce: \(numfascia)")
                self.righeCena = Int(numfascia/TimeInterval(60 * self.locale.durataprenotazione))
                
            }
        }
        
    }
}


let screen = UIScreen.main.bounds


struct BookTableView_Previews: PreviewProvider {
    static var previews: some View {
        BookTableView(LocaleImage: .constant(UIImage(systemName: "Cornetto")), locale: .constant(Locale(cardID: "", indirizzo: "", nome: "", tipologia: "", pictureURL: "", apertoacena: false, apertoapranzo: false, dimensione: "", durataprenotazione: 0, numeritavoli2: 0, numeritavoli4: 0, numeritavoli6: 0, tavoliPiudisei: false, numerodiposti: 0, orarioaperturacena: "", orarioaperturapranzo: "", orariochiusuracena: "", orariochiusurapranzo: "", phonenumber: "", prezzomedio: "", specialità: "", tempocambioprenotazione: 0, tempobetweenreservation: 0)),righePranzo: 2, righeCena: 2 )
    }
}



