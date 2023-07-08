//
//  ViewController.swift
//  Date-Picker-UIKit
//
//  Created by DA MAC M1 157 on 2023/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    private let coolDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.locale = Locale.current
        datePicker.timeZone = TimeZone.current
        datePicker.date = Date(timeIntervalSince1970: 10)
        datePicker.minimumDate = Date(timeIntervalSinceNow: 0)
        datePicker.countDownDuration = 0
        datePicker.minuteInterval = 5
        return datePicker
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        coolDatePicker.addTarget(self, action: #selector(getDateAndTime), for: .valueChanged)
    }
    
    
    @objc func getDateAndTime() {
        // declare format of how date should be displayed and retrieved
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        // convert date from datePicker to string type
        let dateString = dateFormatter.string(from: coolDatePicker.date)
        print("Date: \(dateString)")
        
        
        //declare format of how time should be displayed and retrieved
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        
        // convert time from datePicker to string type
        let timeString = timeFormatter.string(from: coolDatePicker.date)
        print("Time: \(timeString)")

    }
    
    private func configureViews() {
        view.addSubview(coolDatePicker)
        //getDateAndTime()
    }
    
    private func configureConstraints() {
        let coolDatePickerCOnstraints = [
            coolDatePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            coolDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(coolDatePickerCOnstraints)
    }

}

