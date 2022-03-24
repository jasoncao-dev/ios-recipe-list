//
//  RecipeListView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/12/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40.0)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20.0) {
                        ForEach(model.recipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe),
                                           label: {
                                HStack(spacing: 20.0) {
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5.0)
                                        .aspectRatio(contentMode: .fit)
                                    VStack(alignment: .leading, spacing: 5.0) {
                                        Text(recipe.name)
                                        HStack {
                                            ForEach(recipe.highlights, id: \.self) { highlight in
                                                Text(highlight)
                                                    .font(.caption)
                                                    .padding(.horizontal, 10.0)
                                                    .padding(.vertical, 5.0)
                                                    .background(.yellow)
                                                    .cornerRadius(15)
                                            }
                                        }
                                    }
                                    .foregroundColor(.black)
                                }
                            })
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .padding(.leading)
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
