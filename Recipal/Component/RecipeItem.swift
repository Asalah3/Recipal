//
//  RecipeItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RecipeItem: View {
    var recipe : Result?
    @State var imageURl : URL?
    var body: some View {
        ZStack{
            
            //Loading recipe image
            AsyncImage(url:  imageURl){ phase in
                switch phase{
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    Image("recipe")
                        .resizable()
                @unknown default:
                    fatalError("unexpected image")
                }
            }
            
            RectangleGradientGroup()
            
            //Recipe information
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
                
                VStack(alignment: .leading, spacing: 8){
                    Text(recipe?.name ?? "no data")
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.heavy)
                        .font(.system(size: 18))
                    Text(recipe?.slug ?? "no data")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .lineLimit(1)
                    
                    HStack(alignment: .top){
                        Image("knife_fork")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(recipe?.description ?? "no data")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }//HStack for cook
                    
                    HStack{
                        Image("fork-and-knife-with-plate")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("servings:" + String(recipe?.numServings ?? 0))
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
        .onAppear {
            imageURl = URL(string: recipe?.thumbnail_url ?? "")
        }
    }
}


struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem()
    }
}
