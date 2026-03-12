//
//  prevista_mensaje_vista.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import SwiftUI

struct PrevistaMensaje: View {
    var mensaje: Mensaje
    
    var body: some View {
        HStack{
            Image(systemName: "message")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            VStack(alignment: .leading){
                HStack{
                    //Spacer()
                    Text("\(mensaje.id_usuario ?? "Anonimo" )")
                        .background(Color.red)
                }
                .background(Color.cyan)
                
                Text("\(mensaje.texto)")
                    .background(Color.yellow)
            }
            Spacer()
        }
        .padding()
        .frame(height: 75)
        .overlay{
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .stroke(.black, lineWidth: 5)
        }
    }
}

#Preview {
    PrevistaMensaje(mensaje: mensajes_falsos[0])
}
