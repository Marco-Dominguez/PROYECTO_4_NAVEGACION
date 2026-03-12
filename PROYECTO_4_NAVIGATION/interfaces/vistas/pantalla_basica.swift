//
//  pantalla_basica.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 02/03/26.
//
import SwiftUI

struct PantallaBasica: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        Text("Esta pantalla me meuve a la siguiente opcion")
        
        Spacer()
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(controlador.usuarios){ usuario in
                    NavigationLink {
                        Text("Esta es la pantalla del \(usuario)")
                    }
                    label: {
                        EtiquetaUsuarioPerfil(usuario: usuario)
                            .padding(3)

                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
        ScrollView(.vertical){
            LazyVStack{
                ForEach(controlador.mensajes){ mensaje in
                    NavigationLink {
                        Text("Esta es la pantalla del \(mensaje)")
                    }
                    label: {
                        PrevistaMensaje(mensaje: mensaje)
                            .padding()
                        
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
        
        Spacer()
        
        Text("Agregar un hola mundo")
            .onTapGesture {
                controlador.agregar_mensajes()
            }
        
        NavigationLink{
            RegistrarUsuario()
        }
        label: {
            Text("Agregar usuario")
        }
        
        Spacer()

            
    }
}

#Preview {
    NavigationStack{
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
