//
//  DataPickerView.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 04/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct DataPickerView: View {
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @Binding var  dateChoosed : Date
    
    var body: some View {
        
        VStack {
            DatePicker(selection: $dateChoosed,displayedComponents: .date , label: { Text("pisct sott") })
                .labelsHidden()
 
        }.frame(maxWidth: screen.width/1.3)
            .frame(maxHeight: screen.height/4)
    }
}

struct DataPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DataPickerView(dateChoosed: .constant(.distantFuture))
    }
}
