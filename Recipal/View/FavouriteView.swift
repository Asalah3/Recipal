//
//  FavouriteView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false){
                ForEach(1..<10){i in
                    NavigationLink {
                        DetailsView()
                    } label: {
                        RecipeItem()
                    }
                }// end of for
            }//vertical ScrollView
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.inline)
            
        }//NavigationView
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
