//
//  MoviesViewController.swift
//  Flix-CodePath-2020
//
//  Created by Alan Cao on 6/6/20.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var movies = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchNowPlaying()
    }
    
    func fetchNowPlaying() {
        API.shared.fetchMovies { (movies) in
            guard let movies  = movies else { return }
            self.movies = movies
            self.tableView.reloadData()
        }
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movies = self.movies[indexPath.row]
        cell.movieTitle.text = movies["title"] as? String ?? ""
        cell.movieDescription.text = movies["overview"] as? String ?? ""
        return cell
    }
}
