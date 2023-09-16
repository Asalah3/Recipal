//
//  RecipeItem.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI

struct RecipeItem: View {
    var delegate: CellDelegate?
    var recipe : Result?
    @State private var showAlert: Bool = false
    @State var imageURl : URL?
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var favouriteViewModel : FavouriteViewModel
    
    @State var isFavourite: Bool?
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
                    if isFavourite == true {
                       showAlert.toggle()
                    }else{
                        favouriteViewModel.createFavouriteRecipe(context: viewContext, favouriteRecipe: recipe!)
                        isFavourite = true
                    }
                } label: {
                    VStack{
                        Image(systemName: (isFavourite ?? false) ? "heart.fill" : "heart")
                            .font(.title3)
                    }//VStack for fav button
                    .frame(width: 40, height: 40)
                    .background(Color("MainColor"))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .cornerRadius(10)
                }.alert("Warrning", isPresented: $showAlert) {
                    Button("Delete", role: .destructive){
                        favouriteViewModel.deleteFavouriteRecipeByName(favouriteName: recipe?.name ?? "", context: viewContext)
                        self.delegate?.renderView()
                        showAlert.toggle()
                        isFavourite?.toggle()
                    }
                } message: {
                    Text("Do you want to delete this Recipe")
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
            isFavourite = favouriteViewModel.checkIfRecipeInserted(favouriteName: recipe?.name ?? "0", context: viewContext)
        }
    }
}

protocol CellDelegate{
    func renderView()
}
struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem()
    }
}
