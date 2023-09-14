//
//  HomeView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct HomeView: View {
    @State var selectedCategory : Category = categoriesData[0]
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Categories")
                    .fontWeight(.heavy)
                    .font(.system(size: 26))
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal, 10)
                
                
                HStack{
                    ForEach(categoriesData){ category in
                        
                        VStack{
                            Image(category.image)
                                .frame(width: UIScreen.main.bounds.width/6, height: 60)
                                .padding(.horizontal,0.5)
                                .padding(.vertical, 5)
                                .background(
                                    category == selectedCategory ? Color("MainColor") : .gray.opacity(0.2)
                                )
                                        
                                .cornerRadius(25)
                            Text(category.title)
                        }// end of VStack
                        .onTapGesture {
                           selectedCategory = category
                        }
                        
                    }// end of for
                }//end of HStack
                    
                .frame(height: 120)
                .padding(.horizontal, 10)
                
                
                ScrollView (.vertical, showsIndicators: false){
                    ForEach(1..<10){i in
                        NavigationLink {
                            DetailsView()
                        } label: {
                            RecipeItem()
                        }
                    }// end of for
                }//vertical ScrollView
            }// outer VStack
            
        }//NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
