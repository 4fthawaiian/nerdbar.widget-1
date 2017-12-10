#
# ──────────────────────────────────────────────────────────── I ──────────
#   :::::: B A C K G R O U N D : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────────────────
#

  command: "echo " +
           "$(cat ~/.cache/wal/colors.json):::"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 10000

  update: ( output ) ->
    output = output.split( /:::/g )
    wal = JSON.parse output[0]
    $('#nerdbar-widget-background-coffee').css({ 'background-color': wal.special.background })

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    ""

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    bottom: 0px
    left: 0px
    right: 0px
    height: 20px
    opacity: 0.725
    z-index: -1
  """

# ──────────────────────────────────────────────────────────────────────────────
