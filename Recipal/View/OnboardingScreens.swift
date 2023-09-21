//
//  OnboardingScreens.swift
//  Recipal
//
//  Created by Asalah Sayed on 21/09/2023.
//

import SwiftUI

struct OnboardingScreens: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        //For Slide Animation
        ZStack{
            
            if currentPage == 1{
                ScreenView(image: "image1", title: "Welcome to Recipal", details: "Explore the world of Delicious Food Recipes")
                    .transition(.scale)
            }else if currentPage == 2{
                ScreenView(image: "image2", title: "Discover Recipes", details: "Browse a variety of recipe Categories and popular recipes around the world.")
                    .transition(.scale)
            }else if currentPage == 3{
                ScreenView(image: "image3", title: "Save Your Favourites", details: "Bookmark meals that you love for quick access anytime")
                    .transition(.scale)
            }
            
            
        }//ZStack
        .overlay(
            Button(action: {
                withAnimation(.easeInOut){
                    if currentPage <= 3{
                        currentPage += 1
                    }else{
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("LightedColor"))
                    .clipShape(Circle())
                
                //Circlular Slider...
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(3))
                                .stroke(Color("AccentColor"), lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }//ZStack
                            .padding(-15)
                    )
                
            })
            .padding(.bottom,20)
            ,alignment: .bottom
        )
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens()
    }
}

struct ScreenView: View{
    var image: String
    var title: String
    var details: String
    @AppStorage("currentPage") var currentPage = 1
    var body: some View{
        VStack(spacing: 20){
            HStack{
                if currentPage == 1{
                    Text("")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)//Letter Spacing
                }else{
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }//HStack
            .foregroundColor(.black)
            .padding()
            
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            Text(details)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer(minLength: 120)
        }//VStack
    }
}
