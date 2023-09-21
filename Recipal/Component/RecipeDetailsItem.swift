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
    var recipeId : Int = 0
    var recipeDescription : String = ""
    
    var delegate: CellDelegate?
    @State private var showAlert: Bool = false
    @State var imageURl : URL?
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var favouriteViewModel : FavouriteViewModel
    @State var isFavourite: Bool = false
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
                        if isFavourite == true {
                           showAlert.toggle()
                        }else{
                            let recipe = Result(videoID: nil, name: recipeName, originalVideoURL: nil, numServings: recipeservice, keywords: nil, showID: nil, canonicalID: nil, inspiredByURL: nil, seoTitle: nil, isShoppable: nil, thumbnail_url: recipeimage, videoURL: nil, updatedAt: nil, yields: nil, isOneTop: nil, id: recipeId, approvedAt: nil, totalTimeMinutes: nil, slug: recipeType, createdAt: nil, description: recipeDescription, recipes: nil)
                            favouriteViewModel.createFavouriteRecipe(context: viewContext, favouriteRecipe: recipe)
                            delegate?.showToast()
                            isFavourite = true
                        }
                    } label: {
                        VStack{
                            Image(systemName: (isFavourite ) ? "heart.fill" : "heart")
                                .font(.title3)
                        }//VStack for fav button
                        .frame(width: 40, height: 40)
                        .background(Color("MainColor"))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .cornerRadius(10)
                    }.alert("Warrning", isPresented: $showAlert) {
                        Button("Delete", role: .destructive){
                            favouriteViewModel.deleteFavouriteRecipeByName(favouriteName: recipeName ?? "", context: viewContext)
                            self.delegate?.renderView()
                            showAlert.toggle()
                            isFavourite.toggle()
                        }
                    } message: {
                        Text("Do you want to delete this Recipe")
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
        .onAppear{
            isFavourite = favouriteViewModel.checkIfRecipeInserted(favouriteId: "\(recipeId)", context: viewContext)
            print("is fav \(isFavourite)")
        }
        
    }
}

struct RecipeDetailsItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsItem()
    }
}
