//
//  MovieGridItem.swift
//  Movie
//
//  Created by Akhil.b on 06/11/23.
//

import SwiftUI
import movies

struct MovieGridItem: View {
    
    let movie:Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                AsyncImage(url: URL(string: movie.imageUrl)) { image in
                   image.resizable()
                }placeholder: {
                    Color.gray
                }
                
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black.opacity(0.7))
                Image(systemName: "play.fill")
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(movie.title)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .lineLimit(1)
            
            Text(movie.releaseDate)
                .font(.caption)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 260)
        
    }
}

#Preview {
    MovieGridItem(movie: sampleMovie)
}
