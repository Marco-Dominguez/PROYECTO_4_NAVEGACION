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
        ZStack {
            // fondo negro
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Usuarios
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(controlador.usuarios) { usuario in
                            NavigationLink {
                                Text("pantalla de la nota de \(usuario.nombre)")
                            } label: {
                                EtiquetaUsuarioPerfil(usuario: usuario)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 120)
                
                // Mensajes Titulo
                HStack {
                    Text("Mensajes")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("Solicitudes")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 15)
                
                // Mensajes Lista
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(controlador.mensajes) { mensaje in
                            NavigationLink {
                                Text("chat con \(mensaje.id_usuario ?? "alguien")")
                            } label: {
                                PrevistaMensaje(mensaje: mensaje)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                // Acciones
                HStack {
                    Button("Agregar Mensaje") {
                        controlador.agregar_mensajes()
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrarUsuario()) {
                        Text("Agregar Usuario")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Marco_Dominguez")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
