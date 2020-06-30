//
//  AlertViewReservation.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 17/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct AlertViewReservation: View {
    var body: some View {
              ZStack{
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.white)
            .frame(width: screen.width-40, height: screen.height/13)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke()
                .fill(Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)))
                .frame(width: screen.width-40, height: screen.height/13)
        Text("You already have a reservation for this place")
        }.shadow(color: Color(#colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)).opacity(0.5), radius: 20, x: 0, y: 20)
    }
}

struct AlertViewReservation_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewReservation()
    }
}
