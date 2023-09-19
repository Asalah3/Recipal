//
//  RecipeDetailsItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RecipeDetailsItem: View {
    var recipeName :  String?
    var recipeimage : String?
    var recipeType : String?
    var recipeVideo : String?
    var recipeservice : Int = 0
    
    var body: some View {
        ZStack{
            //Loading recipe image
            AsyncImage(url:  URL(string: recipeimage ?? "")){ phase in
                switch phase{
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    Image("details placeholder")
                        .resizable()
                @unknown default:
                    fatalError("unexpected image")
                }
            }
            
            WhiteGradient()
            VStack{
                Spacer()
                HStack{
                    NavigationLink {
                        VedioPlayerView(vedioLink: recipeVideo ?? "")
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
                    Text(recipeName ?? "")
                        .lineLimit(2)
                        .font(.system(size: 26))
                        .frame(width: 240)
                        
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
                


                HStack(alignment: .top){
                    Image("knife_fork")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(recipeType ?? "Paki Food")
                        .fontWeight(.light)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image("fork-and-knife-with-plate")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("servings: " + String(recipeservice))
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
