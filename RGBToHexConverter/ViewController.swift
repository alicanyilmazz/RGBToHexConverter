//
//  ViewController.swift
//  RGBToHexConverter
//
//  Created by alican on 21.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtRed: UITextField!
    
    @IBOutlet weak var txtGreen: UITextField!
    
    @IBOutlet weak var txtBlue: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var btnConvert: UIButton!
    
    @IBOutlet weak var lblSelectedColor: UILabel!
    
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
       
        selectedIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if selectedIndex == 0 {
            btnConvert.setTitle("RGB -- HEX Convert", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("HEX -- RGB Convert", for: UIControl.State.normal)
        }
    }
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        if selectedIndex == 0{
            convertRgbToHex()
        }else{
            convertHexToRgb()
        }
    }
    
    func convertRgbToHex(){
        
        guard let redValue = UInt8(txtRed.text!) else { return }
        guard let greenValue = UInt8(txtGreen.text!) else { return }
        guard let blueValue = UInt8(txtBlue.text!) else { return }
                
                    let redHex = String(format: "%2X",redValue)
                    let greenHex = String(format: "%2X",greenValue)
                    let blueHex = String(format: "%2X",blueValue)
                    
                    lblResult.text = "Hex Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(displayP3Red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
       
    }
    
    func convertHexToRgb(){
        if let redValue = UInt8(txtRed.text! ,radix: 16){
            if let greenValue = UInt8(txtGreen.text!,radix: 16){
                if let blueValue = UInt8(txtBlue.text!,radix: 16){
                    lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(displayP3Red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
    }
    
}

