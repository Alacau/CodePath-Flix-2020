//
//  MovieDetailsViewController.swift
//  Flix-CodePath-2020
//
//  Created by Alan Cao on 6/6/20.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var backdropImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieDateLabel: UILabel!
    @IBOutlet var movieDescriptionLabel: UILabel!
    
    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL = "https://image.tmdb.org/t/p/w500"
        let imageURL = movie["poster_path"] as? String ?? ""
        let backdropImageURL = movie["backdrop_path"] as? String ?? ""
        if let backdropImageURL = URL(string: baseURL + backdropImageURL) {
            backdropImageView.af_setImage(withURL: backdropImageURL)
        }
        if let posterImageURL = URL(string: baseURL + imageURL) {
            posterImageView.af_setImage(withURL: posterImageURL)
        }
        
        movieTitleLabel.text = movie["title"] as? String
        movieDateLabel.text = movie["release_date"] as? String
        movieDescriptionLabel.text = movie["overview"] as? String
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
