//
//  IngrdientItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 14/09/2023.
//

import SwiftUI

struct IngrdientItem: View {
    var ingredient : String
    var body: some View {
        HStack(alignment: .top){
            Circle()
                .foregroundColor(Color("MainColor"))
                .frame(width: 20, height: 20)
            Text(ingredient)
            
        }
    }
}

struct IngrdientItem_Previews: PreviewProvider {
    static var previews: some View {
        IngrdientItem(ingredient: "dsfdf dgf")
    }
}
