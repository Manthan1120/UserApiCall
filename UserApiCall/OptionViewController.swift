//
//  OptionViewController.swift
//  UserApiCall
//
//  Created by R86 on 30/05/23.
//

import UIKit

class OptionViewController: UIViewController {

    @IBOutlet weak var firstUserApiButton: UIButton!
    @IBOutlet weak var secondUserApiButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func firstUserApiActionButton(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "FirstUserViewController") as! FirstUserViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func secondUserApiActionButton(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "SecondUserViewController") as! SecondUserViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
