//
//  ViewController.swift
//  MiniApp39-Charts
//
//  Created by 前田航汰 on 2022/04/09.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var pieChart: PieChartView!
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 160.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        setLineGraph()
        setPieGraph()
    }

    func setLineGraph(){
        var entry = [ChartDataEntry]()

        for (i,d) in unitsSold.enumerated(){
            entry.append(ChartDataEntry(x: Double(i),y: d))
        }

        let dataset = LineChartDataSet(entries: entry,label: "Units Sold")

        lineChart.data = LineChartData(dataSet: dataset)
        lineChart.chartDescription.text = "Item Sold Chart"
    }

    func setPieGraph(){

        var dataEntries: [ChartDataEntry] = []

        for i in 0..<months.count {
            dataEntries.append( PieChartDataEntry(value: unitsSold[i], label: months[i], data: unitsSold[i]))
        }

        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")

        pieChart.data = PieChartData(dataSet: pieChartDataSet)

        var colors: [UIColor] = []

        for _ in 0..<months.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))

            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }

        pieChartDataSet.colors = colors
    }

}

