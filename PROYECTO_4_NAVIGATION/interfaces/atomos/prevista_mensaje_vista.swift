//
//  prevista_mensaje_vista.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import SwiftUI

struct PrevistaMensaje: View {
    var mensaje: Mensaje
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        HStack(spacing: 15) {
            // Imagen
            if let usuarioRemitente = controlador.obtenerUsuario(por: mensaje.id_usuario),
               let nombreImagen = usuarioRemitente.imagen {
                Image(nombreImagen)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(LinearGradient(colors: [.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 75, height: 75)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(mensaje.id_usuario ?? "Usuario Anónimo")
                    .font(.system(size: 16, weight: mensaje.esMensajeNoLeido ? .bold : .regular))
                    .foregroundStyle(.white)
                
                HStack(spacing: 4) {
                    Text(mensaje.texto)
                        .font(.system(size: 14, weight: mensaje.esMensajeNoLeido ? .bold : .regular))
                        .foregroundStyle(mensaje.esMensajeNoLeido ? .white : .gray)
                        .lineLimit(1)
                    
                    Text("· \(controlador.calcularTiempoTranscurrido(desde: mensaje.fechaEnvio))")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            // Visto/n't
            if mensaje.esMensajeNoLeido {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.black)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PrevistaMensaje(mensaje: Mensaje(texto: "Hola", id_usuario: "Robert Patinazo", esMensajeNoLeido: true, fechaEnvio: Date().addingTimeInterval(-300)))
            .environment(ControladorGeneral())
    }
}
