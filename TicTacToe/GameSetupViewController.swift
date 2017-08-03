//
//  GameSetupViewController.swift
//  TicTacToe
//
//  Created by Jamal Carter on 4/7/17.
//  Copyright © 2017 Appfish. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController,UITextFieldDelegate{
    
    var gameType: String = ""

    
    @IBOutlet var gameTypeLabel: UILabel!
    
    @IBOutlet var playerTwoTypeLabel: UILabel!
    
    @IBOutlet var segmentCtrl: UISegmentedControl!
    
    @IBOutlet var playerOneTextField: UITextField!
    @IBOutlet var playerTwoTextField: UITextField!
    var playerOneName: String = ""
    var playerTwoName: String = ""

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setPlayerNames()
        playerOneTextField.resignFirstResponder()
        playerTwoTextField.resignFirstResponder()
    }
    
    func setPlayerNames(){
        playerOneName = playerOneTextField.text!
        playerTwoName = playerTwoTextField.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.setPlayerNames()
        self.view.endEditing(true)
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ViewController
        
        if segue.identifier == "mainGameSegue"{
            controller?.gameType = gameType
            controller?.playerOneName =  playerOneName
            controller?.playerTwoName = playerTwoName
            controller?.activePlayer = segmentCtrl.selectedSegmentIndex + 1
            print("ACTIVE PLAYER" + String(controller!.activePlayer))
            
        }
    }
    override func viewDidLoad() {
        if(gameType == "SINGLE_PLAYER"){
            gameTypeLabel.text = "Single Player"
            playerTwoTypeLabel.text = "Computer"
        }else if(gameType == "MULTI_PLAYER"){
            gameTypeLabel.text = "Multiplayer"
            playerTwoTypeLabel.text = "Player 2"
            
        }
    }
    override func didReceiveMemoryWarning() {
        //
    }
    
}
