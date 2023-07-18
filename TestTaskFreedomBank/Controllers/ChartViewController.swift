//
//  ChartViewController.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit
import Charts

/// A view controller that displays a chart with segmented control and a table view for analysis.
final class ChartViewController: UIViewController, ChartViewDelegate {
    
    // MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let customStackView: UIStackView = {
        let textDataStackView = UIStackView()
        textDataStackView.axis = .vertical
        textDataStackView.spacing = 15
        textDataStackView.translatesAutoresizingMaskIntoConstraints = false
        return textDataStackView
    }()
    
    /// The segmented control for selecting different chart options.
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: model.itemsChartSegmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    /// The view representing the chart.
    let graphView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    /// The view for displaying analysis.
    let analysisView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    /// The table view for displaying analysis details.
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    /// The header view for the table view.
    let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()
    
    /// The label for the table view header.
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Анализ доходности портфеля"
        headerLabel.font = UIFont.systemFont(ofSize: 13)
        return headerLabel
    }()
    
    /// The model instance containing the data and configuration.
    let model = Model()
    
    /// The line chart view for displaying the chart data.
    var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .white
        chartView.leftAxis.enabled = false
        chartView.rightAxis.setLabelCount(4, force: true)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.setLabelCount(4, force: true)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()
    
    /// The data entries for the first line on the chart.
    let yValues: [ChartDataEntry] = [
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
    
    /// The data entries for the second line on the chart.
    let secondYValues: [ChartDataEntry] = [
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
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MaxDrawdownCell.self, forCellReuseIdentifier: MaxDrawdownCell.identifier)
        tableView.register(TotalReturnCell.self, forCellReuseIdentifier: TotalReturnCell.identifier)
        tableView.register(DeviationCell.self, forCellReuseIdentifier: DeviationCell.identifier)
        
        view.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686275125, alpha: 1)
        
        setupUI()
        createConstraint()
        setData()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        graphView.addSubview(lineChartView)
        graphView.addSubview(segmentedControl)
        
        analysisView.addSubview(tableView)
        headerView.addSubview(headerLabel)
                
        [graphView, analysisView].forEach { customStackView.addArrangedSubview($0) }
        contentView.addSubview(customStackView)

        
    }
    
    private func createConstraint() {
        NSLayoutConstraint.activate([
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            customStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            customStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            graphView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30),
            graphView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            graphView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            graphView.heightAnchor.constraint(equalToConstant: 286),
            
            lineChartView.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 10),
            lineChartView.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 10),
            lineChartView.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -10),
            
            segmentedControl.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -10),
            segmentedControl.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
            segmentedControl.heightAnchor.constraint(equalToConstant: 44),
            
            analysisView.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 15),
            analysisView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            analysisView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            analysisView.heightAnchor.constraint(equalToConstant: 310),
            
            tableView.topAnchor.constraint(equalTo: analysisView.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: analysisView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: analysisView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: analysisView.bottomAnchor, constant: -10),
            
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Data Setup
    
    private func setData() {
        let set1 = LineChartDataSet(entries: yValues, label: "Доходность")
        set1.mode = .linear
        set1.lineWidth = 3
        set1.setColor(.systemBlue)
        set1.fill = ColorFill(color: .systemBlue)
        set1.fillAlpha = 0.3
        set1.drawFilledEnabled = true
        set1.drawCirclesEnabled = false
        
        let set2 = LineChartDataSet(entries: secondYValues, label: "Чистые активы")
        set2.mode = .linear
        set2.lineWidth = 3
        set2.setColor(.systemPurple)
        set2.fill = ColorFill(color: .systemPurple)
        set2.fillAlpha = 0.5
        set2.drawFilledEnabled = true
        set2.drawCirclesEnabled = false
        
        let data = LineChartData(dataSets: [set1, set2])
        data.setDrawValues(false)
        lineChartView.data = data
    }

    // MARK: - ChartViewDelegate
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate

extension ChartViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MaxDrawdownCell.identifier, for: indexPath) as! MaxDrawdownCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TotalReturnCell.identifier, for: indexPath) as! TotalReturnCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DeviationCell.identifier, for: indexPath) as! DeviationCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped cell")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
