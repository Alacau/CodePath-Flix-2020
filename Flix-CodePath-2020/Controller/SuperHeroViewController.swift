//
//  SuperHeroViewController.swift
//  Flix-CodePath-2020
//
//  Created by Alan Cao on 6/14/20.
//

import UIKit

class SuperHeroViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var movies = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        API.shared.fetchSuperheroMovies { (movies) in
            self.movies = movies!
            self.collectionView.reloadData()
        }
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        let width = view.frame.width / 3
        layout.itemSize = CGSize(width: width - layout.minimumInteritemSpacing, height: width * 3 / 2)
    }
}

extension SuperHeroViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! MovieGridCell
        let movie = movies[indexPath.item]
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let imageURL = movie["poster_path"] as? String ?? ""
        if let posterImageURL = URL(string: baseURL + imageURL) {
            cell.posterImageView.af_setImage(withURL: posterImageURL)
        }
        return cell
    }
}

extension SuperHeroViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        let controller = segue.destination as! MovieDetailsViewController
        controller.movie = movie
    }
}
