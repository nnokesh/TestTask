//
//  ChartDataModel.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 19.07.2023.
//

import Foundation
import Charts

struct ChartDataModel {
    let yValues: [ChartDataEntry]
    let secondYValues: [ChartDataEntry]
    let itemsChartSegmentedControl: [String]

    init() {
        
        yValues = [
            ChartDataEntry(x: 0.0, y: 34.00),
            ChartDataEntry(x: 1.0, y: 37.39),
            ChartDataEntry(x: 2.0, y: 37.0),
            ChartDataEntry(x: 3.0, y: 38.0),
            ChartDataEntry(x: 4.0, y: 39.0),
            ChartDataEntry(x: 5.0, y: 34.0),
            ChartDataEntry(x: 6.0, y: 33.0),
            ChartDataEntry(x: 7.0, y: 32.0),
            ChartDataEntry(x: 8.0, y: 33.0),
            ChartDataEntry(x: 9.0, y: 35.0),
            ChartDataEntry(x: 10.0, y: 34.0),
            ChartDataEntry(x: 11.0, y: 36.5),
            ChartDataEntry(x: 12.0, y: 37.0),
            ChartDataEntry(x: 13.0, y: 38.2),
        ]
        
        secondYValues = [
            ChartDataEntry(x: 0.0, y: 41.0),
            ChartDataEntry(x: 1.0, y: 40.0),
            ChartDataEntry(x: 2.0, y: 40.5),
            ChartDataEntry(x: 3.0, y: 39.0),
            ChartDataEntry(x: 4.0, y: 38.0),
            ChartDataEntry(x: 5.0, y: 38.5),
            ChartDataEntry(x: 6.0, y: 36.0),
            ChartDataEntry(x: 7.0, y: 35.5),
            ChartDataEntry(x: 8.0, y: 34.0),
            ChartDataEntry(x: 9.0, y: 34.5),
            ChartDataEntry(x: 10.0, y: 34.2),
            ChartDataEntry(x: 11.0, y: 35.0),
            ChartDataEntry(x: 12.0, y: 36.0),
            ChartDataEntry(x: 13.0, y: 37.5),
        ]
        
        itemsChartSegmentedControl = ["1 д", "7 д","1 м","3 м","6 м","12 м"]
    }
}
