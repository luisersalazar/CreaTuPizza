//
//  TipoQuesoViewController.swift
//  CreaTuPizza
//
//  Created by lsalazar on 11/10/15.
//  Copyright © 2015 lsalazar. All rights reserved.
//

import UIKit

class TipoQuesoViewController: UIViewController {
    
    @IBOutlet weak var sgmTipoQueso: UISegmentedControl!
    var tamanio : String = ""
    var tipoMasa : String = ""
    var tipoQueso : Int = -1
    var tipoQuesoNombre : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVentana = segue.destinationViewController as! IngredientesViewController
        siguienteVentana.tamanio = tamanio
        siguienteVentana.tipoMasa = tipoMasa
        siguienteVentana.tipoQueso = tipoQuesoNombre
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(tipoQueso < 0){
            let alert = UIAlertController(title: "Oops!", message:"Es necesario que selecciones un tipo de queso para tu pizza", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            return false
        }
        return true
    }

    
    @IBAction func seleccionTipoQueso(sender: UISegmentedControl) {
        tipoQueso = sgmTipoQueso.selectedSegmentIndex
        switch(tipoQueso){
        case 0:
            tipoQuesoNombre = "Mozarela"
        case 1:
            tipoQuesoNombre = "Cheddar"
        case 2:
            tipoQuesoNombre = "Parmesano"
        default:
            tipoQuesoNombre = "Sin queso"
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
