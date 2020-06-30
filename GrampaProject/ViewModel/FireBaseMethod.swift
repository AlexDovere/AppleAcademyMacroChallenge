//
//  FireBaseMethod.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 28/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct FireBaseMethods {
    
    func loadPrenotazione(prenotazioni : Variables,locale: Locale,completion: @escaping (_ message: String) -> Void){
        let db = Firestore.firestore()
        print(" siamo nel load prenotazioni e stampiamo il cardID : \(locale.cardID)")
        db.collection("prenotazioni").whereField("idRistorante", isEqualTo: locale.cardID).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                
            }
            else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    prenotazioni.prenotazioni = []
                    for document in snapshot!.documents{
                        var prenotazione = PrenotazioneStruct()
                        
                        if let IDCliente = document.get("IDcliente") as? String{
                            prenotazione.IDCliente = IDCliente
                        }
                        if let Datascelta = document.get("dataScelta") as? String {
                            prenotazione.DataScelta = Datascelta
                        }
                        if let NumPersone = document.get("numeroDiPersone") as? Int {
                            prenotazione.NumPersone = NumPersone
                        }
                        if let PrenotazioniInizia = document.get("timeSlotStartAt") as? String {
                            prenotazione.PrenotazioneIniziaA = PrenotazioniInizia
                        }
                        if let PrenotazioneFinisce = document.get("timeSlotEndAt") as? String {
                            prenotazione.PrenotazioneFinisceA = PrenotazioneFinisce
                        }
                        
                        prenotazioni.prenotazioni.append(prenotazione)
                        
                        
                    }}
            }
            completion("DONE")
            
        }
        
    }
    
    
    func stringToDate(stringa: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "GMT+0:00")!
        var date = dateFormatter.date(from: stringa)!
        print("la nostra data : \(date)")
        print("i nostri minuti : \(calendar.component(.minute, from: date))")
        print("i nostri componenti nel FireBaseMethods: \(calendar.component(.hour, from: date))")
        if (calendar.component(.hour, from: date) < 5){
            let newdate = calendar.date(byAdding: .day, value: 1, to: date)
            date = newdate!
        }
        
        return date
    }
    
    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        print("url....... \(url)")
        let imageRef = Storage.storage().reference(forURL: url)
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                completion(.success(data))
            } else { return }
        }
    }
    
    
    func getCards(tipo: String,completion: @escaping (Result<[Locale], Error>) -> () ){
        
        let fireStoreDB = Firestore.firestore()
        var cardID = ""
        var indirizzo = ""
        var nome = ""
        var dimensione = ""
        var tipologia = ""
        var localePicture = ""
        var apertoacena = false
        var apertoapranzo = false
        var durataprenotazione = 0
        var numeritavoli2 = 0
        var numeritavoli4 = 0
        var numeritavoli6 = 0
        var tavoliPiudisei = false
        var numerodiposti = 0
        var orarioaperturacena = ""
        var orarioaperturapranzo = ""
        var orariochiusuracena = ""
        var orariochiusurapranzo = ""
        var phonenumber = ""
        var prezzomedio = ""
        var specialità = ""
        var tempocambioprenotazione = 0
        var tempobetweenreservation = 0
        
        print("\(tipo) siamo dentro il getCard")
        fireStoreDB.collection("locali").whereField("tipologia", isEqualTo: tipo).addSnapshotListener{ (snapshot,error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                
                var arrayPizzeria: [Locale] = []

                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    for document in snapshot!.documents{
                        if let cardid = document.documentID as? String{
                            cardID = cardid
                        }
                        if let Indirizzo = document.get("indirizzo") as? String{
                            indirizzo = Indirizzo
                        }
                        if let Nome = document.get("nome") as? String {
                            nome = Nome
                        }
                        if let Tipologia = document.get("tipologia") as? String {
                            tipologia = Tipologia
                        }
                        if let LocalePicture = document.get("pictureURL") as? String {
                            localePicture = LocalePicture
                        }
                        if let Apertoacena = document.get("apertoacena") as? Bool {
                            apertoacena = Apertoacena
                        }
                        if let Apertoapranzo = document.get("apertoapranzo") as? Bool {
                        apertoapranzo = Apertoapranzo
                        }
                        if let Dimensione = document.get("dimensione") as? String {
                            dimensione = Dimensione
                        }
                        if let Durataprenotazioni = document.get("durataprenotazione") as? Int {
                            durataprenotazione = Durataprenotazioni
                        }
                        if let Numerotavoli2 = document.get("numerotavoli2") as? Int {
                            numeritavoli2 = Numerotavoli2
                        }
                        if let Numerotavoli4 = document.get("numerotavoli4") as? Int {
                            numeritavoli4 = Numerotavoli4
                        }
                        if let Numerotavoli6 = document.get("numerotavoli6") as? Int {
                            numeritavoli6 = Numerotavoli6
                        }
                        if let Tavolipiudisei = document.get("tavolipiùda6") as? Bool {
                            tavoliPiudisei = Tavolipiudisei
                        }
                        if let Numerodiposti = document.get("numposti") as? Int {
                            numerodiposti = Numerodiposti
                        }
                        if let Orarioaperturacena = document.get("orarioaperturacena") as? String {
                            orarioaperturacena = Orarioaperturacena
                        }
                        if let Orarioaperturapranzo = document.get("orarioaperturapranzo") as? String{
                            orarioaperturapranzo = Orarioaperturapranzo
                        }
                        if let Orariochiusuracena = document.get("orariochiusuracena") as? String {
                            orariochiusuracena = Orariochiusuracena
                        }
                        if let Orariochiusurapranzo = document.get("orariochiusurapranzo") as? String {
                            orariochiusurapranzo = Orariochiusurapranzo
                        }
                        if let Phonenumber = document.get("phonenumber") as? String {
                            phonenumber = Phonenumber
                        }
                        if let Prezzomedio = document.get("prezzomedio") as? String {
                            prezzomedio = Prezzomedio
                        }
                        if let Specialità = document.get("specialità") as? String {
                            specialità = Specialità
                        }
                        if let Tempocambioprenotazione = document.get("tempocambioprenotazione") as? Int {
                            tempocambioprenotazione = Tempocambioprenotazione
                        }
                        if let Tempobetweenreservation = document.get("timebetweenreservation") as? Int {
                            tempobetweenreservation = Tempobetweenreservation
                        }
                        
                        
                        
                        let pizzeriaToAdd : Locale = Locale(cardID: cardID, indirizzo: indirizzo, nome: nome, tipologia: tipologia, pictureURL: localePicture, apertoacena: apertoacena, apertoapranzo: apertoapranzo, dimensione: dimensione, durataprenotazione: durataprenotazione, numeritavoli2: numeritavoli2, numeritavoli4: numeritavoli4, numeritavoli6: numeritavoli6, tavoliPiudisei: tavoliPiudisei, numerodiposti: numerodiposti, orarioaperturacena: orarioaperturacena, orarioaperturapranzo: orarioaperturapranzo, orariochiusuracena: orariochiusuracena, orariochiusurapranzo: orariochiusurapranzo, phonenumber: phonenumber, prezzomedio: prezzomedio, specialità: specialità, tempocambioprenotazione: tempocambioprenotazione, tempobetweenreservation: tempobetweenreservation)
                        arrayPizzeria.append(pizzeriaToAdd)
                    }
                    
                    print("------------ \(arrayPizzeria.count)---------")

                    
                    DispatchQueue.main.async() {
                        completion(.success(arrayPizzeria))
                    }
                }
            }
        }
    }
    
