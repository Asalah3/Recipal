//
//  DetailsView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    RecipeDetailsItem()
                    VStack(alignment: .leading){
                        Text("Ingredient")
                            .fontWeight(.heavy)
                            .font(.system(size: 24))
                        ForEach(1..<3){ similarCateg in
                            IngrdientItem(ingredient: "Chicken")
                        }
                        
                        
                        Text("Instructions")
                            .fontWeight(.heavy)
                            .font(.system(size: 24))
                        ForEach(1..<3){ similarCateg in
                            IngrdientItem(ingredient: "you can first put them in mixer and then you can put them in microwave")
                        }
                        
                        
                        Text("Similar Recipes")
                            .fontWeight(.heavy)
                            .font(.system(size: 24))
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(1..<5){ similarCateg in
                                    RecipeItem()
                                        .frame(width: 300)
                                }
                            }
                        }//ScrollView for similer
                        
                    }// inner VStack
                    .padding(.horizontal, 20)
                }// outer VStack
            }//ScrollView
            .ignoresSafeArea()
            .padding(.bottom, 1)
        }
    }
        
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
