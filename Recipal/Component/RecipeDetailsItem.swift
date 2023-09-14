//
//  RecipeDetailsItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RecipeDetailsItem: View {
    var body: some View {
        ZStack{
            Image("details placeholder")
                .resizable()
                
            WhiteGradient()
            VStack{
                Spacer()
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "restart.circle.fill")
                            .resizable()
                            .foregroundColor(Color("MainColor"))
                            .frame(width: 60,height: 60)
                            .background(.white)
                            .cornerRadius(30)
                    }
                    Spacer()
                }//HStack
                
                HStack{
                    Text("Grilled meat Skewers")
                        .lineLimit(2)
                        .font(.system(size: 28))
                        
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack{
                            Image(systemName: "heart")
                                .font(.title3)
                        }//VStack for fav button
                        .frame(width: 60, height: 60)
                        .background(Color("MainColor"))
                        .cornerRadius(10)
                    }
                }//HStack
                .fontWeight(.heavy)
                


                HStack{
                    Image("knife_fork")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Paki Food")
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Image("fork-and-knife-with-plate")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("servings: 4")
                        .fontWeight(.light)
                    Spacer()
                }//HStack
                .padding(.bottom, 10)
                
                
            }//VStack
            .padding(.horizontal, 20)
            .foregroundColor(.white)
        } //ZStack
        .frame(height: 320)
        
    }
}

struct RecipeDetailsItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsItem()
    }
}
