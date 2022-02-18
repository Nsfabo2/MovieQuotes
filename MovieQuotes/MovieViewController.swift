//
//  MovieViewController.swift
//  MovieQuotes
//
//  Created by Najla on 12/01/2022.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var MovieTF: UITextField!
    
    @IBOutlet weak var MovieQuotes: UILabel!
    
    @IBOutlet weak var URScore: UILabel!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    var moviesList: [Movie] = []
    var score = 0
    var random = -1
    var correctAnswer = ""
    var totalScore = -1
    
    var currentQuote: Movie? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalScore = moviesList.count
        setQuiz()
    }
    
    func setQuiz(){
        if moviesList.count > 0 {
            random = Int.random(in: 0..<moviesList.count)
            currentQuote = moviesList[random]
            MovieQuotes.text = currentQuote?.quotes
            correctAnswer = currentQuote!.name
            moviesList.remove(at: random)
        }
        else{
            MovieQuotes.text = ""
            SubmitButton.isHidden = true
            MovieTF.isHidden = true
        }
        URScore.text = "Score: \(score) out of \(totalScore)"
    }
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        if let answer = MovieTF.text, answer.isEmpty == false{
            if answer == correctAnswer{
                score += 1
            }
            setQuiz()
            MovieTF.text = ""
        }
        else{
            let alert = UIAlertController(title: "Empty field", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    

}