//       funzione che da tutto i file nel database
    
    func getLocals(completion: @escaping (Result<[Locale], Error>) -> () ){
        
        let fireStoreDB = Firestore.firestore()
        var cardID = ""
        var indirizzo = ""
        var nome = ""
        var tipologia = ""
        var localePicture = ""
        var apertoacena = false
        var apertoapranzo = false
        var dimensione = ""
        var durataprenotazione = 0
        var numeritavoli2 = 0
        var numeritavoli4 = 0
        var numeritavoli6 = 0
        var tavoliPiudisei = false
        var numerodiposti = 0
        var orarioaperturacena = ""
        var orarioaperturapranzo = ""
        var orariochiusuracena = ""
        var orariochiusurapranzo = ""
        var phonenumber = ""
        var prezzomedio = ""
        var specialità = ""
        var tempocambioprenotazione = 0
        var tempobetweenreservation = 0
        
        var arrayPizzeria: [Locale] = []
        fireStoreDB.collection("locali").addSnapshotListener{ (snapshot,error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                    if snapshot?.isEmpty != true && snapshot != nil{
                        for document in snapshot!.documents{
                            if let cardid = document.documentID as? String{
                                cardID = cardid
                            }
                            if let Indirizzo = document.get("indirizzo") as? String{
                                indirizzo = Indirizzo
                            }
                            if let Nome = document.get("nome") as? String {
                                nome = Nome
                            }
                            if let Tipologia = document.get("tipologia") as? String {
                                tipologia = Tipologia
                            }
                            if let LocalePicture = document.get("pictureURL") as? String {
                                localePicture = LocalePicture
                            }
                            if let Apertoacena = document.get("apertoacena") as? Bool {
                                apertoacena = Apertoacena
                            }
                            if let Apertoapranzo = document.get("apertoapranzo") as? Bool {
                            apertoapranzo = Apertoapranzo
                            }
                            if let Dimensione = document.get("dimensione") as? String {
                                dimensione = Dimensione
                            }
                            if let Durataprenotazioni = document.get("durataprenotazioni") as? Int {
                                durataprenotazione = Durataprenotazioni
                            }
                            if let Numerotavoli2 = document.get("numerotavoli2") as? Int {
                                numeritavoli2 = Numerotavoli2
                            }
                            if let Numerotavoli4 = document.get("numerotavoli4") as? Int {
                                numeritavoli4 = Numerotavoli4
                            }
                            if let Numerotavoli6 = document.get("numerotavoli6") as? Int {
                                numeritavoli6 = Numerotavoli6
                            }
                            if let Tavolipiudisei = document.get("tavolipiùda6") as? Bool {
                                tavoliPiudisei = Tavolipiudisei
                            }
                            if let Numerodiposti = document.get("numposti") as? Int {
                                numerodiposti = Numerodiposti
                            }
                            if let Orarioaperturacena = document.get("orarioaperturacena") as? String {
                                orarioaperturacena = Orarioaperturacena
                            }
                            if let Orarioaperturapranzo = document.get("orarioaperturapranzo") as? String{
                                orarioaperturapranzo = Orarioaperturapranzo
                            }
                            if let Orariochiusuracena = document.get("orariochiusuracena") as? String {
                                orariochiusuracena = Orariochiusuracena
                            }
                            if let Orariochiusurapranzo = document.get("orariochiusurapranzo") as? String {
                                orariochiusurapranzo = Orariochiusurapranzo
                            }
                            if let Phonenumber = document.get("phonenumber") as? String {
                                phonenumber = Phonenumber
                            }
                            if let Prezzomedio = document.get("prezzomedio") as? String {
                                prezzomedio = Prezzomedio
                            }
                            if let Specialità = document.get("specialità") as? String {
                                specialità = Specialità
                            }
                            if let Tempocambioprenotazione = document.get("tempocambioprenotazione") as? Int {
                                tempocambioprenotazione = Tempocambioprenotazione
                            }
                            if let Tempobetweenreservation = document.get("tempobetweenreservation") as? Int {
                                tempobetweenreservation = Tempobetweenreservation
                            }
                            
                            
                            
                            let pizzeriaToAdd : Locale = Locale(cardID: cardID, indirizzo: indirizzo, nome: nome, tipologia: tipologia, pictureURL: localePicture, apertoacena: apertoacena, apertoapranzo: apertoapranzo, dimensione: dimensione, durataprenotazione: durataprenotazione, numeritavoli2: numeritavoli2, numeritavoli4: numeritavoli4, numeritavoli6: numeritavoli6, tavoliPiudisei: tavoliPiudisei, numerodiposti: numerodiposti, orarioaperturacena: orarioaperturacena, orarioaperturapranzo: orarioaperturapranzo, orariochiusuracena: orariochiusuracena, orariochiusurapranzo: orariochiusurapranzo, phonenumber: phonenumber, prezzomedio: prezzomedio, specialità: specialità, tempocambioprenotazione: tempocambioprenotazione, tempobetweenreservation: tempobetweenreservation)
                            arrayPizzeria.append(pizzeriaToAdd)
                        }
                        DispatchQueue.main.async {
                            completion(.success(arrayPizzeria))
                        }
                    }
                }
            }
        }
}
