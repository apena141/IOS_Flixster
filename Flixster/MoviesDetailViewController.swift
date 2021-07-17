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
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "youtubeSegue", sender: sender)
    }

    var movie: [String:Any]!
    var youtubeId = String()
    
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
        
        ///movie/{movie_id}/videos
        let movieId = movie["id"] as! Int
        let urlString = NSString(format: "https://api.themoviedb.org/3/movie/%d/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed", movieId) as String
        print("URL String: " + urlString)
        let url = URL(string: urlString)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let videos = dataDictionary["results"] as! [[String:Any?]]
                    let firstVideo = videos[0]
                    self.youtubeId = firstVideo["key"] as! String
             }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! YoutubeViewController
        destinationVC.id = self.youtubeId
        destinationVC.title = movie["title"] as? String
    }
}
