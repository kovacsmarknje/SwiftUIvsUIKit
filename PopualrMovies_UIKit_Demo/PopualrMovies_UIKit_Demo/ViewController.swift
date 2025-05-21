//
//  ViewController.swift
//  PopualrMovies_UIKit_Demo
//
//  Created by Kovács Márk on 2025. 02. 09..
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = PopularMoviesResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
        // Do any additional setup after loading the view.
    }
    
    private func fetchMovies() {
        Task {
            do {
                movies = try await Client.shared.getPopularMovies()
                DispatchQueue.main.async {
                    //print(self.movies)
                    self.tableView.reloadData()
                }
            } catch {
                print("Failed to fetch posts: \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = movies.results?[indexPath.row]
        cell.textLabel?.text = movie?.title ?? ""
        cell.detailTextLabel?.text = movie?.releaseDate ?? ""
        return cell
    }
    
}

