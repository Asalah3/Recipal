//
//  DetailsView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct DetailsView: View, CellDelegate {
    func renderView() {
        
    }
    
    func showToast() {
        isShowToast.toggle()
        print("toast")
    }
    
    @State var recipeID : Int = 0
    @State var isShowToast: Bool = false
    @State var scrollToTop: Int? = nil
    @StateObject var detailsVM : DetailsViewModel = DetailsViewModel(remoteDataSource: NetworkServices())
    
    func fetchRecipeDetails(recipeID: Int){
        detailsVM.fetchReceipeDetailsData(receipeId: recipeID)
        detailsVM.fetchSimilaritiesRecipeData(receipeId: recipeID)
    }

    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                
                RecipeDetailsItem(recipeName: detailsVM.fetchedReceipeDetailData?.name, recipeimage: detailsVM.fetchedReceipeDetailData?.thumbnailURL, recipeType: detailsVM.fetchedReceipeDetailData?.slug, recipeVideo: detailsVM.fetchedReceipeDetailData?.videoURL, recipeservice: detailsVM.fetchedReceipeDetailData?.numServings ?? 0)
                
                VStack(alignment: .leading){
                    Text("Ingredient")
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                    VStack(alignment: .leading){
                        ForEach(detailsVM.fetchedReceipeDetailData?.sections ?? []){ section in
                            Text(section.name ?? "")
                                .fontWeight(.heavy)
                                .font(.system(size: 18))
                            ForEach(section.components ?? []){ ingredient in
                                IngrdientItem(ingredient: ingredient.ingredient?.name ?? "")
                            }//inner for loop
                        }//outer for loop
                    }
                    .padding(.leading, 15)
                    .padding(.vertical, 5)
                    
                    Text("Instructions")
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                    ForEach(detailsVM.fetchedReceipeDetailData?.instructions ?? []){ instruction in
                        IngrdientItem(ingredient: instruction.displayText ?? "")
                    }
                    
                    
                    Text("Similar Recipes")
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(detailsVM.fetchedSimilaritiesRecipeDetailData?.results ?? []){ recipe in
                                NavigationLink {
                                    DetailsView(recipeID: recipe.id ?? recipeID)
                                } label: {
                                    RecipeItem(delegate: self, recipe: Result(videoID: recipe.videoID, name: recipe.name, originalVideoURL: recipe.originalVideoURL, numServings: recipe.numServings, keywords: "", showID: 0, canonicalID: "", inspiredByURL: recipe.videoURL, seoTitle: "", isShoppable: false, thumbnail_url: recipe.thumbnailURL, videoURL: recipe.videoURL, updatedAt: 0, yields: "", isOneTop: false, id: recipe.id, approvedAt: 0 , totalTimeMinutes: 10, slug: recipe.slug, createdAt: 0, description: recipe.description, recipes: []))
                                        .frame(width: 300)
                                }
                            }
                        }
                    }//ScrollView for similer
                    
                }// inner VStack
                .padding(.horizontal, 20)
            }// outer VStack
        }//ScrollView
        .ignoresSafeArea()
        .padding(.bottom, 1)
        .onAppear {
            fetchRecipeDetails(recipeID: recipeID)
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
