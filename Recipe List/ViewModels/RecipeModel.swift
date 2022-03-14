//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Jason Cao on 3/12/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
}
