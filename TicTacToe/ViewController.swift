//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jamal Carter on 4/10/2017.
//  Copyright © 2017 Jamal Carter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    var gameType: String = ""
    var playerOneName: String = ""
    var playerTwoName: String = ""
    @IBOutlet var playerOneTextField: UILabel!
    @IBOutlet var playerTwoTextField: UILabel!
    
    @IBOutlet var collectionOfButtons: [UIButton]!
    
    // 1 is Xs, 2 is Os
    
    var ogFirst: Int = 0
    var activeGame = true
    
    var activePlayer: Int = 0
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - noughts, 2 - crosses
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    func setPlayerNames(){
         playerOneTextField.text! = playerOneName
         playerTwoTextField.text! = playerTwoName
    }
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 2 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 1
                
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 2
                
            }
            
            for combination in winningCombinations
            {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    
                    // We have a winner!
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    
                    if gameState[combination[0]] == 2{
                        
                        winnerLabel.text = "O has won!"
                        
                    } else if gameState[combination[0]] == 1 {
                        
                        winnerLabel.text = "X has won!"
                        
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
                
            }
            if isDraw(gameState) && activeGame {
                winnerLabel.text = "It's a draw!"
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    
                })
                
            }
            
            
        }
        
    }
    
    @IBAction func buttonPressedSinglePlayer(_ sender: AnyObject) {
        print("in single player method")
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 2 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 1
                
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 2
                
            }
            
            for combination in winningCombinations
            {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    
                    // We have a winner!
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    
                    if gameState[combination[0]] == 2{
                        
                        winnerLabel.text = "O has won!"
                        
                    } else if gameState[combination[0]] == 1 {
                        
                        winnerLabel.text = "X has won!"
                        
                    }
                    
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
                
            }
            if isDraw(gameState) {
                winnerLabel.text = "It's a draw!"
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
                activeGame = false
                UIView.animate(withDuration: 1, animations: {
    
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    
                })
                
            }
            
        }
        if activePlayer == 2 && activeGame{
            let button = cpuPlay() as UIButton!
            if button?.tag != 10{
                button?.sendActions(for: .touchUpInside)

            }

        }

    }

    func cpuPlay() ->UIButton{
        //var play: UIButton
        var unusedButtonSlots: Array<Int> = []
        var play: UIButton?
        for button in collectionOfButtons{
            
            let gameSlot = button.tag - 1
            if !gameState.contains(0){
                break
            }
            else if gameState[gameSlot] == 0 {
                unusedButtonSlots.append(gameSlot + 1)

            }
            
            
        }
        let cpuSlotSelect = Int(arc4random_uniform(UInt32(unusedButtonSlots.count )))
        if unusedButtonSlots.isEmpty{
            play = self.view.viewWithTag(10) as? UIButton
        }else{
        
            play = self.view.viewWithTag(unusedButtonSlots[cpuSlotSelect]) as? UIButton
        }
        return play!
    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        
        activeGame = true
        
        activePlayer = ogFirst
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            
            
        }
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y )
        
    }
    func isDraw(_ gState: Array<Int>) -> Bool{
        
        if !gState.contains(0) {
            return true
        }
        else {
            return false
        }
    }
    func setSinglePlayer(){

        
        for button in collectionOfButtons{
            
            button.addTarget(self, action: #selector(buttonPressedSinglePlayer(_:)), for: .touchUpInside)
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setPlayerNames()
        print("Game Type " + gameType)

        if gameType == "SINGLE_PLAYER"{
            
            setSinglePlayer()
            if activePlayer == 2{
                self.cpuPlay().sendActions(for: .touchUpInside)
            }
            
        }
        //set Game Type
        print("Button Count" + String(collectionOfButtons.count))
        //print("button TAG" + String(collectionOfButtons.sorted(by: <#T##(UIButton, UIButton) -> Bool#>)))
        print("View Cont" + String(activePlayer))
        ogFirst = activePlayer
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

