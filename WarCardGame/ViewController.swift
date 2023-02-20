//
//  ViewController.swift
//  WarCardGame
//
//  Created by MD. SHAYANUL HAQ SADI on 19/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    var playerScore = 0
    var cpuScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dealButtonTapped(_ sender: UIButton) {
        print("deal button tapped")
        
        
        // generating random number
        let leftNumber = Int.random(in: 2...14)
        print(leftNumber)
        
        let rightNumber = Int.random(in: 2...14)
        print(rightNumber)
        
        
        // updating image
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        
        // comparing random number
        if (leftNumber > rightNumber) {
            // player wins
            playerScore += 1
            playerScoreLabel.text = String(playerScore)
        }
        else if (leftNumber < rightNumber) {
            // cpu wins
            cpuScore += 1
            cpuScoreLabel.text = String(cpuScore)
        }
        else if (leftNumber == rightNumber) {
            // tie
            playerScore -= 1
            cpuScore -= 1
            playerScoreLabel.text = String(playerScore)
            cpuScoreLabel.text = String(cpuScore)
        }
        
        
        
        // alerting the winner
        if (playerScore >= 10 && playerScore != 0 && playerScore > cpuScore) {
            // Create Player win Alert
            let dialogMessage = UIAlertController(title: "Player Won!", message: "Score: \(playerScore)", preferredStyle: .alert)
            
            // Create RESET button with action handler
            let reset = UIAlertAction(title: "RESET", style: .cancel, handler: { (action) -> Void in
                print("RESET button tapped")
                
                self.playerScore = 0
                self.cpuScore = 0
                self.playerScoreLabel.text = String(self.playerScore)
                self.cpuScoreLabel.text = String(self.cpuScore)
                
             })
            
            //Add RESET button to a dialog message
            dialogMessage.addAction(reset)

            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
        
        else if (cpuScore >= 10 && cpuScore != 0 && cpuScore > playerScore) {
            // Create CPU win Alert
            let dialogMessage = UIAlertController(title: "CPU Won!", message: "Score: \(cpuScore)", preferredStyle: .alert)
            
            // Create RESET button with action handler
            let reset = UIAlertAction(title: "RESET", style: .cancel, handler: { (action) -> Void in
                print("RESET button tapped")
                
                self.playerScore = 0
                self.cpuScore = 0
                self.playerScoreLabel.text = String(self.playerScore)
                self.cpuScoreLabel.text = String(self.cpuScore)
                
             })
            
            //Add RESET button to a dialog message
            dialogMessage.addAction(reset)

            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
            
//            playerScore = 0
//            cpuScore = 0
//            playerScoreLabel.text = String(playerScore)
//            cpuScoreLabel.text = String(cpuScore)
        }
    
        
    }
    
    
}

