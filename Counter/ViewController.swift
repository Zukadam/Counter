import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusOneButton: UIButton!
    @IBOutlet private weak var minusOneButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        plusOneButton.layer.cornerRadius = 10
        minusOneButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
        historyTextView.layer.cornerRadius = 10

        super.viewDidLoad()
    }
    
    @IBAction private func plusOneButtonDidTap(_ sender: Any) {
        if let newCounterValue = counterLabel.text, var newCounterValueInt = Int(newCounterValue) {
            newCounterValueInt += 1
            counterLabel.text = String(newCounterValueInt)
            historyTextView.text.append(dateAndTime(conjunction: "и") + "значение изменено на +1")
        }
    }
    
    @IBAction private func minusOneButtonDidTap(_ sender: Any) {
        if let newCounterValue = counterLabel.text, var newCounterValueInt = Int(newCounterValue) {
            newCounterValueInt -= 1
            if newCounterValueInt < 0 {
                counterLabel.text = String(newCounterValueInt + 1)
                historyTextView.text.append(dateAndTime(conjunction: "и") + "попытка уменьшить значение счётчика ниже 0")
            } else {
                counterLabel.text = String(newCounterValueInt)
                historyTextView.text.append(dateAndTime(conjunction: "и") + "значение изменено на -1")
            }
        }
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        if let _ = counterLabel.text {
            counterLabel.text = "0"
            historyTextView.text.append(dateAndTime(conjunction: "и") + "значение сброшено")
        }
    }
    
    private func dateAndTime(conjunction: String) -> String {
        var dateAndTime: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateAndTime.append("\n \(dateFormatter.string(from: .now)) \(conjunction) ")
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateAndTime.append("\(dateFormatter.string(from: .now)): ")
        return dateAndTime
    }
    

}

