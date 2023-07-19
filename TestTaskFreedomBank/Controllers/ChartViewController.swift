//
//  ChartViewController.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit
import Charts

/// A view controller that displays a chart with segmented control and a table view for analysis.
final class ChartViewController: UIViewController {
    
    // MARK: - Properties
    
    /// The segmented control for selecting different chart options.
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: chartDataModel.itemsChartSegmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    /// The view representing the chart.
    private let graphView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .subviewBackgroundColor
        return view
    }()
    
    /// The view for displaying analysis.
    private let analysisView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .subviewBackgroundColor
        return view
    }()
    
    /// The table view for displaying analysis details.
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    /// The header view for the table view.
    private let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()
    
    /// The label for the table view header.
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Анализ доходности портфеля"
        headerLabel.font = UIFont.systemFont(ofSize: 13)
        return headerLabel
    }()
    
    /// The model instance containing the data and configuration.
    private let model = CompanyModel()
    
    /// The line chart view for displaying the chart data.
    private var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .white
        chartView.leftAxis.enabled = false
        chartView.rightAxis.setLabelCount(4, force: true)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.setLabelCount(4, force: true)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()
    
    private let chartDataModel = ChartDataModel()
 
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
        view.addSubview(analysisView)
        view.addSubview(graphView)
        
        graphView.addSubview(lineChartView)
        graphView.addSubview(segmentedControl)
        
        analysisView.addSubview(tableView)
        headerView.addSubview(headerLabel)
    }
    
    private func createConstraint() {
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            graphView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            graphView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            graphView.heightAnchor.constraint(equalToConstant: 286),
            lineChartView.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 10),
            lineChartView.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 10),
            lineChartView.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -10),
            segmentedControl.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -10),
            segmentedControl.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
            segmentedControl.heightAnchor.constraint(equalToConstant: 44),
            analysisView.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 20),
            analysisView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            analysisView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
        let set1 = LineChartDataSet(entries: chartDataModel.yValues, label: "Доходность")
        set1.mode = .linear
        set1.lineWidth = 3
        set1.setColor(.systemBlue)
        set1.fill = ColorFill(color: .systemBlue)
        set1.fillAlpha = 0.3
        set1.drawFilledEnabled = true
        set1.drawCirclesEnabled = false
        
        let set2 = LineChartDataSet(entries: chartDataModel.secondYValues, label: "Чистые активы")
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
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ChartViewController: UITableViewDelegate, UITableViewDataSource {
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

// MARK: - ChartViewDelegate

extension ChartViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
