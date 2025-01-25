# imports
from modules.sonidos import efectos, SONIDOS, CMD
import subprocess
import time
from libqtile import qtile, hook

# constantes

def proceso(effect):
    path = SONIDOS + effect
    subprocess.Popen(["sh", CMD, path])

def guardarLog(mensaje):
    mensaje = time.strftime('%H:%M:%S', time.localtime()) + " " + mensaje
    subprocess.Popen(["sh", "-c", f"echo {mensaje} >> ~/.config/qtile/log"])

def borrarLog():
    subprocess.Popen(["sh", "-c","rm", "-rf", "~/.config/qtile/log"])

def compararGrupo(grupo):
    guardarLog("Intentando obtener el manager.")
    try:
        manager = qtile
        if manager is not None:
            guardarLog("Manager obtenido.")
            return manager.current_group.name != grupo
        else: guardarLog("Error: manager no obtenido.")
    except Exception as e: guardarLog(f"Error 2: {e}")

"""
@hook.subscribe.focus_change
def focus_change():
    cmd = "playsound.sh"
    path = "/home/negrojose/.config/qtile/sound_effects/mario_pipe.wav"
    subprocess.Popen(["sh", cmd, path])
"""

@hook.subscribe.client_new
def new_client(client):
    proceso(efectos["abrir_ventana"])
    guardarLog("ventana abierta")

@hook.subscribe.client_killed
def client_killed(client):
    proceso(efectos["cerrar_ventana"])
    guardarLog("ventana cerrada")

@hook.subscribe.float_change
def float_change():
    proceso(efectos["float_change"])
    guardarLog("float change")

"""
@hook.subscribe.group_window_add
def group_window_add(group, window):
    guardarLog("Ventana añadida a un grupo.")
    if compararGrupo(group.name):
        proceso(efectos["group_window_add"])
"""

@hook.subscribe.shutdown
def shutdown():
    borrarLog()
    proceso(efectos["error"])

"""
@hook.subscribe.current_screen_change
def current_screen_change(client):
    path = sonidos + "egg_pop.wav"
    proceso(path)


@hook.subscribe.client_managed
def client_managed(client):
    path = sonidos + "mario_pipe.wav"
    proceso(path)
"""
