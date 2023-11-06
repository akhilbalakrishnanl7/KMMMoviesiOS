//
//  ContentView.swift
//  Movie
//
//  Created by Akhil.b on 06/11/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    let gridColumns:[GridItem] = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 16) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MovieGridItem(movie: movie)
                    }
                }
                .padding(.horizontal, 12)
            }
            .navigationTitle("Movies")
        }
        .task {
        await viewModel.loadMovies()
        }
    }
}

#Preview {
    HomeScreen()
}
