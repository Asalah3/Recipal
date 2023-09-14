//
//  RectangleGroup.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RectangleGradientGroup: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(LinearGradient(colors: [.black.opacity(0.1), .black.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                
        } //HStack
        .frame(height: 180 ,alignment: .center)
        
    }
}

struct RectangleGroup_Previews: PreviewProvider {
    static var previews: some View {
        RectangleGradientGroup()
    }
}
