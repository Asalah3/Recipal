//
//  WhiteGradient.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct WhiteGradient: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(LinearGradient(colors: [.white.opacity(0.4), .black.opacity(0.4)], startPoint: .top, endPoint: .bottom))
                
        } //HStack
        .frame(height: 320 ,alignment: .center)
        
    }
}

struct WhiteGradient_Previews: PreviewProvider {
    static var previews: some View {
        WhiteGradient()
    }
}
