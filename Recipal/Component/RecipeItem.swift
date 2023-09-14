//
//  RecipeItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RecipeItem: View {
    var body: some View {
        ZStack{
            Image("recipe")
                .resizable()
            RectangleGradientGroup()
            
            HStack(alignment: .top){
                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "heart")
                            .font(.title3)
                            
                    }//VStack for fav button
                    .frame(width: 40, height: 40)
                    .background(Color("MainColor"))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .cornerRadius(10)
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Veg Noodies Recipe")
                        .lineLimit(2)
                        .fontWeight(.heavy)
                        .font(.system(size: 18))
                    Text("by Qadeer Khan")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                    
                    HStack{
                        Image("knife_fork")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Paki Food")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                    }//HStack for cook
                    
                    HStack{
                        Image("fork-and-knife-with-plate")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("servings: 4")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                    }//HStack for serving
                    
                }//VStack for recipe info
                .frame(width: 150)
                .foregroundColor(.white)
                
                
            }//HStack
            .padding(.horizontal, 20)
            
        }// ZStack
        .frame(height: 180 ,alignment: .center)
        .cornerRadius(10)
        .padding(.horizontal, 10)

        

    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem()
    }
}
