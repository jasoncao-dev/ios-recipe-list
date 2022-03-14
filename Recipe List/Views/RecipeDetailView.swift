//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 428, height: 300, alignment: .center)
                    .clipped()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                            .padding(.vertical, 1.5)
                    }
                }
                .padding(.all)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        Text("\(index + 1). \(recipe.directions[index])")
                            .padding(.vertical, 1.5)
                    }
                }
                .padding(.all)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[1])
    }
}
