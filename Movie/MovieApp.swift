//
//  MovieApp.swift
//  Movie
//
//  Created by Akhil.b on 06/11/23.
//

import SwiftUI
import movies

@main
struct MovieApp: App {
    
    init() {
        KoinHelperKt.doInitKoin()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeScreen()
            }
            .accentColor(.white)
        }
    }
}
