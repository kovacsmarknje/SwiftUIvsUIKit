//
//  Client.swift
//  PopualrMovies_UIKit_Demo
//
//  Created by Kovács Márk on 2025. 02. 09..
//

import Foundation

class Client {
    static let shared = Client()
    
    enum NetworkError: Error {
        case invalidURL
        case requestFailed(String)
    }
    
    func getPopularMovies() async throws -> PopularMoviesResponse {
        //copy your apikey
        let apiKey = ""
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.requestFailed("Request failed")
        }
        
        return try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
    }
}
