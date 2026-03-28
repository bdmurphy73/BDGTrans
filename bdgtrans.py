#!/usr/bin/env python3
# BDGTrans.py - GIMP Python-Fu Extension for AI Translation
# Translates text layers using a local AI model
# Repository: https://github.com/bdmurphy73/BDGTrans

from gimp import pdb, user_feedback
import gimpshelf
import json
import os
import urllib2
import urllib
import sys

CONFIG_FILE = "BTGTrans.json"

def get_config_dir():
    return os.path.expanduser("~/.config/gimp")

def get_config_path():
    return os.path.join(get_config_dir(), CONFIG_FILE)

def get_default_config():
    return {
        "server": "http://localhost:11434",
        "model": "llama3"
    }

def load_config():
    config_path = get_config_path()
    if os.path.exists(config_path):
        try:
            with open(config_path, 'r') as f:
                return json.load(f)
        except:
            pass
    return get_default_config()

def save_config(config):
    config_dir = get_config_dir()
    if not os.path.exists(config_dir):
        os.makedirs(config_dir)
    config_path = get_config_path()
    with open(config_path, 'w') as f:
        json.dump(config, f, indent=2)

def test_connection(server, model):
    try:
        url = "{}/api/generate".format(server.rstrip('/'))
        data = json.dumps({
            "model": model,
            "prompt": "test",
            "stream": False
        })
        req = urllib2.Request(url, data, {'Content-Type': 'application/json'})
        response = urllib2.urlopen(req, timeout=10)
        return response.code == 200
    except Exception as e:
        pdb.gimp_message("Connection test failed: {}".format(str(e)))
        return False

def translate_text(text, target_lang, server, model):
    prompt = (
        "You are a professional translator. Translate the following English text to {}. "
        "Preserve the intent and meaning of the message rather than doing a literal word-for-word translation. "
        "Output ONLY the translated text, nothing else.\n\nText: {}".format(target_lang, text)
    )
    
    try:
        url = "{}/api/generate".format(server.rstrip('/'))
        data = json.dumps({
            "model": model,
            "prompt": prompt,
            "stream": False
        })
        req = urllib2.Request(url, data, {'Content-Type': 'application/json'})
        response = urllib2.urlopen(req, timeout=60)
        result = json.loads(response.read())
        
        if 'response' in result:
            return result['response'].strip()
        else:
            pdb.gimp_message("Unexpected response format from AI server")
            return text
    except Exception as e:
        pdb.gimp_message("Translation failed: {}".format(str(e)))
        return text

def bdgtrans_translate(img, layer, target_lang):
    config = load_config()
    server = config.get("server", "http://localhost:11434")
    model = config.get("model", "llama3")
    
    if not test_connection(server, model):
        pdb.gimp_message("Cannot connect to AI server. Please check configuration.")
        return
    
    pdb.gimp_progress_init("Translating text...", -1)
    
    text = pdb.gimp_text_layer_get_text(layer)
    name = pdb.gimp_item_get_name(layer)
    
    translated_text = translate_text(text, target_lang, server, model)
    
    new_layer = pdb.gimp_layer_copy(layer, TRUE)
    pdb.gimp_image_add_layer(img, new_layer, -1)
    pdb.gimp_text_layer_set_text(new_layer, translated_text)
    pdb.gimp_item_set_name(new_layer, "{} ({})".format(name, target_lang))
    pdb.gimp_item_set_visible(layer, FALSE)
    pdb.gimp_item_set_visible(new_layer, TRUE)
    
    pdb.gimp_displays_flush()
    pdb.gimp_progress_end()

def bdgtrans_configure():
    config = load_config()
    
    server = pdb.gimp_get_data("bdgtrans_server") or config.get("server", "http://localhost:11434")
    model = pdb.gimp_get_data("bdgtrans_model") or config.get("model", "llama3")
    
    pdb.gimp_message("BDGTrans Configuration\n\n"
                     "Current Server: {}\n"
                     "Current Model: {}\n\n"
                     "Please edit the config file at: {}".format(
                         server, model, get_config_path()))

def bdgtrans_configure_manual():
    config = load_config()
    
    pdb.gimp_message("Current configuration:\n"
                     "Server: {}\n"
                     "Model: {}".format(
                         config.get("server"), 
                         config.get("model")))
    
    save_config(config)
    pdb.gimp_message("Configuration saved to: {}".format(get_config_path()))

register(
    "bdgtrans_translate",
    "Translate Text Layer using AI",
    "Translates a text layer to the selected language using a local AI model",
    "BDGTrans",
    "Copyright 2024",
    "2024",
    "<Image>/Filters/BDGTrans/Translate Text...",
    "RGB*, GRAY*",
    [
        (PF_IMAGE, "image", "Input image", None),
        (PF_DRAWABLE, "layer", "Input layer", None),
        (PF_OPTION, "target_lang", "Target Language", 0, 
         ["Spanish", "German", "Russian", "French", "Chinese"])
    ],
    [],
    bdgtrans_translate,
    menu="<Image>/Filters/BDGTrans"
)

register(
    "bdgtrans_configure",
    "Configure BDGTrans",
    "Configure AI server and model settings",
    "BDGTrans",
    "Copyright 2024",
    "2024",
    "<Image>/Filters/BDGTrans/Configure...",
    "",
    [],
    [],
    bdgtrans_configure,
    menu="<Image>/Filters/BDGTrans"
)

main()
