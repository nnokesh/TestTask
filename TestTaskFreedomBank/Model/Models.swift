//
//  Models.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

struct Models {
    let images: [UIImage]
    let nameCompany: [String]
    let totalStocks: [String]
    let percentData: [String]
    let percentTextColors: [UIColor]
    let itemsCircleSegmentedControl: [String]
    let itemsChartSegmentedControl: [String]

    init() {
        
        itemsCircleSegmentedControl = ["Портфель", "Структура"]
        
        itemsChartSegmentedControl = ["1 д", "7 д","1 м","3 м","6 м","12 м"]

        images = [
            UIImage(named: "LogoNetflix"),
            UIImage(named: "LogoUber"),
            UIImage(named: "LogoPG"),
            UIImage(named: "LogoAbbv"),
            UIImage(named: "LogoAbbv")
        ].compactMap { $0 }
        
        nameCompany = ["NFLX.US",
                       "UBER.US",
                       "PG.US",
                       "ABBV.US",
                       "SPOT.US"
        ]
        
        totalStocks = ["6 шт по 300,40",
                       "2 шт по 300,40",
                       "16 шт по 30,40",
                       "1 шт по 127,40",
                       "6 шт по 300,40"
        ]
        
        percentData = ["+0,10 (0,41%)", "-0,89 (1,51%)", "+0,10 (0,41%)", "+0,10 (0,41%)", "+0,10 (0,41%)"]
        
        percentTextColors = [UIColor.systemGreen, UIColor.red, UIColor.systemGreen, UIColor.systemGreen, UIColor.systemGreen]
    }
}
