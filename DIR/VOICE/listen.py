#!/usr/bin/env python
#http://www.saltycrane.com/blog/2011/04/how-use-bash-shell-python-subprocess-instead-binsh/
import gi
gi.require_version('Gst', '0.10')
from gi.repository import GObject, Gst
import threading
import subprocess

# Here's where you edit the vocabulary.
# Point these variables to your *.lm and *.dic files. A default exists,
# but new models can be created for better accuracy. See instructions at:
# http://cmusphinx.sourceforge.net/wiki/tutoriallm
LM_PATH = 'TMP/config/1.lm'
DICT_PATH = 'TMP/config/1.dic'

# Initialize GST
GObject.threads_init()
Gst.init(None)

def robot(text):
    t = text.lower()
  #  cmd = 'robot'
    #cmd="/tmp/service.sh robot1 %s" % t
    cmd="./shahar.sh %s" % t
    subprocess.call(cmd, shell=True, executable='/bin/bash')


def asr_partial_result(asr, text, uttid):
    """ This function is called when pocketsphinx gets a partial
        transcription of spoken audio.
    """
    print '----------'
    print '[ partial ]', text
    #print  "text:", text
    #print "uttid", uttid
    print '----------'
    robot(text)
    #robot(text)

def asr_result(asr, text, uttid):
    """ This function is called when pocketsphinx gets a
        full result (spoken command with a pause)
    """
#    print "ASR result", uttid, ":", text

    print '----------'
    print '[ bingo ]', text
    #print  "text:", text
    #print "uttid", uttid
    print '----------'
    #robo
    robot(text)
    #    #is there a matching command?
    #    if self.commands.has_key( t ):
    #        cmd = self.commands[t]
    #        print cmd
    #        subprocess.call(cmd, shell=True)
    #        self.log_history(text)

# This sets up our pipeline from pulseaudio (input)
# through the vader and into pocketsphinx.
pipeline = Gst.parse_launch('pulsesrc ! audioconvert ! audioresample '
                             + '! vader name=vad auto-threshold=true '
                             + '! pocketsphinx name=asr ! fakesink')

# Connect our callbacks to pocketsphinx
asr = pipeline.get_by_name('asr')
#asr.connect('partial_result', asr_partial_result)
asr.connect('result', asr_result)

# Optional: set the language model and dictionary.
if LM_PATH and DICT_PATH:
  asr.set_property('lm', LM_PATH)
  asr.set_property('dict', DICT_PATH)

# Now tell gstreamer and pocketsphinx to start converting speech!
asr.set_property('configured', True)
pipeline.set_state(Gst.State.PLAYING)

# This loops the program until Ctrl+C is pressed
g_loop = threading.Thread(target=GObject.MainLoop().run)
g_loop.daemon = False
g_loop.start()
#robot('yes')
