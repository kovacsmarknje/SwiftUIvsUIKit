//
//  ContentView.swift
//  PopualrMovies_SwiftUI_Demo
//
//  Created by Kovács Márk on 2025. 02. 09..
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Client()
    var body: some View {
        List(model.movies.results ?? [], id: \.id) { m in
            VStack(alignment: .leading) {
                Text(m.originalTitle ?? "")
                    .bold()
                Text(m.releaseDate ?? "")
            }
        }
        .task {
            do {
                let data = try await Client().getPopularMovies()
                self.model.movies = data
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
