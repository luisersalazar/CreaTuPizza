//
//  TamanioViewController.swift
//  CreaTuPizza
//
//  Created by lsalazar on 11/10/15.
//  Copyright © 2015 lsalazar. All rights reserved.
//

import UIKit

class TamanioViewController: UIViewController {

    @IBOutlet weak var sgmTamanio: UISegmentedControl!
    var tamanio : Int = -1
    var tamanioNombre :String=""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVentana = segue.destinationViewController as! TipoMasaViewController
        siguienteVentana.tamanio = tamanioNombre
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(tamanio < 0){
            let alert = UIAlertController(title: "Oops!", message:"Es necesario que selecciones un tamaño para tu pizza", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            return false
        }
        return true
    }
    
    @IBAction func seleccionTamanio(sender: UISegmentedControl) {
        tamanio = sender.selectedSegmentIndex
        switch(tamanio){
        case 0:
            tamanioNombre = "Chica"
        case 1:
            tamanioNombre = "Mediana"
        default:
            tamanioNombre = "Grande"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
