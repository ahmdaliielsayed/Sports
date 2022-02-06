//
//  TeamDetailVC.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class TeamDetailVC: UIViewController {

//MARK: - Property Sectoin
    var team : Team?
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var stadiumImg: UIImageView!    
    @IBOutlet weak var teamDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
