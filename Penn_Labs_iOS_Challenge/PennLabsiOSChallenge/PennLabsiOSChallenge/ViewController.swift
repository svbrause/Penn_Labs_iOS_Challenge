//
//  ViewController.swift
//  PennLabsiOSChallenge
//
//  Created by Sam Brause on 9/19/19.
//  Copyright © 2019 Sam Brause. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    @IBOutlet weak var TodayDate: UILabel!
    @IBOutlet weak var MBAHours: UILabel!
    @IBOutlet weak var PretHours: UILabel!
    @IBOutlet weak var JoesHours: UILabel!
    @IBOutlet weak var LCHHours: UILabel!
    @IBOutlet weak var GGHours: UILabel!
    @IBOutlet weak var McClellandHours: UILabel!
    @IBOutlet weak var StarbucksHours: UILabel!
    @IBOutlet weak var HoustonHours: UILabel!
    @IBOutlet weak var AccentureHours: UILabel!
    @IBOutlet weak var FalkHours: UILabel!
    @IBOutlet weak var LauderHours: UILabel!
    @IBOutlet weak var EnglishHours: UILabel!
    @IBOutlet weak var HillHours: UILabel!
    @IBOutlet weak var CommonsStatus: UILabel!
    @IBOutlet weak var CommonsHours: UILabel!
    @IBOutlet weak var CommonsImage: UIImageView!
    @IBOutlet weak var HillImage: UIImageView!
    @IBOutlet weak var EnglishImage: UIImageView!
    @IBOutlet weak var LauderImage: UIImageView!
    @IBOutlet weak var FalkImage: UIImageView!
    @IBOutlet weak var HoustonImage: UIImageView!
    @IBOutlet weak var AccentureImage: UIImageView!
    @IBOutlet weak var StarbucksImage: UIImageView!
    @IBOutlet weak var GGImage: UIImageView!
    @IBOutlet weak var McClellandImage: UIImageView!
    @IBOutlet weak var JoesImage: UIImageView!
    @IBOutlet weak var PretImage: UIImageView!
    @IBOutlet weak var MBAImage: UIImageView!
    @IBOutlet weak var LCHRImage: UIImageView!
    @IBOutlet weak var CommonsCell: UITableViewCell!
    @IBOutlet weak var DiningHallsCell: UITableViewCell!
    @IBOutlet weak var HillCell: UITableViewCell!
    @IBOutlet weak var EnglishCell: UITableViewCell!
    @IBOutlet weak var LauderCell: UITableViewCell!
    @IBOutlet weak var FalkCell: UITableViewCell!
    @IBOutlet weak var HoustonCell: UITableViewCell!
    @IBOutlet weak var AccentureCell: UITableViewCell!
    @IBOutlet weak var StarbucksCell: UITableViewCell!
    @IBOutlet weak var McClellandCell: UITableViewCell!
    @IBOutlet weak var GGCell: UITableViewCell!
    @IBOutlet weak var LCHRCell: UITableViewCell!
    @IBOutlet weak var JoesCell: UITableViewCell!
    @IBOutlet weak var PretCell: UITableViewCell!
    @IBOutlet weak var MBACell: UITableViewCell!
    
    
    @IBAction func openMBA(_ sender: Any) {
        MBACell.isHighlighted = true
        location = 12
    }
    @IBAction func openPret(_ sender: Any) {
        PretCell.isHighlighted = true
        location = 13
    }
    @IBAction func openJoes(_ sender: Any) {
        JoesCell.isHighlighted = true
        location = 6
    }
    @IBAction func openLCHR(_ sender: Any) {
        LCHRCell.isHighlighted = true
        location = 11
    }
    @IBAction func openGG(_ sender: Any) {
        GGCell.isHighlighted = true
        location = 9
    }
    @IBAction func openMcClelland(_ sender: Any) {
        McClellandCell.isHighlighted = true
        location = 8
    }
    @IBAction func openStarbucks(_ sender: Any) {
        StarbucksCell.isHighlighted = true
        location = 10
    }
    @IBAction func openAccenture(_ sender: Any) {
        AccentureCell.isHighlighted = true
        location = 5
    }
    @IBAction func openHouston(_ sender: Any) {
        HoustonCell.isHighlighted = true
        location = 4
    }
    @IBAction func openFalk(_ sender: Any) {
        FalkCell.isHighlighted = true
        location = 3
    }
    @IBAction func openLauder(_ sender: Any) {
        LauderCell.isHighlighted = true
        location = 7
    }
    @IBAction func OpenEnglish(_ sender: Any) {
        EnglishCell.isHighlighted = true
        location = 2
    }
    @IBAction func openHill(_ sender: Any) {
        HillCell.isHighlighted = true
        location = 1
    }
    @IBAction func open1920(_ sender: Any) {
        CommonsCell.isHighlighted = true
        location = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let contacts = UIViewController(nibName: "HomeViewController", bundle: nil)
        contacts.title = "Contacts"
        let url = URL(string: "https://api.pennlabs.org/dining/venues")
        JSONDecode.parseJSON(url: url!) { (doc) in
            DispatchQueue.main.async {
                self.setImages(doc: doc)
                self.setAllHours(doc: doc)
            }
        }
    }

}
