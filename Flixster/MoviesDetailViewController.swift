//
//  MoviesDetailViewController.swift
//  Flixster
//
//  Created by Anthony Pena on 7/10/21.
//

import UIKit
import AlamofireImage

class MoviesDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        let posterUrl = URL(string: baseUrl + posterPath)
        
        titleLabel.text = title
        overviewLabel.text = overview
        posterView.af_setImage(withURL: posterUrl!)
        backdropImageView.af.setImage(withURL: backdropUrl!)
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
