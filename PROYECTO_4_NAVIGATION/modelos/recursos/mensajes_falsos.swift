//
//  mensajes_falsos.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import Foundation

let mensajes_falsos: [Mensaje] = [
    Mensaje(
        texto: "¿Alguien ha visto mi otra zapatilla? Anoche brillaba en la disco 🌟",
        id_usuario: "Robert Patinazo",
        esMensajeNoLeido: true,
        fechaEnvio: Date().addingTimeInterval(-300) // 5 min
    ),
    Mensaje(
        texto: "Hoy amanecí con tres personalidades diferentes y todas quieren café ☕",
        id_usuario: "Meryl Strep",
        esMensajeNoLeido: false,
        fechaEnvio: Date().addingTimeInterval(-3600) // 1 hora
    ),
    Mensaje(
        texto: "Todavía no me creo que haya perdido el Oscar... otra vez 😭",
        id_usuario: "Leonardo DiCaprio",
        esMensajeNoLeido: true,
        fechaEnvio: Date().addingTimeInterval(-7200) // 2 horas
    ),
    Mensaje(
        texto: "¡Le voy a pegar a todo el que se me cruce! (en la nueva peli, obvio) 🎬",
        id_usuario: "Will Smith",
        esMensajeNoLeido: false,
        fechaEnvio: Date().addingTimeInterval(-86400) // 1 día
    ),
    Mensaje(
        texto: "Me tropecé con la alfombra roja... otra vez 🙈",
        id_usuario: "Jennifer Lawrence",
        esMensajeNoLeido: true,
        fechaEnvio: Date().addingTimeInterval(-172800) // 2 días
    ),
    Mensaje(
        texto: "Hoy toca día de pierna: 500 kg sentadilla y después una montaña de panqueques 🥞",
        id_usuario: "Dwayne Johnson",
        esMensajeNoLeido: false,
        fechaEnvio: Date().addingTimeInterval(-259200) // 3 días
    ),
    Mensaje(
        texto: "Alguien sabe dónde dejé mi traje de Viuda Negra? Es para una selfie 🕷️",
        id_usuario: "Scarlett Johansson",
        esMensajeNoLeido: false,
        fechaEnvio: Date().addingTimeInterval(-345600) // 4 días
    ),
    Mensaje(
        texto: "Sin querer revelé el final de la nueva peli en Instagram... ups 🙊",
        id_usuario: "Tom Holland",
        esMensajeNoLeido: true,
        fechaEnvio: Date().addingTimeInterval(-432000) // 5 días
    ),
    Mensaje(
        texto: "Mi cola de caballo está más larga que mi lista de éxitos 🎀",
        id_usuario: "Ariana Grande",
        esMensajeNoLeido: false,
        fechaEnvio: Date().addingTimeInterval(-518400) // 6 días
    ),
    Mensaje(
        texto: "Estoy en una cafetería regalando sonrisas y abrazos (no, no es un sueño) ☕😊",
        id_usuario: nil,   // Mensaje anónimo
        esMensajeNoLeido: true,
        fechaEnvio: Date().addingTimeInterval(-604800) // 7 días
    )
]
