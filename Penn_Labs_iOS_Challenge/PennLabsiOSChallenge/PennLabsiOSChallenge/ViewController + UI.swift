//
//  ViewController + UI.swift
//  PennLabsiOSChallenge
//
//  Created by Sam Brause on 9/20/19.
//  Copyright © 2019 Sam Brause. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController {
    func setupUI() {
        CommonsCell.isHighlighted = false
        HillCell.isHighlighted = false
        EnglishCell.isHighlighted = false
        LauderCell.isHighlighted = false
        FalkCell.isHighlighted = false
        AccentureCell.isHighlighted = false
        HoustonCell.isHighlighted = false
        StarbucksCell.isHighlighted = false
        McClellandCell.isHighlighted = false
        GGCell.isHighlighted = false
        LCHRCell.isHighlighted = false
        JoesCell.isHighlighted = false
        PretCell.isHighlighted = false
        CommonsImage.layer.masksToBounds = true
        CommonsImage.layer.cornerRadius = 7
        HillImage.layer.masksToBounds = true
        HillImage.layer.cornerRadius = 7
        EnglishImage.layer.masksToBounds = true
        EnglishImage.layer.cornerRadius = 7
        LauderImage.layer.masksToBounds = true
        LauderImage.layer.cornerRadius = 7
        FalkImage.layer.masksToBounds = true
        FalkImage.layer.cornerRadius = 7
        HoustonImage.layer.masksToBounds = true
        HoustonImage.layer.cornerRadius = 7
        AccentureImage.layer.masksToBounds = true
        AccentureImage.layer.cornerRadius = 7
        StarbucksImage.layer.masksToBounds = true
        StarbucksImage.layer.cornerRadius = 7
        GGImage.layer.masksToBounds = true
        GGImage.layer.cornerRadius = 7
        McClellandImage.layer.masksToBounds = true
        McClellandImage.layer.cornerRadius = 7
        JoesImage.layer.masksToBounds = true
        JoesImage.layer.cornerRadius = 7
        PretImage.layer.masksToBounds = true
        PretImage.layer.cornerRadius = 7
        MBAImage.layer.masksToBounds = true
        MBAImage.layer.cornerRadius = 7
        LCHRImage.layer.masksToBounds = true
        LCHRImage.layer.cornerRadius = 7
    }
    func setImages(doc: DiningDocument){
        self.CommonsImage.load(url: URL(string: doc.document.venue[0].imageUrl!)!)
        self.HillImage.load(url: URL(string: doc.document.venue[1].imageUrl!)!)
        self.EnglishImage.load(url: URL(string: doc.document.venue[2].imageUrl!)!)
        self.FalkImage.load(url: URL(string: doc.document.venue[3].imageUrl!)!)
        self.HoustonImage.load(url: URL(string: doc.document.venue[4].imageUrl!)!)
        self.AccentureImage.load(url: URL(string: "https://admissions.upenn.edu/sites/default/files/styles/16_9_scale_1920x1080/public/2018-05/JCalvo%20Penn%20Levine%20Hall%20sized.jpg?itok=aJ6evxMC")!)
        self.JoesImage.load(url: URL(string: doc.document.venue[6].imageUrl!)!)
        self.LauderImage.load(url: URL(string: doc.document.venue[7].imageUrl!)!)
        self.McClellandImage.load(url: URL(string: doc.document.venue[8].imageUrl!)!)
        self.GGImage.load(url: URL(string: doc.document.venue[9].imageUrl!)!)
        self.StarbucksImage.load(url: URL(string: doc.document.venue[10].imageUrl!)!)
        self.LCHRImage.load(url: URL(string: doc.document.venue[11].imageUrl!)!)
        self.MBAImage.load(url: URL(string: doc.document.venue[12].imageUrl!)!)
        self.PretImage.load(url: URL(string: doc.document.venue[13].imageUrl!)!)
    }
    func setAllHours(doc: DiningDocument){
        self.setHours(label: self.CommonsHours, doc: doc, index: 0)
        self.setHours(label: self.HillHours, doc: doc, index: 1)
        self.setHours(label: self.EnglishHours, doc: doc, index: 2)
        self.setHours(label: self.FalkHours, doc: doc, index: 3)
        self.setHours(label: self.HoustonHours, doc: doc, index: 4)
        self.setHours(label: self.AccentureHours, doc: doc, index: 5)
        self.setHours(label: self.JoesHours, doc: doc, index: 6)
        self.setHours(label: self.LauderHours, doc: doc, index: 7)
        self.setHours(label: self.McClellandHours, doc: doc, index: 8)
        self.setHours(label: self.GGHours, doc: doc, index: 9)
        self.setHours(label: self.StarbucksHours, doc: doc, index: 10)
        self.setHours(label: self.LCHHours, doc: doc, index: 11)
        self.setHours(label: self.MBAHours, doc: doc, index: 12)
        self.setHours(label: self.PretHours, doc: doc, index: 13)
    }
    func parseStr(label: UILabel, str: String, single: Bool){
        let startHr = str.startIndex
        let endHr = str.index(str.endIndex, offsetBy: -6)
        let startMins = str.index(str.startIndex, offsetBy: 3)
        let endMins = str.index(str.startIndex, offsetBy: 5)
        var mins = false
        if(str[str.index(str.startIndex, offsetBy: 3)...str.index(str.startIndex, offsetBy: 3)] != "0"){
            mins = true
        }
        let rangeMins = startMins..<endMins
        let rangeHr = startHr..<endHr
        var hour = Int(str[rangeHr])
        var suffix = "am"
        if(hour! >= 12){
            suffix = "pm"
        }
        if(hour! > 12){
            hour = hour! % 12
        }
        let minute = mins ? ":\(str[rangeMins])" : ""
        let suff = single ? suffix : ""
        label.text?.append(contentsOf: "\(hour!)\(minute)\(suff)")
    }
    func setHours(label: UILabel, doc: DiningDocument, index: Int){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        var day = ""
        switch(weekday){
        case 1:
            day = "Sunday"
        case 2:
            day = "Monday"
        case 3:
            day = "Tuesday"
        case 4:
            day = "Wednesday"
        case 5:
            day = "Thursday"
        case 6:
            day = "Friday"
        case 7:
            day = "Saturday"
        default:
            day = ""
        }
        let mnth = Calendar.current.component(.month, from: date)
        var month = ""
        switch(mnth){
        case 1:
            month = "January"
        case 2:
            month = "February"
        case 3:
            month = "March"
        case 4:
            month = "April"
        case 5:
            month = "May"
        case 6:
            month = "June"
        case 7:
            month = "July"
        case 8:
            month = "August"
        case 9:
            month = "September"
        case 10:
            month = "October"
        case 11:
            month = "November"
        case 12:
            month = "December"
        default:
            day = ""
        }
        TodayDate.text = "\(day), \(month) \(Calendar.current.component(.day, from: date))"
        label.text = ""
        for i in 0..<doc.document.venue[index].dateHours.count {
            if doc.document.venue[index].dateHours[i].date == result {
                if(doc.document.venue[index].dateHours[i].meal.count==1 || doc.document.venue[index].name == "Houston Market"){
                    let openStr = doc.document.venue[index].dateHours[i].meal[0].open
                    parseStr(label: label, str: openStr, single: true)
                    label.text?.append(" - ")
                    let closeStr = doc.document.venue[index].dateHours[i].meal[0].close
                    parseStr(label: label, str: closeStr, single: true)
                }else{
                    for j in 0..<doc.document.venue[index].dateHours[i].meal.count {
                        let openStr = doc.document.venue[index].dateHours[i].meal[j].open
                        parseStr(label: label, str: openStr, single: false)
                        label.text?.append(" - ")
                        let closeStr = doc.document.venue[index].dateHours[i].meal[j].close
                        parseStr(label: label, str: closeStr, single: false)
                        if(j<doc.document.venue[index].dateHours[i].meal.count-1){
                            label.text?.append(contentsOf: " | ")
                        }
                    }
                }
            }
        }
        if(label.text == ""){
            label.text? = "CLOSED TODAY"
        }
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
