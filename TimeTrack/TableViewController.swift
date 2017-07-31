//
//  TableViewController.swift
//  TimeTrack
//
//  Created by Joe Suzuki on 7/26/17.
//  Copyright © 2017 JoeSuzuki. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct cellData {
    let cell: Int!
    let text: String?
    let image: UIImage?
}

class TableViewController: UITableViewController {

    //let ref = Database.database().reference().child("users")
    var tableText: String?
    var tableImage: UIImage?
    var arrayOfCellData = [cellData]()
    var ref: DatabaseReference?
    let imageName = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser!.uid
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("users").child(uid!).observeSingleEvent(of: <#T##DataEventType#>, with: <#T##(DataSnapshot) -> Void#>) //.child("groups")
        arrayOfCellData = [cellData(cell : 1, text : "Dr.Andy's office", image : #imageLiteral(resourceName: "docotrsoffice")),
                                   cellData(cell : 1, text : "Dr. Bob's office", image : #imageLiteral(resourceName: "maxresdefault")),
                    cellData(cell : 1, text : "Gods teeth office", image : #imageLiteral(resourceName: "w"))]
        
     //   ref.child("users").queryOrderedByKey().observe(.childAdded, with: { snapshot in
           
         //   let texted = snapshot.value!["name"] as! String
           // self.arrayOfCellData.insert(cellData(text: texted))
       // })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 1 {
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabelView.text = arrayOfCellData[indexPath.row].text
    
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabelView.text = arrayOfCellData[indexPath.row].text

            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cell == 1 {
            return 235
        } else if arrayOfCellData[indexPath.row].cell == 2  {
            return 105
        } else {
            return 235
        }
    }
}

//        arrayOfCellData = [cellData(cell : 1, text : "Dr.Andy's office", image : #imageLiteral(resourceName: "docotrsoffice")),
//                           cellData(cell : 1, text : "Dr. Bob's office", image : #imageLiteral(resourceName: "maxresdefault")),
//            cellData(cell : 1, text : "Gods teeth office", image : #imageLiteral(resourceName: "w"))
