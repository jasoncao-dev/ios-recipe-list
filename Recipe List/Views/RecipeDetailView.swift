//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedSevingSize = 2
    
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
                
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.leading, .top])
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(.headline)
                    Picker("Serving Size: ", selection: $selectedSevingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServing: selectedSevingSize) + " " + item.name.lowercased())
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[1])
    }
}
