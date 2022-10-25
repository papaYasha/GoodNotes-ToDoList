//
//  SketchForDataPicker.swift
//  GoodNotes-TDL
//
//  Created by student on 25.10.22.
//

import SwiftUI

struct SketchForDataPicker: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }
}

struct SketchForDataPicker_Previews: PreviewProvider {
    static var previews: some View {
        SketchForDataPicker()
    }
}
