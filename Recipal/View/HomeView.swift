//
//  HomeView.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import SwiftUI


struct HomeView: View {
    
    @State var selectedCategory : Category = categoriesData[0]
    @State var isLoading = true
    @StateObject var homeVM : HomeViewModel = HomeViewModel(remoteDataSource: NetworkServices())
    
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
                            DetailsView()
                        } label: {
                            RecipeItem(recipe: recipe)
                            
                        }
                    }// end of for
                }//vertical ScrollView
                
                
                
                
            }// outer VStack
            .onAppear {
                fetchCategoryData(category: "middle_eastern")
            }
            
        }//NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
