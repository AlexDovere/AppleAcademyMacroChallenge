//
//  ResumeReservationView .swift
//  GrampaProject
//
//  Created by Alessandro dovere on 26/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.

import SwiftUI
import Firebase
import FirebaseFirestore

struct ResumeReservationView: View {

    @EnvironmentObject var variables : Variables
    @Binding var numberOfPeople : Int
    @Binding var dateChoosed : Date
    @Binding var LocaleImage: UIImage?
    @Binding var locale: Locale
    @State private var textButton = "Send the booking"
    @State var showModal = false
    @State var prenotazioneGiaEsistente = false
    @State var showAlert = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack{
            
        VStack {
            Text("Resume of your\nreservation")
                .font(.largeTitle)
            ReservationCard(numberOfPeople: $numberOfPeople, dateChoosed: $dateChoosed, locale: $locale)
                .padding(.top,54)
            
            Spacer()
            
            
            Button(action: {
                if (self.prenotazioneGiaEsistente == false){
                self.showModal = true
                let df = DateFormatter()
                df.dateFormat = "dd-MM-YYYY"
                df.timeZone = TimeZone(abbreviation: "GMT+0:00")
                let dataString = df.string(from: self.variables.dateChoosed)
                let db = Firestore.firestore()
                db.collection("prenotazioni").addDocument(data: ["idRistorante" : self.variables.localeID,"dataScelta" : dataString, "timeSlotStartAt" : self.variables.timeSlotStartAt,"timeSlotEndAt" : self.variables.timeSlotEndAt,"numeroDiPersone" : self.variables.numberOfPeople,"IDcliente" : UserDefaults.standard.string(forKey: "IDuser") as Any])
                }else{
                    self.showAlert = true
                }
                
            }) {
                ButtonView(buttonText: $textButton).foregroundColor(.black)
            }.sheet(isPresented: self.$showModal){
                ThanksView(showModal: self.$showModal, locale: self.$locale, LocaleImage: self.$LocaleImage)
            }
        }.onTapGesture {
            self.showAlert = false
            }
            if showAlert{
                AlertViewReservation()
            }
        
        }
        .animation(.spring())
            
        .onAppear{
            
            FireBaseMethods().loadPrenotazione(prenotazioni: self.variables, locale: self.locale) { (message) in
                print(message)
                print(self.variables.prenotazioni.count)

                for i in 0..<self.variables.prenotazioni.count{
                    if (self.variables.prenotazioni[i].IDCliente == UserDefaults.standard.string(forKey: "IDuser")){
                        print("Esiste gia una prenotazione")
                        self.prenotazioneGiaEsistente = true
                    }else{
                        print("Non esiste nessuna prenotazione")
                        
                    }
                    print(self.variables.prenotazioni[i].IDCliente)
                }
            }
            
            self.variables.localeID = self.locale.cardID
            self.variables.dateChoosed = self.dateChoosed
            self.variables.numberOfPeople = self.numberOfPeople
        }
    }
}


struct ReservationCard: View {
    @EnvironmentObject var variables : Variables
    @Binding var numberOfPeople : Int
    @Binding var dateChoosed : Date
    @Binding var locale : Locale
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        return formatter
    }
    var hourFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
            
            HStack {
                VStack(spacing: 5) {
                    HStack {
                        Text(locale.nome)
                            .font(.title)
                            .padding(.horizontal)
                        Spacer( )
                    }.frame(maxWidth:.infinity)
                    HStack {
                        Text(locale.indirizzo)
                            .padding(.top,15)
                            .padding(.horizontal)
                        Spacer()
                    }.frame(maxWidth:.infinity)
                    HStack {
                        Text("Date:")
                        
                        
                        Text("\(dateChoosed,formatter: dateFormatter )")
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding(.top,56)
                    .padding(.horizontal)
                    .frame(maxWidth:.infinity)
                    HStack {
                        Text("People:")
                        Text(String(self.numberOfPeople))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.horizontal).frame(maxWidth:.infinity)
                    HStack {
                        Text("Time slot:")
                        Text("\(self.variables.timeSlotStartAt) - \(self.variables.timeSlotEndAt)")
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding(.horizontal).frame(maxWidth:.infinity)
                }
                Spacer()
            }.frame(maxWidth:.infinity)
            
        }.frame(width: 309, height: 258)
    }
}
