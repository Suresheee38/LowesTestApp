//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import UIKit

// Generic type
protocol CellViewModel {
    associatedtype Model
    func setUpWithModel(
        model: Model,
        indexpath: IndexPath
    )
}

class MovieTableViewCell: UITableViewCell {
    
    typealias Model = Movie?
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
}

/// MARK:- CellViewModel Methods
extension MovieTableViewCell: CellViewModel {
    func setUpWithModel(
        model: Movie?,
        indexpath: IndexPath
    ) {
        guard let model = model, !model.results.isEmpty else {
            return
        }
        let result = model.results[indexpath.row]
        titleLabel.text = result.originalTitle
        descriptionLabel.text = result.releaseDate
        ratingLabel.text = "\(result.voteAverage ?? 0)"
    }
}
