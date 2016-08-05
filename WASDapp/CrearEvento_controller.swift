//
//  CrearEvento_controller.swift
//  WASDapp
//
//  Created by Alejandro Soto 22/07/16.
//  Copyright © 2016 ChilaKillers. All rights reserved.
//

import Foundation
import UIKit

class CrearEvento_controller: UIViewController {
    var inputValue = []
    
    @IBOutlet var juego: UITextField!
    @IBOutlet var lugar: UITextField!
    @IBOutlet var descripcion: UITextView!
    @IBOutlet var datePicker_fecha: UIDatePicker!
    @IBOutlet var datePicker_hora: UIDatePicker!
    
    @IBAction func buttonPress(sender: AnyObject) {
        

        let dateFormatter_fecha = NSDateFormatter()
        let dateFormatter_hora = NSDateFormatter()
        dateFormatter_fecha.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter_hora.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let fecha_conversion = dateFormatter_fecha.stringFromDate(datePicker_fecha.date)
        let hora_conversion = dateFormatter_hora.stringFromDate(datePicker_hora.date)

        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8888/WASD/submit_event.php")!)
        request.HTTPMethod = "POST"
        let postString = "juego_post=\(juego.text!)&lugar_post=\(lugar.text!)&fecha_post=\(fecha_conversion)&hora_post=\(hora_conversion)&descripcion_post=\(descripcion.text!)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            // temporal
            if let unwrappedData = data {
            let dataEnText = String.init(data: unwrappedData, encoding:NSUTF8StringEncoding)
               
            
            let warningWindow = UIAlertController(title: "Respuesta", message: dataEnText, preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "ok", style: .Default, handler: { (action) in
                // podrias hacer algo
            })
                warningWindow.addAction(action)
                
            self.presentViewController(warningWindow, animated: true
                , completion: { 
                    print("alerta presentada")
            })
                 }
            // temporal
            
            //TODO: 1 - verificar el status code de la respuesta, si es 200 entonces:
            //TODO: 2 - verifican que en data no venga nil
            //TODO: 3 - validan la rspuesta de data , analizan la cadena de texto y actuan en consecuencia
            //TODO: mostrar el VC que corresponda
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        datePicker_fecha.setValue(UIColor.grayColor(), forKey: "textColor")
        datePicker_hora.setValue(UIColor.grayColor(), forKey: "textColor")

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

