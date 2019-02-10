//
//  MovieTableViewCell.swift
//  MoviesList - LoadMore
//
//  Created by Niso on 2/4/19.
//  Copyright © 2019 Niso. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func setCellWithValuesOf(_ movie: Movie) {
        movieTitle.text = movie.title
        movieImage.image = movie.image
    }
    
}
