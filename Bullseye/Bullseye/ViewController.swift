
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minLabel.text = String(lroundf(slider.minimumValue))
        maxLabel.text = String(lroundf(slider.maximumValue))
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference + calculateBonuses(difference: difference)
        
        let title: String = generateTitle(difference: difference)
        
        score += points
    
        let alert = UIAlertController(title: "\(title)",
                                      message: "The value of the slider is: \(currentValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func startOver(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func generateTitle(difference: Int) -> String {
        if difference == 0 {
            return "Perfect!"
        } else if difference < 5 {
            return "You almost had it!"
        }
        else if difference < 10 {
            return "Pretty good!" }
        else {
            return "Not even close..."
        }
    }
    
    func calculateBonuses(difference: Int) -> Int{
        if difference == 0 {
            return 100
        } else if difference == 1 {
            return 50
        } else {
            return 0
        }
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scorelabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1
        
        targetValue = 1 + Int(arc4random_uniform(100))
       
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    

}

	
