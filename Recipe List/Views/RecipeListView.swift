//
//  RecipeListView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/12/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe),
                               label: {
                    HStack(spacing: 20.0) {
                        
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5.0)
                            .aspectRatio(contentMode: .fit)
                        Text(recipe.name)
                    }
                })
            }.navigationTitle("All Recipes")
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
