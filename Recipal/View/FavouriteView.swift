//
//  FavouriteView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct FavouriteView: View, CellDelegate {
    func renderView() {
        fetchedResults = favouriteViewModel.getAllFavouriteRecipes(context: viewContext)
    }
    
    
    
    @State private var showAlert: Bool = false
    @State var fetchedResults : [FavouriteRecipe]?
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var favouriteViewModel : FavouriteViewModel
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false){
                ForEach(fetchedResults ?? []){item in
                    NavigationLink {
                        DetailsView()
                    } label: {
                        let result = Result(videoID: nil, name: item.favouriteName, originalVideoURL: nil, numServings: Int(item.favouriteServings ?? "0"), keywords: nil, showID: nil, canonicalID: nil, inspiredByURL: nil, seoTitle: nil, isShoppable: nil, thumbnail_url: item.favouriteImage, videoURL: nil, updatedAt: nil, yields: nil, isOneTop: nil, id: item.favouriteId as? Int, approvedAt: nil, totalTimeMinutes: nil, slug: item.favouriteMealType, createdAt: nil, description: item.favouriteMealCheif, recipes: nil)
                        RecipeItem(delegate: self, recipe: result)
                    }
                }// end of for
            }//vertical ScrollView
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                renderView()
            }
            
            
        }//NavigationView
    }
    
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
