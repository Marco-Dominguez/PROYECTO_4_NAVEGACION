//
//  campo_texto.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import SwiftUI

struct CampoTexto: View {
    @Binding var entrada: String
    var placeholder: String
    
    var error: ErrorUI?
    var id: String
    
    var body: some View {
        TextField(placeholder, text: $entrada)
        
        if(error?.campo == id){
            switch error!.nivel_de_error {
                case .gravitsimo:
                    Text(error!.error)
                        .foregroundStyle(Color.red)
                    
                
                case .nah_solo_advierte:
                    Text(error!.error)
                        .foregroundStyle(Color.yellow)
                    
                case .ninguno:
                    Text("")
            }
            
        }
    }
}
