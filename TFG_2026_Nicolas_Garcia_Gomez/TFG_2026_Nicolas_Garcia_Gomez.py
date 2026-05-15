import reflex as rx
import TFG_2026_Nicolas_Garcia_Gomez.estilos.estilos as estilos
from TFG_2026_Nicolas_Garcia_Gomez.views.instrucciones import instrucciones
from TFG_2026_Nicolas_Garcia_Gomez.views.vent_flotante import vent_flotante
from Logica.Programa import Programa

#Llamamos a la pagina principal o a la pagina de acceso
def index() -> rx.Component:
    return rx.box(
        rx.center(
            rx.vstack(
                instrucciones(),
                vent_flotante(Programa.texto, Programa.datos_final, Programa.datos_tarta),
                width="100%",
                spacing="9"
            )
        )
    )

#Establecemos los estilos
app = rx.App(
    stylesheets = estilos.HOJAESTILO,
    style = estilos.ESTILO_BASE
)

#Titulo y descripcion de la web
app.add_page(
    #Le añadimos los componentes
    index,
    title = "Indicadores de calidad URCCPQ",
    description = "Calculadora Indicadores de calidad URCCPQ"
)