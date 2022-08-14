//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import UIKit

protocol MovieDetailViewing: AnyObject {
    func loadImageViewAsync(image: Data)
    func loadViews()
}

final class MovieDetailsViewController: UIViewController {

    @IBOutlet private weak var horizontalStackView: UIStackView!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieOverViewLabel: UILabel!
    @IBOutlet private weak var movieThumbNailImageView: UIImageView!
    
    var presenter: MoviesDetailViewPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadAllViews()
    }
}

/// MARK:- MovieDetailViewing Methods
extension MovieDetailsViewController: MovieDetailViewing {
    func loadViews() {
       movieTitleLabel.text = presenter.movieTitle
       releaseDateLabel.text = presenter.movieReleaseDate
       movieOverViewLabel.text = presenter.movieOverView
    }
    
    func loadImageViewAsync(image: Data) {
        DispatchQueue.main.async() { [weak self] in
            self?.movieThumbNailImageView.image = UIImage(data: image)
        }
    }
}
