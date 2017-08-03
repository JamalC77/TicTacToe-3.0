//
//  GameTypeSelectViewController.swift
//  TicTacToe
//
//  Created by Jamal Carter on 4/7/17.
//  Copyright © 2017 Appfish. All rights reserved.
//

import UIKit

class GameTypeSelectViewController: UIViewController{
    
    var gameType: NSString = ""
    
    @IBAction func singlePlayerButtonPressed(_ sender: Any) {
        print("Single Button ")
    }

    @IBAction func multiplayerButtonPressed(_ sender: Any) {
        print("Multi Button ")


    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? GameSetupViewController

        if(segue.identifier == "multiPlayerSegue"){
            controller?.gameType = "MULTI_PLAYER"

        }
        if(segue.identifier == "singlePlayerSegue"){
            controller?.gameType = "SINGLE_PLAYER"
        }
    }
    override func viewDidLoad() {
        //
    }
    override func didReceiveMemoryWarning() {
        //
    }
    
}
