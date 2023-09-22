//
//  HomeView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI
import SimpleToast


struct HomeView: View, CellDelegate {
    
    @State var selectedCategory : Category = categoriesData[0]
    @State var isLoading = true
    @StateObject var homeVM : HomeViewModel = HomeViewModel(remoteDataSource: NetworkServices())
    @State var isShowToast: Bool = false
    
    func renderView() {
        
    }
    
    func showToast() {
        isShowToast.toggle()
    }
    
    private let toastOptions = SimpleToastOptions(
        alignment: .bottom,
        hideAfter: 2,
        backdropColor: Color.black.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )
    
    func fetchCategoryData(category: String){
        switch category{
            case "Popular":
                homeVM.fetchHomeData(tag:"middle_eastern")
            case "Breakfast":
                homeVM.fetchHomeData(tag:"breakfast")
            case "Lunch":
                homeVM.fetchHomeData(tag:"lunch")
            case "Dinner":
                homeVM.fetchHomeData(tag:"dinner" )
            case "Dessert":
                homeVM.fetchHomeData(tag: "desserts")
            default:
                homeVM.fetchHomeData(tag: "middle_eastern")
        }
    }
    

    var body: some View {
        NavigationView{
            ZStack{
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
                                fetchCategoryData(category: category.title)
                            }
                            
                        }// end of for
                    }//end of HStack of categories
                        
                    .frame(height: 120)
                    .padding(.horizontal, 10)
                    
                    //Loading data and present it after fetching
                    ScrollView (.vertical, showsIndicators: false){
                        ForEach(homeVM.fetchedHomeData.results ?? [] ){recipe in
                            NavigationLink {
                                DetailsView(recipeID: recipe.id ?? 0)
                            } label: {
                                RecipeItem(recipe: recipe, delegate: self)
                            }
                        }// end of for
                    }//vertical ScrollView

                }// outer VStack
                .simpleToast(isPresented: $isShowToast, options: toastOptions){
                    HStack{
                        Image(systemName: "checkmark.seal")
                        Text("Recipe Added To Favourites Successfully")
                    }
                    .padding(20)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(14)
                }
                .onAppear {
                    fetchCategoryData(category: selectedCategory.title)
                }//Outer VStack
                if homeVM.isLoading {
                    Loader()
                }
                
            }//ZStack
        }//NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
