//
//  HighlightsView.swift
//  Recipe List
//
//  Created by Jason Cao on 3/23/22.
//

import SwiftUI

struct HighlightsView: View {
    
    var recipe:Recipe
    
    var body: some View {
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
}
/*
struct HighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsView()
    }
}
*/
