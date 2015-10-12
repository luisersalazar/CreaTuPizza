//
//  TipoMasaViewController.swift
//  CreaTuPizza
//
//  Created by lsalazar on 11/10/15.
//  Copyright © 2015 lsalazar. All rights reserved.
//

import UIKit

class TipoMasaViewController: UIViewController {

    @IBOutlet weak var sgmTipoMasa: UISegmentedControl!
    var tamanio : String = ""
    var tipoMasa : Int = -1
    var tipoMasaNombre : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVentana = segue.destinationViewController as! TipoQuesoViewController
        siguienteVentana.tamanio = tamanio
        siguienteVentana.tipoMasa = tipoMasaNombre
    }
    
    @IBAction func seleccionTipoMasa(sender: UISegmentedControl) {
        tipoMasa = sgmTipoMasa.selectedSegmentIndex
        switch(tipoMasa){
        case 0:
            tipoMasaNombre = "Delgada"
        case 1:
            tipoMasaNombre = "Crujiente"
        default:
            tipoMasaNombre = "Gruesa"
        }
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(tipoMasa < 0){
            let alert = UIAlertController(title: "Oops!", message:"Es necesario que selecciones un tipo de masa para tu pizza", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            return false
        }
        return true
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
