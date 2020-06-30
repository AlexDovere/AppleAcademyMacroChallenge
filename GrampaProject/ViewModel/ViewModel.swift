//
//  ViewModel.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 19/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.

import Foundation
import SwiftUI



struct Locale:Identifiable{
    
    var id = UUID()
    var cardID: String
    var indirizzo: String
    var nome: String
    var tipologia: String
    var pictureURL : String
    var apertoacena : Bool
    var apertoapranzo : Bool
    var dimensione : String
    var durataprenotazione : Int
    var numeritavoli2 : Int
    var numeritavoli4 : Int
    var numeritavoli6 : Int
    var tavoliPiudisei : Bool
    var numerodiposti : Int
    var orarioaperturacena : String
    var orarioaperturapranzo : String
    var orariochiusuracena : String
    var orariochiusurapranzo : String
    var phonenumber : String
    var prezzomedio : String
    var specialità : String
    var tempocambioprenotazione : Int
    var tempobetweenreservation : Int
    }


class Variables: ObservableObject{
    @Published var loaded = false
    @Published var imageloaded = false
    @Published var numberOfPeople = 0
    @Published var localeID = ""
    @Published var dateChoosed = Date()
    @Published var timeSlotStartAt = ""
    @Published var timeSlotEndAt = ""
    @Published var tapped = false
    @Published var showModal = false
    @Published var prenotazioni : [PrenotazioneStruct] = []
    
}

class PrenotazioneStruct{
    var IDCliente : String = ""
    var IDRistorante : String = ""
    var DataScelta : String = ""
    var NumPersone : Int = 0
    var PrenotazioneIniziaA : String = ""
    var PrenotazioneFinisceA : String = ""
}
