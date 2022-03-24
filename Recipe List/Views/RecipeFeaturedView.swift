//
//  RecipeFeaturedView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/22/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40.0)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            // Recipe card
                            Button(action: {
                                isDetailViewShowing.toggle()
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .mask(
                                                LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                            )
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 20.0)
                                    }
                                }
                            })
                                .tag(index)
                                .sheet(isPresented: $isDetailViewShowing) {
                                    RecipeDetailView(recipe: model.recipes[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(radius: 10, x: -10, y: 10)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Preparation Time: ")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                HStack {
                    ForEach(model.recipes[tabSelectionIndex].highlights, id: \.self) { highlight in
                        Text(highlight)
                            .font(.caption)
                            .padding(.horizontal, 10.0)
                            .padding(.vertical, 5.0)
                            .background(.yellow)
                            .cornerRadius(15)
                    }
                }
            }
            .padding()
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
        
    
    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
