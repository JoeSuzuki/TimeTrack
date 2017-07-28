//
//  PersonalGroupViewController.swift
//  TimeTrack
//
//  Created by Joe Suzuki on 7/28/17.
//  Copyright © 2017 JoeSuzuki. All rights reserved.
//

import UIKit
import Firebase

class PersonalGroupViewController: UIViewController{

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var daysOpen: UILabel!

    var ref: DatabaseReference!
    let userID = Auth.auth().currentUser!.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("users").child(userID).child("groups").child("personal groups").childByAutoId()

            // ...
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func leaveButton(_ sender: UIButton) {
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
