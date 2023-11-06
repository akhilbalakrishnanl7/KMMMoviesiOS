//
//  HomeViewModel.swift
//  Movie
//
//  Created by Akhil.b on 06/11/23.
//

import Foundation
import movies

extension HomeScreen{
    @MainActor class HomeViewModel:ObservableObject{
        
        private let getMoviesUseCase = GetMoviesUseCase.init()
        
        @Published private(set) var movies:[Movie] = []
        @Published private(set) var isLoading:Bool = false
        
        private(set) var loadFinished:Bool = false
        private(set) var currentPage = 1
        
        func loadMovies() async {
            if isLoading {
                return
            }
            
            do{
                let movies = try await getMoviesUseCase.invoke(page: Int32(currentPage))
                isLoading = false
                loadFinished = movies.isEmpty
                
                currentPage += 1
                
                self.movies = self.movies + movies
                
            }catch {
                isLoading = false
                loadFinished = true
                
                print(error.localizedDescription)
            }
        }
        
    }
}
